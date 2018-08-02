unit SQLReorderQuery;

interface

const
  // Query to amend the 'raw' order of transactions (i.e. based on PositionId)
  // so that it matches the Transaction Date order. See SQLReorder.pas
  //
  // This is an array of strings because a literal string of this length results
  // in a Delphi compiler error (even if unnecessary spaces are removed).
  SQL_REORDER_TRANSACTIONS: array[0..481] of string =
  (
    '-- Only run code if anything to resequence',
    'IF EXISTS(SELECT TOP 1 1',
    '          FROM  [COMPANY].DOCUMENT D',
    '          JOIN  (SELECT NewPositionId = ROW_NUMBER() OVER (ORDER BY thTransDate, thFolioNum)',
    '                      , thFolioNum',
    '                      , thTransDate',
    '                      , PositionId',
    '                 FROM [COMPANY].DOCUMENT) D1 ON D.PositionId = D1.PositionId',
    '          WHERE D.PositionId <> D1.NewPositionId)',
    'BEGIN',
    '  DECLARE @OutCount INT = 0',
    '        , @InCount  INT = 0',
    '',
    '  -- If Exists DROP TMP_DOCUMENT',
    '  IF OBJECT_ID(''[COMPANY].TMP_DOCUMENT'') IS NOT NULL',
    '     DROP TABLE [COMPANY].TMP_DOCUMENT',
    '',
    '  -- Load Data into Temp. Table',
    '  RAISERROR(''Loading DOCUMENT data into temp. table ...'', 1, 1) WITH NOWAIT;',
    '',
    '  SELECT *',
    '  INTO [COMPANY].TMP_DOCUMENT',
    '  FROM [COMPANY].DOCUMENT',
    '',
    '  SELECT @OutCount = @@ROWCOUNT',
    '',
    '  RAISERROR(''Adding new column to temp. table ...'', 1, 1) WITH NOWAIT;',
    '  -- Add new column for new position',
    '  ALTER TABLE [COMPANY].TMP_DOCUMENT ADD NewPositionId INT',
    '',
    '  RAISERROR(''Setting new column in temp. table ...'', 1, 1) WITH NOWAIT;',
    '  -- Set new position id',
    '  UPDATE D SET NewPositionId = D1.NewPositionId',
    '  FROM  [COMPANY].TMP_DOCUMENT D',
    '  JOIN  (SELECT NewPositionId = ROW_NUMBER() OVER (ORDER BY thTransDate, thFolioNum)',
    '              , thFolioNum',
    '              , thTransDate',
    '              , PositionId',
    '         FROM [COMPANY].DOCUMENT) D1 ON D.PositionId = D1.PositionId',
    '',
    '  -- Drop Identity Column from temp. table',
    '  RAISERROR(''Dropping Identity column on temp. table ...'', 1, 1) WITH NOWAIT;',
    '  ALTER TABLE [COMPANY].TMP_DOCUMENT DROP COLUMN PositionId',
    '',
    '  -- rename New Column to old column name on temp table',
    '  RAISERROR(''Renaming new column in temp. table ...'', 1, 1) WITH NOWAIT;',
    '  EXEC sp_rename ''[COMPANY].TMP_DOCUMENT.NewPositionId'', ''PositionId'', ''COLUMN''',
    '',
    '  -- Remove old data',
    '  RAISERROR(''Deleting data from DOCUMENT table ...'', 1, 1) WITH NOWAIT;',
    '  TRUNCATE TABLE [COMPANY].DOCUMENT',
    '',
    '  -- Reload table with data from temp. table',
    '  RAISERROR(''Reloading DOCUMENT data from temp. table ...'', 1, 1) WITH NOWAIT;',
    '  SET IDENTITY_INSERT [COMPANY].DOCUMENT ON;',
    '',
    '  INSERT INTO [COMPANY].DOCUMENT',
    '          ( [thRunNo]',
    '          , [thAcCode]',
    '          , [thNomAuto]',
    '          , [thOurRef]',
    '          , [thFolioNum]',
    '          , [thCurrency]',
    '          , [thYear]',
    '          , [thPeriod]',
    '          , [thDueDate]',
    '          , [thVATPostDate]',
    '          , [thTransDate]',
    '          , [thCustSupp]',
    '          , [thCompanyRate]',
    '          , [thDailyRate]',
    '          , [thOldYourRef]',
    '          , [thBatchLink]',
    '          , [thOutstanding]',
    '          , [thNextLineNumber]',
    '          , [thNextNotesLineNumber]',
    '          , [thDocType]',
    '          , [thVATAnalysisStandard]',
    '          , [thVATAnalysisExempt]',
    '          , [thVATAnalysisZero]',
    '          , [thVATAnalysisRate1]',
    '          , [thVATAnalysisRate2]',
    '          , [thVATAnalysisRate3]',
    '          , [thVATAnalysisRate4]',
    '          , [thVATAnalysisRate5]',
    '          , [thVATAnalysisRate6]',
    '          , [thVATAnalysisRate7]',
    '          , [thVATAnalysisRate8]',
    '          , [thVATAnalysisRate9]',
    '          , [thVATAnalysisRateT]',
    '          , [thVATAnalysisRateX]',
    '          , [thVATAnalysisRateB]',
    '          , [thVATAnalysisRateC]',
    '          , [thVATAnalysisRateF]',
    '          , [thVATAnalysisRateG]',
    '          , [thVATAnalysisRateR]',
    '          , [thVATAnalysisRateW]',
    '          , [thVATAnalysisRateY]',
    '          , [thVATAnalysisRateIAdj]',
    '          , [thVATAnalysisRateOAdj]',
    '          , [thVATAnalysisRateSpare]',
    '          , [thNetValue]',
    '          , [thTotalVAT]',
    '          , [thSettleDiscPerc]',
    '          , [thSettleDiscAmount]',
    '          , [thTotalLineDiscount]',
    '          , [thSettleDiscDays]',
    '          , [thSettleDiscTaken]',
    '          , [thAmountSettled]',
    '          , [thAutoIncrement]',
    '          , [thUntilYear]',
    '          , [thUntilPeriod]',
    '          , [thTransportNature]',
    '          , [thTransportMode]',
    '          , [thRemitNo]',
    '          , [thAutoIncrementType]',
    '          , [thHoldFlag]',
    '          , [thAuditFlag]',
    '          , [thTotalWeight]',
    '          , [thDeliveryAddr1]',
    '          , [thDeliveryAddr2]',
    '          , [thDeliveryAddr3]',
    '          , [thDeliveryAddr4]',
    '          , [thDeliveryAddr5]',
    '          , [thVariance]',
    '          , [thTotalOrdered]',
    '          , [thTotalReserved]',
    '          , [thTotalCost]',
    '          , [thTotalInvoiced]',
    '          , [thLongYourRef]',
    '          , [thUntilDate]',
    '          , [thNOMVATIO]',
    '          , [thExternal]',
    '          , [thPrinted]',
    '          , [thRevalueAdj]',
    '          , [thCurrSettled]',
    '          , [thSettledVAT]',
    '          , [thVATClaimed]',
    '          , [thBatchGL]',
    '          , [thAutoPost]',
    '          , [thManualVAT]',
    '          , [thDeliveryTerms]',
    '          , [thIncludeInPickingRun]',
    '          , [thOperator]',
    '          , [thNoLabels]',
    '          , [thTagged]',
    '          , [thPickingRunNo]',
    '          , [thOrdMatch]',
    '          , [thDeliveryNoteRef]',
    '          , [thVATCompanyRate]',
    '          , [thVATDailyRate]',
    '          , [thOriginalCompanyRate]',
    '          , [thOriginalDailyRate]',
    '          , [PostDiscAm]',
    '          , [thSpareNomCode]',
    '          , [thPostDiscTaken]',
    '          , [thControlGL]',
    '          , [thJobCode]',
    '          , [thAnalysisCode]',
    '          , [thTotalOrderOS]',
    '          , [thAppDepartment]',
    '          , [thAppCostCentre]',
    '          , [thUserField1]',
    '          , [thUserField2]',
    '          , [thLineTypeAnalysis1]',
    '          , [thLineTypeAnalysis2]',
    '          , [thLineTypeAnalysis3]',
    '          , [thLineTypeAnalysis4]',
    '          , [thLineTypeAnalysis5]',
    '          , [thLineTypeAnalysis6]',
    '          , [thLastDebtChaseLetter]',
    '          , [thBatchNow]',
    '          , [thBatchThen]',
    '          , [thUnTagged]',
    '          , [thOriginalBaseValue]',
    '          , [thUseOriginalRates]',
    '          , [thOldCompanyRate]',
    '          , [thOldDailyRate]',
    '          , [thFixedRate]',
    '          , [thUserField3]',
    '          , [thUserField4]',
    '          , [thProcess]',
    '          , [thSource]',
    '          , [thCurrencyTriRate]',
    '          , [thCurrencyTriEuro]',
    '          , [thCurrencyTriInvert]',
    '          , [thCurrencyTriFloat]',
    '          , [thCurrencyTriSpare]',
    '          , [thVATTriRate]',
    '          , [thVATTriEuro]',
    '          , [thVATTriInvert]',
    '          , [thVATTriFloat]',
    '          , [thVATTriSpare]',
    '          , [thOriginalTriRate]',
    '          , [thOriginalTriEuro]',
    '          , [thOriginalTriInvert]',
    '          , [thOriginalTriFloat]',
    '          , [thOriginalTriSpare]',
    '          , [thOldOriginalTriRate]',
    '          , [thOldOriginalTriEuro]',
    '          , [thOldOriginalTriInvert]',
    '          , [thOldOriginalTriFloat]',
    '          , [thOldOriginalTriSpare]',
    '          , [thPostedDate]',
    '          , [thPORPickSOR]',
    '          , [thBatchDiscAmount]',
    '          , [thPrePost]',
    '          , [thAuthorisedAmnt]',
    '          , [thTimeChanged]',
    '          , [thTimeCreated]',
    '          , [thCISTaxDue]',
    '          , [thCISTaxDeclared]',
    '          , [thCISManualTax]',
    '          , [thCISDate]',
    '          , [thTotalCostApportioned]',
    '          , [thCISEmployee]',
    '          , [thCISTotalGross]',
    '          , [thCISSource]',
    '          , [thTimesheetExported]',
    '          , [thCISExcludedFromGross]',
    '          , [thWeekMonth]',
    '          , [thWorkflowState]',
    '          , [thOverrideLocation]',
    '          , [thSpare5]',
    '          , [thYourRef]',
    '          , [PositionId]',
    '          , [thUserField5]',
    '          , [thUserField6]',
    '          , [thUserField7]',
    '          , [thUserField8]',
    '          , [thUserField9]',
    '          , [thUserField10]',
    '          , [thDeliveryPostCode]',
    '          , [thOriginator]',
    '          , [thCreationTime]',
    '          , [thCreationDate]',
    '          , [thOrderPaymentOrderRef]',
    '          , [thOrderPaymentElement]',
    '          , [thOrderPaymentFlags]',
    '          , [thCreditCardType]',
    '          , [thCreditCardNumber]',
    '          , [thCreditCardExpiry]',
    '          , [thCreditCardAuthorisationNo]',
    '          , [thCreditCardReferenceNo]',
    '          , [thCustomData1]',
    '          , [thDeliveryCountry]',
    '          , [thPPDPercentage]',
    '          , [thPPDDays]',
    '          , [thPPDGoodsValue]',
    '          , [thPPDVATValue]',
    '          , [thPPDTaken]',
    '          , [thPPDCreditNote]',
    '          , [thBatchPayPPDStatus]',
    '          , [thIntrastatOutOfPeriod]',
    '          , [thUserField11]',
    '          , [thUserField12]',
    '          , [thTaxRegion]',
    '          , [thAnonymised]',
    '          , [thAnonymisedDate]',
    '          , [thAnonymisedTime]',
    '          )',
    '     SELECT [thRunNo]',
    '          , [thAcCode]',
    '          , [thNomAuto]',
    '          , [thOurRef]',
    '          , [thFolioNum]',
    '          , [thCurrency]',
    '          , [thYear]',
    '          , [thPeriod]',
    '          , [thDueDate]',
    '          , [thVATPostDate]',
    '          , [thTransDate]',
    '          , [thCustSupp]',
    '          , [thCompanyRate]',
    '          , [thDailyRate]',
    '          , [thOldYourRef]',
    '          , [thBatchLink]',
    '          , [thOutstanding]',
    '          , [thNextLineNumber]',
    '          , [thNextNotesLineNumber]',
    '          , [thDocType]',
    '          , [thVATAnalysisStandard]',
    '          , [thVATAnalysisExempt]',
    '          , [thVATAnalysisZero]',
    '          , [thVATAnalysisRate1]',
    '          , [thVATAnalysisRate2]',
    '          , [thVATAnalysisRate3]',
    '          , [thVATAnalysisRate4]',
    '          , [thVATAnalysisRate5]',
    '          , [thVATAnalysisRate6]',
    '          , [thVATAnalysisRate7]',
    '          , [thVATAnalysisRate8]',
    '          , [thVATAnalysisRate9]',
    '          , [thVATAnalysisRateT]',
    '          , [thVATAnalysisRateX]',
    '          , [thVATAnalysisRateB]',
    '          , [thVATAnalysisRateC]',
    '          , [thVATAnalysisRateF]',
    '          , [thVATAnalysisRateG]',
    '          , [thVATAnalysisRateR]',
    '          , [thVATAnalysisRateW]',
    '          , [thVATAnalysisRateY]',
    '          , [thVATAnalysisRateIAdj]',
    '          , [thVATAnalysisRateOAdj]',
    '          , [thVATAnalysisRateSpare]',
    '          , [thNetValue]',
    '          , [thTotalVAT]',
    '          , [thSettleDiscPerc]',
    '          , [thSettleDiscAmount]',
    '          , [thTotalLineDiscount]',
    '          , [thSettleDiscDays]',
    '          , [thSettleDiscTaken]',
    '          , [thAmountSettled]',
    '          , [thAutoIncrement]',
    '          , [thUntilYear]',
    '          , [thUntilPeriod]',
    '          , [thTransportNature]',
    '          , [thTransportMode]',
    '          , [thRemitNo]',
    '          , [thAutoIncrementType]',
    '          , [thHoldFlag]',
    '          , [thAuditFlag]',
    '          , [thTotalWeight]',
    '          , [thDeliveryAddr1]',
    '          , [thDeliveryAddr2]',
    '          , [thDeliveryAddr3]',
    '          , [thDeliveryAddr4]',
    '          , [thDeliveryAddr5]',
    '          , [thVariance]',
    '          , [thTotalOrdered]',
    '          , [thTotalReserved]',
    '          , [thTotalCost]',
    '          , [thTotalInvoiced]',
    '          , [thLongYourRef]',
    '          , [thUntilDate]',
    '          , [thNOMVATIO]',
    '          , [thExternal]',
    '          , [thPrinted]',
    '          , [thRevalueAdj]',
    '          , [thCurrSettled]',
    '          , [thSettledVAT]',
    '          , [thVATClaimed]',
    '          , [thBatchGL]',
    '          , [thAutoPost]',
    '          , [thManualVAT]',
    '          , [thDeliveryTerms]',
    '          , [thIncludeInPickingRun]',
    '          , [thOperator]',
    '          , [thNoLabels]',
    '          , [thTagged]',
    '          , [thPickingRunNo]',
    '          , [thOrdMatch]',
    '          , [thDeliveryNoteRef]',
    '          , [thVATCompanyRate]',
    '          , [thVATDailyRate]',
    '          , [thOriginalCompanyRate]',
    '          , [thOriginalDailyRate]',
    '          , [PostDiscAm]',
    '          , [thSpareNomCode]',
    '          , [thPostDiscTaken]',
    '          , [thControlGL]',
    '          , [thJobCode]',
    '          , [thAnalysisCode]',
    '          , [thTotalOrderOS]',
    '          , [thAppDepartment]',
    '          , [thAppCostCentre]',
    '          , [thUserField1]',
    '          , [thUserField2]',
    '          , [thLineTypeAnalysis1]',
    '          , [thLineTypeAnalysis2]',
    '          , [thLineTypeAnalysis3]',
    '          , [thLineTypeAnalysis4]',
    '          , [thLineTypeAnalysis5]',
    '          , [thLineTypeAnalysis6]',
    '          , [thLastDebtChaseLetter]',
    '          , [thBatchNow]',
    '          , [thBatchThen]',
    '          , [thUnTagged]',
    '          , [thOriginalBaseValue]',
    '          , [thUseOriginalRates]',
    '          , [thOldCompanyRate]',
    '          , [thOldDailyRate]',
    '          , [thFixedRate]',
    '          , [thUserField3]',
    '          , [thUserField4]',
    '          , [thProcess]',
    '          , [thSource]',
    '          , [thCurrencyTriRate]',
    '          , [thCurrencyTriEuro]',
    '          , [thCurrencyTriInvert]',
    '          , [thCurrencyTriFloat]',
    '          , [thCurrencyTriSpare]',
    '          , [thVATTriRate]',
    '          , [thVATTriEuro]',
    '          , [thVATTriInvert]',
    '          , [thVATTriFloat]',
    '          , [thVATTriSpare]',
    '          , [thOriginalTriRate]',
    '          , [thOriginalTriEuro]',
    '          , [thOriginalTriInvert]',
    '          , [thOriginalTriFloat]',
    '          , [thOriginalTriSpare]',
    '          , [thOldOriginalTriRate]',
    '          , [thOldOriginalTriEuro]',
    '          , [thOldOriginalTriInvert]',
    '          , [thOldOriginalTriFloat]',
    '          , [thOldOriginalTriSpare]',
    '          , [thPostedDate]',
    '          , [thPORPickSOR]',
    '          , [thBatchDiscAmount]',
    '          , [thPrePost]',
    '          , [thAuthorisedAmnt]',
    '          , [thTimeChanged]',
    '          , [thTimeCreated]',
    '          , [thCISTaxDue]',
    '          , [thCISTaxDeclared]',
    '          , [thCISManualTax]',
    '          , [thCISDate]',
    '          , [thTotalCostApportioned]',
    '          , [thCISEmployee]',
    '          , [thCISTotalGross]',
    '          , [thCISSource]',
    '          , [thTimesheetExported]',
    '          , [thCISExcludedFromGross]',
    '          , [thWeekMonth]',
    '          , [thWorkflowState]',
    '          , [thOverrideLocation]',
    '          , [thSpare5]',
    '          , [thYourRef]',
    '          , [PositionId]',
    '          , [thUserField5]',
    '          , [thUserField6]',
    '          , [thUserField7]',
    '          , [thUserField8]',
    '          , [thUserField9]',
    '          , [thUserField10]',
    '          , [thDeliveryPostCode]',
    '          , [thOriginator]',
    '          , [thCreationTime]',
    '          , [thCreationDate]',
    '          , [thOrderPaymentOrderRef]',
    '          , [thOrderPaymentElement]',
    '          , [thOrderPaymentFlags]',
    '          , [thCreditCardType]',
    '          , [thCreditCardNumber]',
    '          , [thCreditCardExpiry]',
    '          , [thCreditCardAuthorisationNo]',
    '          , [thCreditCardReferenceNo]',
    '          , [thCustomData1]',
    '          , [thDeliveryCountry]',
    '          , [thPPDPercentage]',
    '          , [thPPDDays]',
    '          , [thPPDGoodsValue]',
    '          , [thPPDVATValue]',
    '          , [thPPDTaken]',
    '          , [thPPDCreditNote]',
    '          , [thBatchPayPPDStatus]',
    '          , [thIntrastatOutOfPeriod]',
    '          , [thUserField11]',
    '          , [thUserField12]',
    '          , [thTaxRegion]',
    '          , [thAnonymised]',
    '          , [thAnonymisedDate]',
    '          , [thAnonymisedTime]',
    '  FROM [COMPANY].TMP_DOCUMENT',
    '',
    '  SELECT @InCount = @@ROWCOUNT',
    '',
    '  SET IDENTITY_INSERT [COMPANY].DOCUMENT OFF;',
    '',
    '  IF @InCount <> @OutCount',
    '  BEGIN',
    '     RAISERROR(''Rows extracted from DOCUMENT table do NOT equal Rows reloaded ... restore from backup and investigate.'', 16, 1) WITH NOWAIT;',
    '  END',
    '  ELSE  -- Only Drop temp. table if counts match',
    '  BEGIN',
    '     -- If temp. Table Exists Drop it',
    '     IF OBJECT_ID(''[COMPANY].TMP_DOCUMENT'') IS NOT NULL',
    '        DROP TABLE [COMPANY].TMP_DOCUMENT',
    '  END',
    '',
    'END'
  );

implementation

end.
 