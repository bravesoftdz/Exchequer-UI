-- Plug-in Security
SELECT [RecPfix]
      ,[hkId]
      ,[hkSecCode]
      ,[hkDesc]
      ,[hkStuff]
      ,[hkMessage]
      ,[hkVersion]
      ,[hkEncryptedCode]
FROM [common].[COMPANY]
WHERE RecPfix = 'H'