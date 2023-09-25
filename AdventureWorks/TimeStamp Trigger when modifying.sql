USE KinetEcoTRG;
GO

CREATE TABLE dbo.Customers(
	CustomerID int PRIMARY KEY,
	CustomerName nvarchar(50),
	LastModified datetime2
);
GO

--Update the datestapm when a customer is inserted or modified
CREATE OR ALTER TRIGGER dbo.CustomerModified
ON dbo.Customers
AFTER INSERT, UPDATE
AS
SET NOCOUNT ON --This is to avoid the repeating the message 
UPDATE dbo.Customers
	SET LastModified = GETDATE()
	FROM inserted -- This is a temporary thatSQL uses
	WHERE dbo.Customers.CustomerID = inserted.CustomerID
; 
GO

INSERT INTO dbo.Customers (CustomerID, CustomerName)
VALUES
	(5, 'Kristy')
;
GO

SELECT * FROM Customers;

UPDATE dbo.Customers
SET CustomerName = 'Lily'
WHERE CustomerID =1
;
GO

INSERT INTO dbo.Customers (CustomerID, CustomerName)
VALUES (2, 'Chandra'), (3, 'Martha');
GO

DROP TABLE dbo.Customers;