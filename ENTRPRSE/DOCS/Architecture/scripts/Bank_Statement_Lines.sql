-- Bank Statement Lines
SELECT [RecPfix]
      ,[SubType]
      ,[EbLineNo]
      ,[EbLineDate]
      ,[EbLineRef]
      ,[EbLineValue]
      ,[EbLineIntRef]
      ,[EbMatchStr]
      ,[EbGLCode]
      ,[EbLineRef2]
      ,[EbLineStatus]
FROM [ZZZZ01].[MLOCSTK]
WHERE RecPfix = 'K' AND SubType = '5'
ORDER BY EbLineNo
