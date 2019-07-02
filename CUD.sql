USE master

--DELETE examples--

DELETE 
FROM Production.Location 
WHERE Production.Location.Name = 'Scrap'

--

DELETE Sales.ShoppingCartItem
FROM Sales.ShoppingCartItem
	INNER JOIN Production.Product
		ON Production.Product.ProductID = Sales.ShoppingCartItem.ProductID
WHERE Product.Name LIKE '%socks%'

--

DELETE Sales.ShoppingCartItem
FROM Sales.ShoppingCartItem
WHERE Sales.ShoppingCartItem.ProductID IN (
	SELECT Production.Product.ProductID 
	FROM Production.Product
	WHERE Product.Name LIKE '%jersey%'
)

--INSERT examples--

INSERT INTO Production.Location (
	Name,
	CostRate,
	Availability,
	ModifiedDate
	)
	VALUES
	(
	'Scrap',
	0,
	0,
	GETDATE()
	)

--

INSERT INTO Person.Person (
	BusinessEntityID
	, PersonType
	, NameStyle
	, FirstName
	, LastName
	, EmailPromotion
	, ModifiedDate
	)
	VALUES (
	(SELECT MAX(BusinessEntity.BusinessEntityID) FROM Person.Person
		RIGHT JOIN Person.BusinessEntity
			ON Person.BusinessEntityID = BusinessEntity.BusinessEntityID)
	, 'IN'
	, 0
	, 'Mark'
	, 'Ross'
	, 0
	, GETDATE()
	)

--UPDATE examples--

UPDATE Production.Location
SET
	CostRate = 1,
	Availability = 80
WHERE Name LIKE 'Sc%'

--

UPDATE Sales.ShoppingCartItem
SET 
	Quantity = 10
WHERE Sales.ShoppingCartItem.ProductID IN (
	SELECT Production.Product.ProductID
	FROM Production.Product
	WHERE Product.Name LIKE '%gloves%'
)