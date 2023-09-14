
-- report the sales orders, their total and how many items by order and 
-- how many are unique products
SELECT SalesOrderID 
	, SUM(LineTotal) AS 'Line Total'
	, SUM (OrderQty) AS 'Number Of Items'
	, COUNT (DISTINCT ProductID) AS 'Unique Products'
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY 'Line Total' DESC
;

-- Report the list of products sold  and the quantity of each
SELECT sales.SalesOrderDetail.ProductID
	, Production.Product.Name
	, SUM(sales.SalesOrderDetail.OrderQty) AS 'Units Sold'
FROM SALES.SalesOrderDetail
	INNER JOIN Production.Product 
	ON sales.SalesOrderDetail.ProductID = Production.Product.ProductID
GROUP BY sales.salesorderdetail.ProductID, production.product.name
ORDER BY 'Units Sold' DESC
;





SELECT *
FROM Production.Product;