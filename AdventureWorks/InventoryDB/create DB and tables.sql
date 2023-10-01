

CREATE DATABASE KinetEcoInventory;
GO

USE KinetEcoTRG;
GO

CREATE TABLE dbo.Products(
	ProductID int IDENTITY PRIMARY KEY,
	ProductName varchar(50),
	QuantityOnHand int,
	LastRestocked datetime2,
	LastSold datetime2
);
GO

CREATE TABLE dbo.InventoryAudit(
	AuditLogID int IDENTITY PRIMARY KEY,
	ProductID int ,
	EventTimeStamp datetime2,
	OldQuantity int,
	NewQuantity int
);
GO

CREATE TABLE dbo.WarehouseReceiving(
	ReceiptID int IDENTITY PRIMARY KEY,
	ProductID int,
	QuantityReceived int
);
GO


INSERT INTO dbo.Products (ProductName, QuantityOnHand)
	VALUES ('Solar Charger', 0), 
	('Wind Turbine', 0), 
	('Emergency Radio', 0), 
	('Rechargable Battery', 0)
;

SELECT * FROM dbo.Products;
