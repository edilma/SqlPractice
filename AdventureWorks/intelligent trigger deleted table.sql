USE KinetEcoTRG;
GO

CREATE TABLE dbo.Vendor (
	VendorID int IDENTITY PRIMARY KEY,
	VendorName nvarchar(50)
	)
;

create table dbo.VendorArchive (
	VendorID int PRIMARY KEY,
	VendorName nvarchar(50),
	DateArchive datetime2
);
GO

--This trigger will move the delete vendor to
-- the vendorArchive table

INSERT INTO dbo.Vendor
	VALUES ('KinetEco');
GO

CREATE TRIGGER dbo.DeleteVendor
ON dbo.Vendor
AFTER DELETE
AS
	SET NOCOUNT ON;
	INSERT INTO dbo.VendorArchive (VendorID, VendorName)
		SELECT deleted.VendorID, deleted.VendorName -- i DON'T PUT THE VALUES word here
		FROM deleted
		UPDATE dbo.VendorArchive
		SET DateArchive = GETDATE()
		FROM deleted
		WHERE VendorArchive.VendorID = deleted.VendorID;
;
GO

SELECT * FROM dbo.Vendor;
GO

DELETE FROM dbo.Vendor
WHERE VendorID = 1;

SELECT * FROM dbo.Vendor;
GO
SELECT * FROM dbo.VendorArchive;
GO

DROP TABLE dbo.Vendor;

DROP TABLE dbo.VendorArchive;