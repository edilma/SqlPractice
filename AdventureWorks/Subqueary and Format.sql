/* This query calculate the top sales person and the 
difference between they and the other salesperson 
And it is format in currency*/

SELECT BusinessEntityID
	, FORMAT (SalesYTD, 'C0') AS [Yearly Sales]
	, FORMAT ((SELECT MAX(SalesYTD) 
		FROM Sales.SalesPerson) , 'C0') as [Top Salesperson]
	, FORMAT ( ((SELECT MAX(SalesYTD) 
		FROM Sales.SalesPerson) - SalesYTD) , 'C0') AS [Sales Gap]
		from Sales.SalesPerson
ORDER BY SalesYTD DESC;

--Other option to select the top sales number 

SELECT TOP 1 SalesYTD
		FROM Sales.SalesPerson
		ORDER BY SalesYTD DESC