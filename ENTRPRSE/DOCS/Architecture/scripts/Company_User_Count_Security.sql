-- Company User-Count Security
SELECT [RecPfix]
      ,[ucCompanyId]
      ,[ucWStationId]
      ,[ucUserId]
      ,[ucRefCount]
FROM [EXCH67].[common].[COMPANY]
WHERE RecPfix = 'U'