USE KinetEcoTRG;
GO

CREATE TABLE dbo.NumberParity (
	RowID int IDENTITY PRIMARY KEY
	, MyNumber int 
	, Parity nvarchar(20) 
)
;
GO

--This trigger will use the temporary inserted table to check if myNumber is even or odd
-- And set the value for the parity column.  It will ignore any parity value i provide.
CREATE TRIGGER dbo.ParityTest
ON dbo.NumberParity
AFTER INSERT
AS
SET NOCOUNT ON;
UPDATE dbo.NumberParity
	SET Parity = 'Even Number'
	FROM inserted
	WHERE dbo.NumberParity.RowID = inserted.RowID AND
	inserted.MyNumber % 2 = 0;
UPDATE dbo.NumberParity
	SET Parity = 'Odd Number'
	FROM inserted
	WHERE dbo.NumberParity.RowID = inserted.RowID AND
	inserted.MyNumber % 2 <>0 ;
;
GO
	


INSERT INTO dbo.NumberParity (MyNumber)
	VALUES (8),(13),(22),(7)
	;


INSERT INTO dbo.NumberParity (MyNumber, Parity)
	VALUES (11, 'Even'),(10, 'Elipshis'),(0, 'unique'),(3, 'odd')
	;


select * from dbo.NumberParity;

DROP TABLE dbo.NumberParity;

