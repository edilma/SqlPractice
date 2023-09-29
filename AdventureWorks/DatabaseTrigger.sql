USE KinetEcoTRG;
GO

CREATE OR ALTER TRIGGER PreventTableAlteration
ON DATABASE
FOR ALTER_TABLE
AS
PRINT 'A trigger is cancelling all ALTER TABLE statements';
ROLLBACK ;
GO
;

CREATE TABLE People (
	PersonName nvarchar(20)
)
;
GO

ALTER TABLE dbo.People 
ALTER COLUMN PersonName nvarchar(100);

DROP TRIGGER PreventTableAlteration
ON DATABASE;

DROP TABLE People;
GO
