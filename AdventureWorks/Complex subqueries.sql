/*
SELECT TOP 15 *
FROM SALES.SalesOrderDetail;
*/


--This query calculate the total of each order , the average order
--And the diference from the average 
SELECT SalesOrderID
	, FORMAT( SUM (LineTotal), 'C2') AS Total_Order 
	, (SELECT AVG(TotalTable.TotalEachOrder) 
		FROM 
			(SELECT SUM(LineTotal) as TotalEachOrder
			FROM Sales.SalesOrderDetail
			GROUP BY SalesOrderID) AS TotalTable) AS AverageOrder
	, (SUM (LineTotal) - 
			(SELECT AVG(TotalTable.TotalEachOrder) AS AverageOrder
			FROM 
			(SELECT SUM(LineTotal) as TotalEachOrder
			FROM Sales.SalesOrderDetail
			GROUP BY SalesOrderID) AS TotalTable
		)) AS [Difference from Average]								
FROM SALES.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM (LineTotal)> (
		SELECT AVG(TotalTable.TotalEachOrder) AS AverageOrder
		FROM 
		(SELECT SUM(LineTotal) as TotalEachOrder
		FROM Sales.SalesOrderDetail
		GROUP BY SalesOrderID) AS TotalTable)
ORDER BY [Difference from Average]
;


--We are creating a table with a column 
--that contains the total of the orders 
	SELECT SUM(LineTotal) as TotalEachOrder
	FROM Sales.SalesOrderDetail
	GROUP BY SalesOrderID

-- Calculate the averate order sale
SELECT AVG(TotalTable.TotalEachOrder) AS AverageOrder
FROM 
		(SELECT SUM(LineTotal) as TotalEachOrder
		FROM Sales.SalesOrderDetail
		GROUP BY SalesOrderID) AS TotalTable



