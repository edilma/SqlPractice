SELECT * FROM Production.ProductModelProductDescriptionCulture;

SELECT * FROM Production.Culture;

SELECT ProductModelID
	, ProductDescriptionID
	, CultureID
	, CASE CultureID
		WHEN 'ar' THEN 'Arabic'
		WHEN 'en' THEN 'English'
		WHEN 'es' THEN 'Spanish'
		WHEN 'fr' THEN 'French'
		WHEN 'he' THEN 'Hebrew'
		WHEN 'th' THEN 'Thai'
		WHEN 'zh-cht' THEN 'Chinese'
		ELSE 'Undefined'
	END AS CultureName
FROM Production.ProductModelProductDescriptionCulture;


SELECT TOP 5 * 
FROM  HumanResources.Employee;


SELECT BusinessEntityID
	, MaritalStatus
	, CASE MaritalStatus
		WHEN 'S' THEN 'Single'
		WHEN 'M' THEN 'Married'
		ELSE 'Undefined' --The else is not needed
		END AS 'Marital Status Description'
	, SalariedFlag
	, CASE SalariedFlag
		WHEN 1 THEN 'Paid Hourly'
		WHEN 0 THEN 'Paid Wage'
		ELSE 'Undefined'
	END AS PaymentDescription
FROM HumanResources.Employee;