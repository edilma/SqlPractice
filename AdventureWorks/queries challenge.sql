/* Using  the production.productinventory table 
combine the LocationID, Shelf, and Bin values
into a single column with hyphens between each
*/


SELECT ProductID
	,	CONCAT (LocationID, '-', Shelf,'-',Bin) AS LocationInfo
FROM Production.ProductInventory;

--other version

SELECT ProductID
		,CONCAT_WS('-',LocationID, Shelf, Bin ) AS LocationInfo
FROM Production.ProductInventory;

/* Using the HumanResources.Employee table, locate all of the people
hired in February of any year.  Then identify the date that their 90
day new hire performance evaluation is due */

----Hired in February
-- SELECT HireDate
--			FROM HumanResources.Employee
--			WHERE MONTH(HireDate) = 02;

----Evaluation date
-- SELECT DATEADD(DAY, 90, HireDate) AS 'Evaluation Date'
--			FROM HumanResources.Employee
--			WHERE MONTH(HireDate) = 02;


SELECT  BusinessEntityID
		,JobTitle
		,  FORMAT(HireDate, 'MMMM, dd') AS 'Hired Day'
		, FORMAT(DATEADD(DAY, 90, HireDate), 'MMMM, dd')  AS '90 Days Evaluation Date' 
FROM HumanResources.Employee
WHERE	MONTH(HireDate) = 02;

/* View CreditRating information for each vendor in the 
Purchasing.Vendor table.   Then use a CASE statement to 
translate the 1-5 credit rating into the text ratings:
poor, below average, average, good, excellent */

SELECT	BusinessEntityID  
	,	Name
	,	CASE CreditRating
			WHEN 1 THEN 'Poor'
			WHEN 2 THEN 'Below Average'
			WHEN 3 THEN 'Average'
			WHEN 4 THEN 'Good'
			WHEN 5 THEN 'Excellent'
			ELSE 'Undefined'
			END AS 'Vendor Credit Rating'
FROM Purchasing.Vendor;

/* Select three random people from Sales.SalesPerson.
Then use an IIF function to compare their SalesYTD
to the SalesLastYear and indicate whether their
performance has increased or decreased */
USE AdventureWorks2019
GO

SELECT TOP (3) Sales.SalesPerson.BusinessEntityID
	, SalesLastYear
	, SalesYTD
	, NEWID() AS NewID
	, IIF( SalesYTD> SalesLastYear, 'Performance Increase', 'Performance Decreased') AS Performance
FROM Sales.SalesPerson
ORDER BY NewID;

--Other version 
SELECT TOP (3) Sales.SalesPerson.BusinessEntityID
	, SalesLastYear
	, SalesYTD
	, IIF( SalesYTD> SalesLastYear, 'Performance Increase', 'Performance Decreased') AS Performance
FROM Sales.SalesPerson
ORDER BY NEWID() ;



