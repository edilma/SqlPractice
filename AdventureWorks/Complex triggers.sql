USE KinetEcoTRG;
GO

CREATE TABLE dbo.ProductCategories (
    CategoryID int IDENTITY PRIMARY KEY,
    CategoryName nvarchar(20),
    CreationDate datetime2,
    LastModifiedDate datetime2
);
GO


--Trigger to add creation date when a record is inserted
CREATE OR ALTER TRIGGER dbo.CategoryInsert
ON dbo.ProductCategories
AFTER INSERT
AS
SET NOCOUNT ON
UPDATE dbo.ProductCategories
	SET CreationDate = GETDATE()
	FROM inserted
	WHERE ProductCategories.CategoryID = inserted.CategoryID
;
GO

-- Trigger to add last modified date when a record is updated
CREATE OR ALTER TRIGGER dbo.ProductCategoryModified
ON dbo.ProductCategories
AFTER UPDATE
AS
SET NOCOUNT ON
	UPDATE dbo.ProductCategories
	SET LastModifiedDate = GETDATE()
	FROM inserted
	WHERE ProductCategories.CategoryID = inserted.CategoryID
;
GO

--Trigger to prevent a record from being deleted 

CREATE OR ALTER TRIGGER dbo.CategoryDelete
ON dbo.ProductCategories
INSTEAD OF DELETE
AS
PRINT 'A record cannot be deleted.  Modify the trigger to allow deletions'
ROLLBACK
;
GO

/* TEST SOLUTION */
INSERT INTO dbo.ProductCategories (CategoryName)
VALUES
    ('Solar Panel XX'), ('AAA Battery '), ('Super Wind Harvester')
;

UPDATE dbo.ProductCategories
SET CategoryName = 'Solar Panel B'
WHERE CategoryID = 4
;

DELETE FROM dbo.ProductCategories
WHERE CategoryID = 2;

SELECT * FROM dbo.ProductCategories;

/* REMOVE ProductCategories TABLE WHEN COMPLETE */
DROP TABLE dbo.ProductCategories;
GO