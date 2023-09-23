SELECT  ProductCategoryID
		,NULL AS ProductSubCategoryID
		, Name
FROM production.productcategory
UNION
SELECT ProductCategoryID
		, ProductSubcategoryID
		, Name
FROM Production.ProductSubcategory
ORDER BY ProductCategory.ProductCategoryID
;

--Similar query using a join
SELECT ProductCategory.ProductCategoryID
		,ProductCategory.Name
		,ProductSubcategory.ProductSubcategoryID
		,ProductSubcategory.Name
FROM Production.ProductCategory 
	INNER JOIN
	Production.ProductSubcategory 
	ON ProductCategory.ProductCategoryID = ProductSubcategory.ProductCategoryID
	;