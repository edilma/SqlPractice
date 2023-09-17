USE AdventureWorks2019;
GO
SELECT Compatibility_level
FROM sys.databases WHERE NAME = 'AdventureWorks2019' ;
GO

--change the database compatibility level to 160 to match SQL server 2022
ALTER DATABASE AdventureWorks2019
SET COMPATIBILITY_LEVEL = 160;
GO

SELECT Value
FROM generate_series (0,50,5)
;