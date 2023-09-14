--SELECT FirstName	
--	, LastName
--	, UPPER(FirstName) AS UpperCase
--	, LOWER (LastName) AS LowerCase
--	, LEN (FirstName) AS LengthOfFirstName
--	, LEFT (LastName, 3) AS First_three_letters
--	, RIGHT (LastName, 3) AS Last_three_letters
--	, TRIM (LastName) AS TrimedName
--FROM Person.Person
--;

--TEXT CONCATENATION
SELECT FirstName	
	, LastName
	, CONCAT ( FirstName,' ' ,MiddleName, ' ',  LastName) AS FullName
	, CONCAT_WS(' ', FirstName, MiddleName, LastName) AS WithSeparator
FROM Person.Person;
