
--Select only the product photo that have reviews
SELECT ProductID
FROM Production.ProductProductPhoto

INTERSECT

SELECT ProductID
FROM Production.ProductReview;


SELECT DISTINCT Production.ProductReview.ProductID
FROM Production.ProductProductPhoto INNER JOIN
		Production.ProductReview 
		ON Production.ProductReview.ProductID =Production.ProductProductPhoto.ProductID;


