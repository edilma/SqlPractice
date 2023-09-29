USE KinetEcoTRG;
GO

CREATE TABLE dbo.FirstTable( 
	RowID int IDENTITY PRIMARY KEY,
	RowValue nvarchar(20)
);
GO

CREATE TABLE dbo.SecondTable(
	RowID int IDENTITY PRIMARY KEY,
	EventDate datetime2
);
GO

CREATE OR ALTER TRIGGER dbo.NestedExample
ON dbo.FirstTable
AFTER INSERT
AS
	INSERT INTO dbo.SecondTable (EventDate)
		VALUES (GETDATE())
;
GO

CREATE OR ALTER TRIGGER dbo.NestedExample2
ON dbo.SecondTable
AFTER INSERT
AS
	PRINT 'The second trigger fired'
;
GO

INSERT INTO dbo.FirstTable (RowValue)
	VALUES ('Elephant');
GO

SELECT * FROM FirstTable;

SELECT * FROM SecondTable;

-- Among other things, this shows me if the (14) nested triggers are enable (1) or disable 
SP_configure;

--If I want to disable nested triggers use 0 in this command.
-- To enable the nested triggers use 1
-- Nested triggers  can create a system difficult to manage or troubleshoot
EXEC sp_configure 'Nested Triggers', 0;
RECONFIGURE;



DROP TABLE IF EXISTS dbo.FirstTable;
DROP TABLE IF EXISTS dbo.SecondTable;

