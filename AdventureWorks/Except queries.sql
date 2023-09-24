
--Customers that do NOT have credit card
-- Find the ones that are in the person type and are not
-- in the credit card table (osea las que no tienen credit card)
SELECT BusinessEntityID
FROM Person.person
WHERE Person.PersonType <> 'EM'
EXCEPT
SELECT BusinessEntityID 
FROM Sales.PersonCreditCard;

--Now using JOIN Customers that do NOT have credit card 

SELECT  Person.BusinessEntityID
FROM Person.person LEFT JOIN Sales.PersonCreditCard 
		ON Person.BusinessEntityID= Sales.PersonCreditCard.BusinessEntityID
WHERE Person.PersonType <> 'EM' AND
	PersonCreditCard.CreditCardID IS  NULL;


