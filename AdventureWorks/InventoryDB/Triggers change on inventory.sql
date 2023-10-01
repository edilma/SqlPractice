USE KinetEcoInventory;
GO


SELECT * FROM dbo.Products;
SELECT * FROM dbo.InventoryAudit;

-- Trigger that logs changes to product.QuantityOnHand

CREATE OR ALTER TRIGGER dbo.InventoryChangeLog
ON dbo.Products
AFTER UPDATE
AS
BEGIN
IF UPDATE(QuantityOnHand)
	INSERT INTO dbo.InventoryAudit (ProductID, EventTimeStamp, OldQuantity, NewQuantity)
	VALUES (
		(SELECT inserted.ProductID FROM inserted ),
		GETDATE(),
		(SELECT deleted.QuantityOnHand FROM deleted),
		(SELECT inserted.QuantityOnHand FROM inserted)
);


WHERE ProductID = inserted.ProductID
