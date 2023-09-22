DECLARE @MyVariable INT;
SET @MyVariable = 10;

SELECT @MyVariable AS MyValue
		, @MyVariable * 5 AS Multiplication
		, @MyVariable + 10 AS Addition;



DECLARE @Color VARCHAR(20) = 'Red';

SELECT ProductID	
		, Name
		, ProductNumber
		, Color
		, ListPrice
FROM Production.Product
WHERE Color = @Color;