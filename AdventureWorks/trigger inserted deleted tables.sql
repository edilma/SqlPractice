USE KinetEcoTRG;
GO

CREATE TABLE dbo.Colors (
	ColorID int IDENTITY PRIMARY KEY,
	ColorName Nvarchar(20)
	)
;

CREATE TRIGGER dbo.TriggerTables
ON dbo.Colors
AFTER INSERT, UPDATE, DELETE
AS
	SET NOCOUNT ON;
	SELECT * FROM inserted;
	SELECT * FROM deleted;
;
GO

INSERT INTO dbo.Colors
	VALUES ( 'Green'),('Red'), ('Yellow')
;

UPDATE dbo.Colors 
SET ColorName = 'Blue'
WHERE ColorID = 3
;

DELETE FROM dbo.Colors
WHERE ColorID = 2
;

SELECT * FROM DBO.Colors;

DROP TABLE dbo.Colors;
	
