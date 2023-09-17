-- This functions work in SQL 2022


SELECT BusinessEntityID
	, SalesYTD
	, IFF(SalesYTD> 2000000, 'Met Sales Goals' , 'Has not met goal') AS Status
FROM  Sales.SalesPerson ;

SELECT  IFF(SalesYTD> 2000000, 'Met Sales Goals' , 'Has not met goal') AS Status
	, COUNT(*)
FROM Sales.SalesPerson
GROUP by IFF(SalesYTD> 2000000, 'Met Sales Goals' , 'Has not met goal')