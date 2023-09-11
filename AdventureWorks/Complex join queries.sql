SELECT * 
FROM Person.Address;

SELECT * 
FROM Person.StateProvince;

SELECT * 
FROM Person.CountryRegion;

SELECT  A.AddressLine1 AS 'Address '
	, A.AddressLine2
	, A.City 
	, B.Name AS 'State or Province'
	, c.Name AS 'Country or Region' 
FROM (Person.Address AS A INNER JOIN Person.StateProvince AS B 
	ON A.StateProvinceID = B.StateProvinceID)
	INNER JOIN Person.CountryRegion AS C
	ON B.CountryRegionCode = C.CountryRegionCode
ORDER BY AddressID
;