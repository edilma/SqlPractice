USE KinetEcoInventory;
GO


SELECT * FROM dbo.Products;
SELECT * FROM dbo.InventoryAudit;

-- Trigger that logs changes to product.QuantityOnHand

CREATE OR ALTER TRIGGER dbo.InventoryChangeLog
ON dbo.Products
AFTER UPDATE
AS
SET NOCOUNT ON;
IF UPDATE(QuantityOnHand)
	INSERT INTO dbo.InventoryAudit (ProductID, EventTimeStamp, OldQuantity, NewQuantity)
	VALUES (
		(SELECT inserted.ProductID FROM inserted ),
		GETDATE(),
		(SELECT deleted.QuantityOnHand FROM deleted),
		(SELECT inserted.QuantityOnHand FROM inserted)
);

-- Check that the trigger works only in update QuantityOnHand
UPDATE dbo.Products
SET QuantityOnHand = 10
WHERE ProductID = 1;

SELECT * FROM dbo.Products;
SELECT * FROM dbo.InventoryAudit;

INSERT INTO dbo.Products (ProductName, QuantityOnHand)
	VALUES ('AAA Battery', 0)
;
GO

UPDATE dbo.Products
SET LastRestocked = GETDATE()
WHERE ProductID = 1;

SELECT * FROM dbo.Products;
SELECT * FROM dbo.InventoryAudit;