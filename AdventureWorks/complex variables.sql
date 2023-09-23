DECLARE @NumberOfRows INT =14;
DECLARE @StartingID INT = 1021;

SELECT TOP (@NumberOfRows) BusinessEntityID
		, FirstName
		,LastName
FROM Person.Person
WHERE BusinessEntityID >= @StartingID
ORDER BY BusinessEntityID ;

