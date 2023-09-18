--Display the count of the number of products in each category
SELECT Production.ProductCategory.Name AS [Category Name]
	, COUNT(Product.ProductID) AS [Number of Products]
FROM Production.ProductCategory
	INNER JOIN Production.ProductSubcategory
	ON ProductCategory.ProductCategoryID = ProductSubcategory.ProductCategoryID
	INNER JOIN Production.Product
	ON ProductSubcategory.ProductSubcategoryID = Product.ProductSubcategoryID
GROUP BY ProductCategory.Name;


--PIVOT VERSION -  Accesories has an error

SELECT 'Number of Products' AS 'Category Name'
	, Accesories
	, Bikes
	, Clothing
	, Components
FROM (
	SELECT ProductCategory.Name AS [Category Name]
		,  Product.ProductID AS [Number of Products]
	FROM Production.ProductCategory
		INNER JOIN Production.ProductSubcategory
		ON ProductCategory.ProductCategoryID = ProductSubcategory.ProductCategoryID
		INNER JOIN Production.Product
		ON ProductSubcategory.ProductSubcategoryID = Product.ProductSubcategoryID
	) AS DataSource
PIVOT (COUNT([Number of Products]) FOR [Category Name] 
		IN (Accesories , Bikes 	, Clothing 	, Components))  AS PivotTable
	;









--SELECT  Product.Name
--	, (
--	SELECT  C.Name
--	FROM Production.ProductSubcategory as S
--	INNER JOIN 
--	Production.ProductCategory AS c
--	on s.ProductCategoryID = c.ProductCategoryID
--	GROUP BY c.Name
--	) AS CategoryName
--FROM Production.Product

--;







