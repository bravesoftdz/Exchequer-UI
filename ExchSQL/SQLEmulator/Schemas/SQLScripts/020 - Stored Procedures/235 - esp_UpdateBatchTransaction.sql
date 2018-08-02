
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[!ActiveSchema!].[esp_UpdateBatchTransaction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [!ActiveSchema!].esp_UpdateBatchTransaction
GO

CREATE PROCEDURE !ActiveSchema!.esp_UpdateBatchTransaction ( @iv_BatchDocumentReference VARCHAR(10)
                                                  , @iv_LoginName      VARCHAR(20) = '' )
AS
BEGIN

  SET NOCOUNT ON;

  --DECLARE @iv_AutoPositionId INT = 3034

  -- Declare Constants

  DECLARE @c_Today          VARCHAR(8)
        , @c_MaxDate        VARCHAR(8) = '20491231'
        , @c_True           BIT = 1
        , @c_False          BIT = 0
        , @c_BaseCurrencyId INT = 0
        , @c_YTDPeriod      INT = 254
        , @c_CTDPeriod      INT = 255

  SET @c_Today = CONVERT(VARCHAR(8), GETDATE(), 112)  

  DECLARE @AutoTransactionType  VARCHAR(3)
        , @FolioType            VARCHAR(3)
        , @ss_VATScheme         VARCHAR(1)
        , @ss_AuthorisationMode VARCHAR(1)
        , @ss_NoOfPeriodsInYear INT
        , @ss_VATNextPeriod     VARCHAR(8)
        , @ss_NoOfDPQuantity    INT
        , @ss_NoOfDPNet         INT
        , @ss_NoOfDPCost        INT
        , @ss_JobCostingEnabled BIT = 0

        , @NewHeaderpositionId  INT

  -- Get System Settings

  SELECT @ss_AuthorisationMode = AuthorisationMode
       , @ss_NoOfPeriodsInYear = NoOfPeriodsInYear
       , @ss_NoOfDPQuantity    = NoOfDPQuantity
       , @ss_NoOfDPNet         = NoOfDPNet
       , @ss_NoOfDPCost        = NoOfDPCost

  FROM   !ActiveSchema!.evw_SystemSettings SS

  -- Get VAT System Settings

  SELECT @ss_VATScheme     = VATScheme
       , @ss_VATNextPeriod = VATNextPeriod
  FROM   !ActiveSchema!.evw_VATSystemSettings VAT

  -- Determine whether job Costing is enabled
  SELECT @ss_JobCostingEnabled   = ISNULL((SELECT 1 
                                           FROM common.etb_Information CI
                                           WHERE CI.InformationName = 'Job Costing' 
                                           AND UPPER(CI.InformationValue) IN ('Y','1','TRUE') ), 0)

  -- Set original batch document as 'Posted'
    
  UPDATE DOC
     SET thRunNo = -11
    FROM !ActiveSchema!.DOCUMENT DOC
   WHERE DOC.thOurRef = @iv_BatchDocumentReference
  
  -- Update the batched documents

  UPDATE DOC
     SET thRunNo                      = 0
       , thNomAuto                    = 1
       , thVATPostDate                = CASE
                                        WHEN TT.TransactionTypeCode IN ('SRF','SRI','PRF','PRI') AND @ss_VATScheme = 'N' THEN @ss_VATNextPeriod
                                        ELSE thVATPostDate
                                        END
       , thCompanyRate                = CASE
                                        WHEN TT.TransactionTypeCode NOT IN ('SRF','SRI','PRF','PRI') THEN 0
                                        WHEN TT.TransactionTypeCode NOT IN ('NOM', 'NMT') THEN C.CompanyRate
                                        ELSE DOC.thCompanyRate
                                        END
       , thDailyRate                  = CASE
                                        WHEN TT.TransactionTypeCode NOT IN ('NOM', 'NMT') THEN C.DailyRate
                                        ELSE DOC.thDailyRate
                                        END
       , thOutstanding                = CASE
                                        WHEN TT.TransactionTypeCode IN ('PIN', 'PCR', 'PJI', 'PJC', 'PPY', 'SIN', 'SCR', 'SJI', 'SJC', 'SRC') THEN thCustSupp
                                        ELSE CHAR(0)
                                        END
       , thUntilDate                  = CASE
                                        WHEN TT.TransactionTypeCode IN ('SRF','SRI','PRF','PRI') AND @ss_VATScheme = 'N' THEN CONVERT(VARCHAR(8), GETDATE(), 112)
                                        WHEN TT.TransactionTypeCode IN ('PIN', 'PCR', 'PJI', 'PJC', 'PPY', 'SIN', 'SCR', 'SJI', 'SJC', 'SRC') THEN CHAR(255)
                                        ELSE ''
                                        END
       , thOperator                   = @iv_LoginName 
       , thCurrencyTriRate            = CASE
                                        WHEN TT.TransactionTypeCode NOT IN ('NOM', 'NMT') THEN ISNULL(C.TriRate, 0)
                                        ELSE DOC.thCurrencyTriRate
                                        END
       , thCurrencyTriEuro            = CASE
                                        WHEN TT.TransactionTypeCode NOT IN ('NOM', 'NMT') THEN ISNULL(C.TriCurrencyCode, 0)
                                        ELSE DOC.thCurrencyTriEuro
                                        END
       , thCurrencyTriInvert          = CASE
                                        WHEN TT.TransactionTypeCode NOT IN ('NOM', 'NMT') THEN C.TriInverted
                                        ELSE DOC.thCurrencyTriInvert
                                        END
       , thCurrencyTriFloat           = CASE
                                        WHEN TT.TransactionTypeCode NOT IN ('NOM', 'NMT') THEN C.IsFloating
                                        ELSE DOC.thCurrencyTriFloat
                                        END
       , thAuthorisedAmnt             = CASE
                                        WHEN @ss_AuthorisationMode = 'A' AND HS.OnHold = 0 THEN 0
                                        ELSE DOC.thAuthorisedAmnt
                                        END
       , thOriginator                 = @iv_LoginName

  FROM !ActiveSchema!.DOCUMENT DOC
  JOIN common.evw_TransactionType TT ON DOC.thDocType = Tt.TransactionTypeId
  LEFT JOIN !ActiveSchema!.CUSTSUPP CS ON DOC.thAcCode   = CS.acCode
  LEFT JOIN !ActiveSchema!.CURRENCY C  ON DOC.thCurrency = C.CurrencyCode
  LEFT JOIN common.evw_HoldStatus HS ON DOC.thHoldFlag = HS.HoldStatusId
  
  WHERE DOC.thBatchLinkTrans = @iv_BatchDocumentReference
 
  -- Insert JobDet Records if required
  IF ( @ss_JobCostingEnabled = 1
  AND  EXISTS ( SELECT TOP 1 1
                FROM   !ActiveSchema!.DETAILS DTL
                JOIN !ActiveSchema!.DOCUMENT DOC ON DOC.thFolioNum = DTL.tlFolioNum
 
                WHERE DOC.thBatchLinkTrans = @iv_BatchDocumentReference
                AND   DTL.tlJobCode <> ''
              )
     )
  BEGIN
  
    INSERT INTO !ActiveSchema!.JOBDET
         ( RecPfix
         , SubType
         , var_code1
         , var_code2
         , var_code3
         , var_code4
         , var_code5
         , var_code6
         , var_code7
         , var_code8
         , var_code9
         , var_code10
         , Posted
         , LineFolio
         , LineNUmber
         , LineORef
         , JobCode
         , StockCode
         , JDate
         , Qty
         , Cost
         , Charge
         , Invoiced
         , InvRef
         , EmplCode
         , JAType
         , PostedRun
         , [Reverse]
         , ReconTS
         , Reversed
         , JDDT
         , CurrCharge
         , ActCCode
         , HoldFlg
         , Post2Stk
         , PCRates1
         , PCRates2
         , Tagged
         , OrigNCode
         , JUseORate
         , PCTriRates
         , PCTriEuro
         , PCTriInvert
         , PCTriFloat
         , PC_tri_Spare
         , JPriceMulX
         , UpliftTotal
         , UpliftGL
         
         )
    SELECT RecPfix      = 'J'                                                                  
         , SubType      = 'E'                                                                 
         , var_code1    = 0x15 
                        + CONVERT(VARBINARY(22), CONVERT(CHAR(10), DTL.tlJobCode))
                        + 0x000100
                        + CONVERT(VARBINARY(22), CONVERT(CHAR(8), DOC.thTransDate))
         , var_code2    = CONVERT(VARBINARY(3), 0x000000)
         , var_code3    = CONVERT(VARBINARY(21), 0x000000000000000000000000000000000000000000)
         , var_code4    = ''
         , var_code5    = DTL.tlAnalysisCode                                                    
         , var_code6    = CONVERT(VARBINARY(22), 0x00000000000000000000000000000000000000000000)
         , var_code7    = 0x1600000000 
                        + CONVERT(VARBINARY(22), CONVERT(CHAR(10), DTL.tlJobCode))
                        + CONVERT(VARBINARY(22), CONVERT(CHAR(8), DOC.thTransDate))
         , var_code8    = 0x09
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlFolioNum), 4, 1)
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlFolioNum), 3, 1)
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlFolioNum), 2, 1)
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlFolioNum), 1, 1)
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlABSLineNo), 4, 1)
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlABSLineNo), 3, 1)
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlABSLineNo), 2, 1)
                        + SUBSTRING(CONVERT(VARBINARY(4), DTL.tlABSLineNo), 1, 1)
                        + CONVERT(VARBINARY(1), '!')
                        + 0x0000000000000000000
         , var_code9    = CONVERT(VARBINARY(15), 0x000000000000000000000000000000)
         , var_code10   = CONVERT(VARBINARY(1), DTL.tlCurrency)
                        + CONVERT(VARBINARY(1), DTL.tlYear)
                        + CONVERT(VARBINARY(1), DTL.tlPeriod)                                       
         , Posted       = 0
         , LineFolio    = DTL.tlFolioNum
         , LineNUmber   = DTL.tlABSLineNo                                                     
         , LineORef     = DTL.tlOurRef
         , JobCode      = DTL.tlJobCode                                                        
         , StockCode    = common.GetString(DTL.tlStockCode, 1)                                 
         , JDate        = DOC.thTransDate                                                      
         , Qty          = TL.LineQuantity
         , Cost         = TL.PricePerUnit
         , Charge       = CASE                  -- May need to convert this to charge currency??
                          WHEN J.ChargeType = 3 THEN common.efn_ExchequerRoundUp(TL.LineQuantity * TL.PricePerUnit, 2)
                          WHEN J.ChargeType = 1 AND common.GetString(DTL.tlStockCode, 1) <> '' 
                          THEN TL.LineQuantity * !ActiveSchema!.efn_StockDiscount( common.GetString(DTL.tlStockCode, 1)
                                                                           , DTL.tlLocation
                                                                           , DOC.thAcCode
                                                                           , DOC.thTransDate
                                                                           , DOC.thTransDate
                                                                           , DTL.tlCurrency
                                                                           , TL.LineQuantityOutstanding
                                                                           , TL.LineQuantityMultiplier
                                                                           )
                          ELSE 0
                          END
         , Invoiced     = 0
         , InvRef       = ''
         , EmplCode     = CASE
                          WHEN TT.TransactionTypeCode = 'TSH' THEN DOC.thBatchLinkTrans
                          ELSE ''
                          END
         , JAType       = ISNULL(JA.JobAnalysisCategoryId, '')                                 
         , PostedRun    = 0
         , [Reverse]    = 0
         , ReconTS      = 0
         , Reversed     = 0
         , JDDT         = DTL.tlDocType                                                        
         , CurrCharge   = CASE
                          WHEN TT.TransactionTypeCode = 'TSH' THEN DTL.tlRecStatus
                          ELSE J.FixedPriceCurrency
                          END
         , ActCCode     = DTL.tlAcCode                                                         
         , HoldFlg      = 0
         , Post2Stk     = 0
         , PCRates1     = 0
         , PCRates2     = 0
         , Tagged       = 0
         , OrigNCode    = DTL.tlGLCode                                                         
         , JUseORate    = DTL.tlUseOriginalRates                                               
         , PCTriRates   = 0
         , PCTriEuro    = 0
         , PCTriInvert  = 0
         , PCTriFloat   = 0
         , PC_tri_Spare = CONVERT(VARBINARY(10), 0x00000000000000000000)
         , JPriceMulX   = DTL.tlPriceMultiplier                                               
         , UpliftTotal  = 0
         , UpliftGL     = 0

        -- , ChargeType   = J.ChargeType
                   
    FROM !ActiveSchema!.DETAILS DTL
    JOIN !ActiveSchema!.DOCUMENT DOC ON DOC.thFolioNum = DTL.tlFolioNum
    JOIN common.evw_TransactionType TT ON DOC.thDocType = TT.TransactionTypeId

    LEFT JOIN !ActiveSchema!.evw_Job         J  ON DTL.tlJobCode      = J.JobCode
    LEFT JOIN !ActiveSchema!.evw_JobAnalysis JA ON DTL.tlAnalysisCode = JA.JobAnalysisCode

    LEFT JOIN !ActiveSchema!.evw_TransactionLine TL ON TL.LinePositionId = DTl.PositionId

    WHERE DOC.thBatchLinkTrans = @iv_BatchDocumentReference
    AND   DTL.tlJobCode <> ''

  END
  
  -- Update Trader History for each of Batched Documents

  DECLARE @BatchedPositionId INT

  DECLARE curBatchedTrans CURSOR LOCAL FAST_FORWARD
      FOR SELECT PositionId
          FROM !ActiveSchema!.DOCUMENT DOC
          WHERE DOC.thBatchLinkTrans = @iv_BatchDocumentReference
          AND   DOC.thAcCode <> ''

  OPEN curBatchedTrans

  FETCH NEXT FROM curBatchedTrans INTO @BatchedPositionId 

  WHILE @@FETCH_STATUS = 0
  BEGIN

    EXEC !ActiveSchema!.esp_UpdateTraderHistory @iv_Mode       = 2
                                     , @iv_PositionId = @BatchedPositionId

    FETCH NEXT FROM curBatchedTrans INTO @BatchedPositionId
  END        

  CLOSE curBatchedTrans
  DEALLOCATE curBatchedTrans

  
END

GO