--SELECT BusinessEntityID
--	, HireDate
--	, year(HireDate) AS HiredYear
--	, MONTH (HireDate) AS HireMonth
--	, DAY ( HireDate) AS HireDay
--FROM HumanResources.Employee;


--SELECT YEAR(HireDate) AS Year
--	, COUNT(*) AS NewHires
--FROM HumanResources.Employee
--GROUP BY YEAR(HireDate)
--;

--SELECT GETDATE();
--SELECT GETUTCDATE()

--SELECT BusinessEntityID
--	, HireDate
--	, FORMAT(HireDate, 'dddd, MMMM dd, yyyy') AS CustomLongDate
--	, FORMAT(HireDate, 'd-MMM') AS OtherCustDate -- We can customize as much as i want
--FROM HumanResources.Employee;



--SELECT BusinessEntityID
--	, HireDate
--	, year(HireDate) AS HiredYear
--	, MONTH (HireDate) AS HireMonth
--	, DAY ( HireDate) AS HireDay
--	, DATEDIFF(day, HireDate, GETDATE()) AS DaysSinceHired
--	, DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsSinceHired 
--	, DATEADD(YEAR, 10, HireDate) AS Anniversary -- numbers of [day, month, year], since a date
--FROM HumanResources.Employee;

/* FORMAT DATES */


--SELECT BusinessEntityID
--	, HireDate
--	, FORMAT(HireDate, 'yyyy') AS FullNumberYear
--	, FORMAT(HireDate, 'y') AS NameMonthAndNumberYear
--FROM HumanResources.Employee;

--SELECT BusinessEntityID
--	, HireDate
--	, FORMAT(HireDate, 'MMMM') AS FullNameMonth
--	, FORMAT(HireDate, 'MMM') AS AbbrevNameMonth
--	, FORMAT(HireDate, 'M') AS NameMonthAndNumberDay
--FROM HumanResources.Employee;


--SELECT BusinessEntityID
--	, HireDate
--	, FORMAT(HireDate, 'dddd') AS FullNameDay
--	, FORMAT(HireDate, 'ddd') AS AbbrevNameDay
--	, FORMAT(HireDate, 'd') AS NumberDay --1/14/2009
--FROM HumanResources.Employee;


SELECT BusinessEntityID
	, HireDate
	, FORMAT (HireDate, 'dddd') AS HiredDay
	, DATE_BUCKET(WEEK,1,HireDate)  AS WeekBucketDate
	, FORMAT (DATE_BUCKET(WEEK,1,HireDate), 'dddd')  AS WeekBucketDay
	, DATE_BUCKET (MONTH,1,HireDate) AS  MonthBucketDay
	, DATE_BUCKET (YEAR,1,HireDate) AS  MonthBucketYear
FROM HumanResources.Employee;