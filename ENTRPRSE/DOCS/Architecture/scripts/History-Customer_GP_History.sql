-- History, Customer GP History
SELECT CHAR([hiExCLass]) AS Class
      ,CAST(SUBSTRING(hiCode, 2, 6)  AS VARCHAR) As Code
      ,[hiYear]
      ,[hiPeriod]
      ,[hiCurrency]
      ,[hiSales]
      ,[hiPurchases]
      ,[hiBudget]
      ,[hiCleared]
      ,[hiBudget2]
      ,[hiValue1]
      ,[hiValue2]
      ,[hiValue3]
FROM [ZZZZ01].[HISTORY]
WHERE hiExCLass = ASCII('W')
--    AND hiPeriod = 255
ORDER BY CAST(SUBSTRING(hiCode, 2, 6)  AS VARCHAR), hiYear, hiPeriod, hiCurrency