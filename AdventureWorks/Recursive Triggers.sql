USE KinetEcoTRG;
GO

CREATE TABLE dbo.Numbers (
    RowID int IDENTITY PRIMARY KEY,
    RowValue int
);
GO

-- To be recursive the RECURSIVE_TRIGGER has to be on (line 33) 
CREATE OR ALTER TRIGGER dbo.RecursiveExample
ON dbo.Numbers
AFTER INSERT
AS
BEGIN
IF ( SELECT TOP 1 inserted.RowValue 
			FROM inserted) < 20
		INSERT INTO dbo.Numbers (RowValue)
			VALUES  ( ( SELECT TOP 1 inserted.RowValue FROM inserted) + 1)
ELSE PRINT 'Trigger Recursion Complete'
END
;
GO

INSERT INTO dbo.Numbers (RowValue)
	VALUES(3);

SELECT * FROM Numbers;


SELECT name, is_recursive_triggers_on FROM sys.databases;

ALTER DATABASE KinetEcoTRG
SET RECURSIVE_TRIGGERS OFF;
--SET RECURSIVE_TRIGGERS ON;

DROP TABLE IF EXISTS dbo.Numbers;
