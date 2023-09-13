SELECT City, StateProvinceID, COUNT(*) AS 'Count of Addreses'
FROM Person.Address
GROUP BY City, StateProvinceID
ORDER BY 'Count of Addreses' DESC
;