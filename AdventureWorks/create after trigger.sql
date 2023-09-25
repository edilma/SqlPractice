USE KinetEcoTRG;
GO

-- create the table
CREATE TABLE dbo.Products(
	ProductID INT PRIMARY KEY,
	ProductName nvarchar(50)
);

--insert some products
INSERT INTO dbo.Products
VALUES
	(5, 'D Battery')
	, (6, 'AA Rechargable Battery');
GO

-- Pass a message to a user when an insert event
-- occurs in a table
CREATE OR ALTER TRIGGER dbo.ProductMessage
ON dbo.Products
AFTER INSERT
AS
PRINT 'New product data has been inserted.'
;

SELECT * 
FROM dbo.Products;

--delete the trigger and the table 
DROP TRIGGER IF EXISTS dbo.ProductMessage;

DROP TABLE dbo.Products;
