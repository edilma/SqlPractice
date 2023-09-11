SELECT department.Name
FROM HumanResources.Department;

SELECT AddressType.Name
FROM Person.AddressType;

SELECT Department.Name AS 'Department Name'
	, AddressType.Name AS 'Address Name'
FROM HumanResources.Department CROSS JOIN Person.AddressType;

/*
create a sports championship.  Each team from a department
plays against all the other departments but not against themselfs
*/
SELECT A.Name AS 'Home Team'
	, B.Name AS 'Away Team'
FROM HumanResources.Department AS A CROSS JOIN 
	HumanResources.Department AS B
WHERE A.Name <> B.Name
	;