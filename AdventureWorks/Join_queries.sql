SELECT BusinessEntityID, PersonType, FirstName, LastName
FROM Person.Person
;

SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee;

SELECT A.BusinessEntityID
		, A.PersonType 
		, A.FirstName
		, A.LastName
		, B.JobTitle
FROM Person.Person AS A RIGHT OUTER JOIN HumanResources.Employee AS B
	ON A.BusinessEntityID = B.BusinessEntityID
;