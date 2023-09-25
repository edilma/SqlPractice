USE KinetEcoTRG;
GO

CREATE TABLE dbo.AccountPayable ( 
	AccountID int PRIMARY KEY,
	AccountNumber nvarchar(20)
	)
;

INSERT INTO dbo.AccountPayable 
	VALUES (1,'98016'),
		(2,'32408'),
		(3, '32984')
;
GO

SELECT * FROM AccountPayable;

--Trigger that prevent any rows from being deleted from a table


CREATE OR ALTER TRIGGER dbo.AccountDelete
ON dbo.AccountPayable
INSTEAD OF DELETE
AS
PRINT 'Deletes are currently blocked by a trigger.  In order to delete a record, disable the trigger first'
ROLLBACK
;
GO

DELETE FROM dbo.AccountPayable
WHERE AccountID =1;
GO

DROP TABLE dbo.AccountPayable;