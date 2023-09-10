SELECT FirstName
FROM Person.Person
--WHERE FirstName LIKE 'A%'
--WHERE FirstName LIKE '%A'
--WHERE FirstName LIKE '%A%'
--WHERE FirstName LIKE 'A___'
--WHERE FirstName LIKE '[ABC]___'
---WHERE FirstName LIKE 'A[LMN]___'
--WHERE FirstName LIKE 'A[L-N]___'
WHERE FirstName LIKE 'A[^LN]___'
;