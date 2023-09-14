--SELECT TOP 5 *
--FROM Sales.SalesOrderHeader
--;

--SELECT TOP 5 *
--FROM Person.Person
--;

/*
This query select the total purchases by customer and order them in
descending order.  Also give information about the average, max and 
minimum purchase of that customer. And when the first order was placed
*/

SELECT SalesOrderHeader.CustomerID
	, CONCAT_WS (' ', Person.FirstName , Person.MiddleName, Person.LastName) AS FullName
	, SUM(SalesOrderHeader.TotalDue) AS Total_Purchases_Amt
	, AVG (SalesOrderHeader.TotalDue) AS Avg_Purchase_Amt
	, MIN (SalesOrderHeader.TotalDue) AS Min_Purchase_Amt
	, MAX (SalesOrderHeader.TotalDue) AS Max_Purchase_Amt
	, SUM (SalesOrderHeader.Freight) AS Total_Freight_Charges
	, FORMAT(MIN (SalesOrderHeader.OrderDate),'yyyy-MM-dd')  AS First_Order_Date
	
FROM Sales.SalesOrderHeader 
	INNER JOIN Person.Person
		ON SalesOrderHeader.CustomerID = Person.BusinessEntityID
GROUP BY CustomerID, Person.FirstName, Person.MiddleName, Person.LastName
ORDER BY Total_Purchases_Amt DESC
;



-- Using subqueries 

--SELECT 
--    CustomerID,
--    FullName,
--    SUM(TotalDue) AS Total_Purchases_Amt,
--    AVG(TotalDue) AS Avg_Purchase_Amt,
--    MIN(TotalDue) AS Min_Purchase_Amt,
--    MAX(TotalDue) AS Max_Purchase_Amt,
--    SUM(Freight) AS Total_Freight_Charges,
--    MIN(OrderDate) AS First_Order_Date
--FROM (
--    SELECT 
--        SalesOrderHeader.CustomerID,
--        CONCAT(FirstName, ' ', LastName) AS FullName,
--		SalesOrderHeader.TotalDue,
--        SalesOrderHeader.Freight,
--        SalesOrderHeader.OrderDate
--    FROM Sales.SalesOrderHeader 
--    INNER JOIN Person.Person
--    ON SalesOrderHeader.CustomerID = Person.BusinessEntityID
--) AS Subquery
--GROUP BY CustomerID, FullName
--ORDER BY Total_Purchases_Amt DESC;

