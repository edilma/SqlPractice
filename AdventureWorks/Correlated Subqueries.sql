SELECT P.BusinessEntityID
	, P.FirstName
	, P.LastName
FROM Person.Person AS P INNER JOIN
	HumanResources.Employee AS E
	ON P.BusinessEntityID = E.BusinessEntityID
;

/* Get the name, last name and title from 2 tables
correlate them.  No join clauses*/

SELECT BusinessEntityID
	, FirstName
	, LastName
	, (SELECT JobTitle
		FROM HumanResources.Employee 
		-- We will correlate here the 2 tables, without doin a join
		-- It's like a left join
		WHERE BusinessEntityID = MyPerson.BusinessEntityID 
	) AS JobTitle
FROM Person.Person AS MyPerson
WHERE EXISTS (SELECT JobTitle
		FROM HumanResources.Employee 
		-- We will correlate here the 2 tables, without doin a join
		-- It's like a left join
		WHERE BusinessEntityID = MyPerson.BusinessEntityID); 
		-- can use here also IS NOT NULL


