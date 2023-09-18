SELECT ProductLine
	, AVG(ListPrice) AS AveragePrice
FROM Production.Product
WHERE ProductLine IS NOT NULL 
GROUP BY ProductLine
;

--PIVOT THE RESULTS ( PIVOT LINE AS COLUMN HEADER)
SELECT 'Average List Price' AS 'Product Line'
		, M, R, S, T
FROM (
	SELECT ProductLine
		, ListPrice
	FROM Production.Product
	) AS SourceData
PIVOT ( AVG (ListPrice) FOR ProductLine IN (M, R, S, T))
	AS PivotTable;

