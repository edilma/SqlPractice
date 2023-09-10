SELECT WorkOrder.WorkOrderID AS 'Id',
	ScrappedQty AS 'Scrapped Quantity',
	'December' AS Month
FROM Production.WorkOrder
WHERE WorkOrder.StartDate >='2013-12-01' 
	AND EndDate<'2013-12-31'
	AND WorkOrder.ScrappedQty>0
ORDER BY WorkOrder.ScrappedQty DESC
	
;