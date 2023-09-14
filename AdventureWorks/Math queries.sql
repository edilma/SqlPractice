--SELECt BusinessEntityID
--	, SalesYTD
--	, ROUND( SalesYTD, 2) AS Round2
--	, ROUND( SalesYTD, -2) AS RoundHundreds -- -3 to 1000, -1 to 10s
--	, CEILING (SalesYTD) AS RoundCeiling -- Round to the next integer
--	, FLOOR (SalesYTD) AS RoundFloor
--FROM Sales.SalesPerson



SELECT BusinessEntityID
	, VacationHours
	, SickLeaveHours
	, GREATEST(VacationHours, SickLeaveHours) AS 'MoreVacation than SickHours'
	, LEAST (VacationHours, SickLeaveHours) AS 'MoreSick than VacationHours'
	, IIF(GREATEST(VacationHours, SickLeaveHours) = VacationHours
		, 'Vacation', 'Sick') AS 'Which is Higher?'
FROM HumanResources.Employee