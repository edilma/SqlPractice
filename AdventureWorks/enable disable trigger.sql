USE KinetEcoTRG;
GO

CREATE TABLE dbo.Inventory (
	InventoryID int IDENTITY PRIMARY KEY,
	InventoryName nvarchar(50)
);
GO


CREATE OR ALTER TRIGGER dbo.InventoryMessage
ON dbo.Inventory
AFTER INSERT
AS
PRINT 'A new record has been created';
GO


INSERT INTO dbo.Inventory (InventoryName)
	VALUES ('Solar powered battery charger');
GO

DISABLE TRIGGER dbo.InventoryMessage
ON dbo.Inventory;
GO

INSERT INTO dbo.Inventory (InventoryName)
	VALUES ('Solar Generator');
GO

SELECT * FROM dbo.Inventory;

DROP TRIGGER IF EXISTS dbo.InventoryMessage;
DROP TABLE IF EXISTS dbo.Inventory;


