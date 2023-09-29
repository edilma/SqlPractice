USE KinetEcoTRG;
GO

CREATE OR ALTER TRIGGER PreventTableAlteration
ON ALL SERVER
FOR DDL_EVENTS
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
ON ALL SERVER;

DROP TABLE People;
GO
