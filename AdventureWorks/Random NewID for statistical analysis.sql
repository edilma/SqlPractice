SELECT Top 10 WorkOrderID
	, NEWID() as NewID
FROM Production.WorkOrder
ORDER BY NewID
;