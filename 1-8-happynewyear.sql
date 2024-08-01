---- Cau 1;
--SELECT *
--FROM Customers, Orders;

----Cau 2;
--use Northwind
--go
--SELECT *
--FROM Customers
--inner join Orders
--on Customers.CustomerID = Orders.CustomerID
---- cau 3
--use Northwind
--go
--SELECT Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.Address, Customers.Country, Customers.City
--FROM Customers
--Order by
--Customers.Country desc;

---- Cau 4
--SELECT Customers.CustomerID, Customers.CompanyName,Customers.ContactName, Customers.Address, Customers.Country, Customers.City
--FROM Customers
--where (Customers.ContactTitle = 'Manager' and Customers. Country ='USA' ) or
--( Customers.ContactTitle = 'Owner' and Customers.Country = 'Mexico')
--Order by 
--Customers.Country Asc;

---- Cau 5

--SELECT Customers.CustomerID, Customers.CompanyName,Customers.ContactName, Customers.Address, Customers.Country, Customers.City
--FROM Customers
--where (Customers.ContactTitle = 'Manager' and Customers. Country ='USA' ) or
--not ( Customers.ContactTitle = 'Owner' and Customers.Country = 'Mexico')
--order by
--Customers .Country Desc;


---- Cau 6
--SELECT Orders.OrderID, Orders.OrderDate,
--Customers.CompanyName,
--Employees.LastName
--FROM Customers
--inner join Orders
--on Customers.CustomerID = Orders.CustomerID
--inner join Employees
--on Orders.EmployeeID = Employees.EmployeeID

--where Orders.OrderDate between ' 1997-01-01' and '1997-06-30';

--cau 7
--SELECT Orders.OrderID, Orders.OrderDate,
--Customers.CompanyName,
--Employees.LastName
--FROM Customers
--inner join Orders
--on Customers.CustomerID = Orders.CustomerID
--inner join Employees
--on Orders.EmployeeID = Employees.EmployeeID
--where Orders.OrderDate between ' 1997-02-01' and '1997-02-28';

-- cau 8
--SELECT Orders.OrderID, Orders.OrderDate,
--Customers.CompanyName,
--Employees.LastName
--FROM Customers
--inner join Orders
--on Customers.CustomerID = Orders.CustomerID
--inner join Employees
--on Orders.EmployeeID = Employees.EmployeeID
--where Orders.OrderDate between ' 1997-04-01' and '1997-04-30';

-- cau 9
SELECT Orders.OrderID, Orders.OrderDate,
Customers.CompanyName,
Employees.LastName
FROM Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where YEAR(Orders.OrderDate )% 2= 0;
 -- cau 10

SELECT Orders.OrderID, Orders.OrderDate,
Customers.CompanyName,
Employees.LastName
FROM Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where DAY(Orders.OrderDate) in (5, 13, 14 , 23);

-- cau 11
SELECT Orders.OrderDate, Orders.OrderID, Orders.Freight,
Customers.ContactName
FROM Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where (Orders.ShipCountry = 'UK' and Employees.EmployeeID ='2') and YEAR(Orders.OrderDate) in ('1997')

-- Cau 12
SELECT Products.ProductName, Products.ProductID,
Suppliers.CompanyName
FROM Suppliers
inner join Products
on Suppliers.SupplierID= Products.SupplierID
inner join Categories
on Products.CategoryID = Categories.CategoryID
where Products.ProductName like('Ch%');

 
-- cau 13
SELECT Products.ProductName, Products.ProductID,Products.UnitPrice, Products.UnitsInStock,
Suppliers.CompanyName
FROM Suppliers
inner join Products
on Suppliers.SupplierID= Products.SupplierID
where (Products.Discontinued = 1 and Products.UnitsInStock >0)

-- Cau 14
SELECT c.ContactName, c.CompanyName, c.Country, c.Fax, c.Phone
FROM Customers c
where c.Country <> 'USA';
-- cau 15
SELECT c.ContactName, c.CompanyName, c.Country, c.Fax, c.Phone
FROM Customers c
where c.Country not in ('Brazil') and c.Country not in('Italy') and c.Country not in ('Spain') and c.Country not in ('UK');
-- cau 16
SELECT Orders.OrderID, Orders.OrderDate, Orders.ShipCountry, Orders.ShippedDate, Orders.Freight,
Customers.CompanyName,Employees.LastName
FROM Customers
inner join Orders
on Customers.CustomerID= Orders.CustomerID
inner join Employees
On Orders.EmployeeID = Employees.EmployeeID
where (Orders.ShipCountry = 'USA' and Orders.Freight > 300) or ( Orders.ShipCountry = 'Argentina' and Orders.Freight < 5);

-- cau 17
SELECT Orders.OrderID, Orders.OrderDate, Orders.RequiredDate, Orders.ShipCountry, Orders.Freight,
Customers.CompanyName, Employees.LastName
FROM Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees 
on Orders .EmployeeID = Employees.EmployeeID
where (Orders.OrderDate = getdate()  or Orders.RequiredDate =getdate())
-- cau 18

SELECT Orders.OrderID, Orders.OrderDate, Orders.Freight, orders.Freight*(1+0.1) as 'NewFreight',
Customers.CompanyName, Employees.LastName
FROM Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees 
on Orders .EmployeeID = Employees.EmployeeID
where Orders.OrderDate between ('1997-04-01') and ('1997-04-30');
-- cau 19,20
SELECT AnotherOrderDetail.OrderID, Products.ProductName, 
	[Order Details].UnitPrice, [Order Details].Quantity, 
	AnotherOrderDetail.ThanhTien,
	[Order Details].Discount,
	AnotherOrderDetail.TienGiamGia,
	AnotherOrderDetail.TienPhaiTra
FROM Products
		inner join
		(
			SELECT [Order Details].OrderID,
				[Order Details].ProductID,
				[Order Details].UnitPrice * [Order Details].Quantity as ThanhTien,
				([Order Details].UnitPrice * [Order Details].Quantity) * [Order Details].Discount as TienGiamGia,
				([Order Details].UnitPrice * [Order Details].Quantity) - (([Order Details].UnitPrice * [Order Details].Quantity) * [Order Details].Discount) as TienPhaiTra
			FROM [Order Details]
		) AnotherOrderDetail
			on AnotherOrderDetail.ProductID = Products.ProductID
		inner join [Order Details]
			on AnotherOrderDetail.OrderID = [Order Details].OrderID
			and AnotherOrderDetail.ProductID = [Order Details].ProductID
		inner join Orders
		on [Order Details].OrderID = Orders.OrderID
where YEAR(Orders.OrderDate) in ('1997') and [Order Details].Discount > 0 and AnotherOrderDetail.TienPhaiTra < 50;


-- cau 21
SELECT Products.ProductID, Products. ProductName, Products.UnitPrice, Products.UnitsInStock, (Products.UnitPrice * Products.UnitsInStock) as TriGia,
Suppliers.CompanyName
FROM Suppliers
inner join Products
on Suppliers.SupplierID = Products.SupplierID
where (Products.Discontinued =1 and Products.UnitsInStock >0);


-- cau 22
SELECT Employees.LastName, Employees.HireDate, Employees.Title, Employees.BirthDate, Employees.HomePhone, Employees.FirstName, Employees.TitleOfCourtesy, (Employees.TitleOfCourtesy + Employees.LastName + Employees.FirstName) as HoTen
FROM Employees
where Employees.HireDate < '1993';
-- cau 23

