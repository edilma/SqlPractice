SELECT *
FROM Production.Product;




SELECT Color
	, COUNT(*) AS 'Number of Products'
FROM production.product
WHERE Color IS NOT NULL
GROUP BY Color
HAVING COUNT(*) >25;


SELECT product.color
	, count(product.color) AS 'Number of Products'
FROM production.Product
WHERE Color IS NOT NULL 
GROUP BY product.color
HAVING COUNT(color)>25
ORDER BY Color
;


