--SELECT TOP 50 PERCENT TaxRate, Name
SELECT TOP 5 WITH TIES TaxRate, Name
FROM  Sales.SalesTaxRate
ORDER BY TaxRate 
;
