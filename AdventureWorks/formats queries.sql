SELECT BusinessEntityID
		, HireDate
		, FORMAT (HireDate, 'MMMM') AS 'Month Hired'
FROM HumanResources.Employee;


SELECT BusinessEntityID
		, HireDate
		, FORMAT (HireDate, 'MMMM dd , yyyy') AS 'Month Hired'
FROM HumanResources.Employee;