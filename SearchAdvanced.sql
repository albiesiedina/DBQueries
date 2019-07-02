USE AdventureWorks

--This file contains examples of more complicated search queries

SELECT Name, GroupName 
FROM HumanResources.Department
WHERE CHARINDEX('ing', HumanResources.Department.Name) > 0
ORDER BY GroupName

--

SELECT  Purchasing.PurchaseOrderHeader.EmployeeID
		, COUNT(Purchasing.PurchaseOrderHeader.EmployeeID) AS LineCount
		, AVG(Purchasing.PurchaseOrderHeader.EmployeeID) AS 'TotalDue'
FROM Purchasing.PurchaseOrderHeader
	INNER JOIN Purchasing.PurchaseOrderDetail
		ON Purchasing.PurchaseOrderDetail.PurchaseOrderID = Purchasing.PurchaseOrderDetail.PurchaseOrderID
WHERE Purchasing.PurchaseOrderDetail.OrderQty > 700
GROUP BY Purchasing.PurchaseOrderHeader.EmployeeID
ORDER BY LineCount DESC

--

SELECT  CONCAT(Person.Person.FirstName, ' ', Person.Person.LastName) as PersonName
		, Person.PhoneNumberType.Name AS PhoneType
		, Person.PersonPhone.PhoneNumber
FROM Person.Person
	INNER JOIN Person.PersonPhone
		ON Person.Person.BusinessEntityID = Person.PersonPhone.BusinessEntityID
	INNER JOIN Person.PhoneNumberType
		ON Person.PersonPhone.PhoneNumberTypeID = Person.PhoneNumberType.PhoneNumberTypeID
WHERE YEAR(PersonPhone.ModifiedDate) >= 2012 AND YEAR(PersonPhone.ModifiedDate) <= 2015
		AND (LEFT(Person.PersonPhone.PhoneNumber, 3) = '334' OR LEFT(Person.PersonPhone.PhoneNumber, 3) = '747')
ORDER BY Person.LastName, Person.FirstName

--

DELETE Production.WorkOrderRouting
FROM Production.WorkOrderRouting
	INNER JOIN Production.WorkOrder
		ON Production.WorkOrder.WorkOrderID = Production.WorkOrderRouting.WorkOrderID
WHERE Production.WorkOrder.ScrapReasonID IS NOT NULL

--

UPDATE Sales.SalesOrderHeader
SET
	Comment = 'Thanks for shopping at our new store!'
FROM Sales.SalesOrderHeader
	INNER JOIN Sales.Customer
		ON Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID
WHERE Sales.Customer.StoreID = '1994'
