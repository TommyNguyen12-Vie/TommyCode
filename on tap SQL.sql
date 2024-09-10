--cau 1
use NORTHWND
go
select *
FROM dbo.Customers, Orders;

-- cau 2
use NORTHWND
go
select * 
from dbo.Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
-- cau 3
use NORTHWND
go
select Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.Address, Customers.Country, Customers.City
from Customers
Where (Customers.City = 'London' or Customers.City = 'France' )
order by
Customers.Country desc ;
-- cau 4
use NORTHWND
go
select Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.Address, Customers.Country, Customers.City, Customers.ContactTitle
from Customers
where (Customers.ContactTitle = 'Sales Manager' and Customers.Country = 'USA' ) or
(Customers.ContactTitle = 'Owner' and Customers.Country = 'Mexico');
-- cau 5
use NORTHWND
go
select Customers.CustomerID, Customers.CompanyName, Customers.ContactName, Customers.Address, Customers.Country, Customers.City, Customers.ContactTitle
from Customers
where ( Customers.ContactTitle ='Manager' and Customers.Country = 'USA' ) or not (Customers.ContactTitle= 'Owner' and Customers.Country = 'Mexico');

-- cau 6
select Orders.OrderID, Orders.OrderDate, 
Customers.CompanyName,
Employees.LastName
from Customers
inner join Orders 
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID

where Orders.OrderDate between '1997-01-01' and ' 1997 -06-30';

-- cau 7
select Orders.OrderID, Orders.OrderDate,
Customers.CompanyName,
Employees.LastName
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.OrderDate = Employees.EmployeeID
where Orders.OrderDate between ' 1997-02-01' and ' 1997- 02-28';

-- cau 8
select Orders.OrderID, Orders.OrderDate,
Customers.CompanyName,
Employees.LastName
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.OrderDate = Employees.EmployeeID
where Orders.OrderDate between ' 1997-04-01' and ' 1997-04-30';

-- cau 9

SELECT Orders.OrderID, Orders.OrderDate,
Customers.CompanyName,
Employees.LastName
FROM Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where YEAR(Orders.OrderDate) % 2 = 0;


-- cau 10
select Orders.OrderID, Orders.OrderDate,
Customers.CompanyName,
Employees.LastName
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where DAY(Orders.OrderDate) in(5,13,14,23);

-- cau 11
select Orders.OrderID, Orders.OrderDate, Orders.Freight,
Customers.CompanyName, Orders.ShipCountry, Employees.EmployeeID
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where (Orders.ShipCountry = 'UK' and Employees.EmployeeID = '2') and YEAR(Orders.OrderDate) in ('1997');

-- cau 12
select Products.ProductID, Products.ProductName, 
Suppliers.CompanyName
from Suppliers
inner join Products
on Suppliers.SupplierID = Products.SupplierID
where Products.ProductName like ('Ch%');

-- cau 13
select Products.ProductID, Products.UnitPrice, Products.UnitsInStock,
Suppliers.CompanyName
from Suppliers
inner join Products
on Suppliers.SupplierID= Products.SupplierID
where (Products.Discontinued = 1 and Products.UnitsInStock > 0);
-- cau 14

select Customers.CompanyName, Customers.ContactName, Customers.Country, Customers.Phone, Customers.Fax
from Customers
where Customers.Country <> 'USA';

-- cau 15
select Customers.CompanyName, Customers.ContactName, Customers.Country, Customers.Phone, Customers.Fax
from Customers
where Customers.Country <> 'Brazil' and Customers.Country <> 'Italy' and Customers.Country not in('Spain')
-- cau 16

select Orders.OrderID, Orders.OrderDate, Orders.ShipCountry, Orders.ShippedDate, Orders.Freight,
Customers.CompanyName,
Employees.LastName
from Customers
inner join Orders
on Customers.CustomerID= Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where (Orders.ShipCountry = 'USA' and Orders.Freight > 300) or (Orders.ShipCountry = 'Argentina' and Orders.Freight<5);

-- cau 17
select Orders.OrderID, Orders.OrderDate, Orders.RequiredDate,Orders.ShipCountry, Orders.Freight,
Customers.CompanyName,
Employees.LastName
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID= Employees.EmployeeID
where (Orders.OrderDate = GETDATE()  or Orders.RequiredDate = GETDATE());

-- cau 18
select Orders.OrderID, Orders.OrderDate, Orders.Freight, Orders.Freight *(1+0.1) as 'NewFreight',
Customers.CompanyName,
Employees.LastName
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join Employees
on Orders.EmployeeID = Employees.EmployeeID
where Orders.OrderDate between '1997-04-01' and '1997-04-30';

-- cau 19 , 20

-- cau 21
select Products.ProductID, Products.ProductName, Products.UnitPrice, Products.UnitsInStock, (Products.UnitPrice * Products.UnitsInStock) as 'TriGia',
Suppliers.CompanyName
from Suppliers
inner join Products
on Suppliers.SupplierID = Products.SupplierID
where Products.Discontinued = 1 and Products.UnitsInStock > 0;

-- cau 22
select Employees.HireDate, Employees.Title, Employees.BirthDate,  Employees.HomePhone,Employees.TitleOfCourtesy, Employees.LastName, Employees.FirstName  ,(Employees.TitleOfCourtesy + Employees.LastName + Employees.FirstName) as 'HoTen'
from Employees
where Year( Employees.HireDate) <= '1993';
-- cau 23
select COUNT (*) as [SoSanPham] , MAX (Products.UnitPrice) as [DonGiaCaoNhat], MIN(Products.UnitPrice) as[DonGiaThapNhat],
AVG(products.UnitPrice) as[DonGiaTB]
from Products ;
-- cau 24
select CategoryID,
COUNT(*) as [SoSanPham], MAX (Products. UnitPrice) as [DonGiaCaoNhat] , MIN (products.UnitPrice) as[DonGiaThapNhat], 
AVG (Products.UnitPrice) as [DonGiaTb]
from Products
group by CategoryID

-- cau 25
select COUNT ([Order Details]. Quantity) as [TongSoDonHang]
from Orders
inner join [Order Details]
on Orders.OrderID = [Order Details].OrderID
where Orders.ShipCountry in ('Uk', 'Belgium' , 'Canada');
--cau 26
select Orders.ShipCountry, COUNT ([Order Details].Quantity)
from orders
inner join [Order Details]
on Orders.OrderID = [Order Details].OrderID
where Orders.ShipCountry in ('Belgium' , 'Canada', 'UK')
group by ShipCountry;
-- cau 27
select Products.CategoryID , AVG (Products.UnitPrice) as[DonGiaTB] 
from Products
group by Products.CategoryID
having AVG (Products.UnitPrice) > 30;
-- cau 28
select Products.CategoryID, AVG (Products.UnitPrice) as [DonGia]
from Products
where (Products.UnitPrice) > 30
group by Products.CategoryID;
-- cau 29
select c.CategoryName, SUM ( od.UnitPrice * od.Quantity * (1 - od.Discount)) as [TongDoanhThu]
from Categories as c
inner join Products as p
on c.CategoryID = p.CategoryID
inner join [Order Details] as od
on p.ProductID = od.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
group by c.CategoryName;
-- cau 30--



-- cau 31
select Top (39) p.ProductID , p.ProductName, p.UnitPrice
from Products as p
order by p.UnitPrice desc ; 

-- cau 32
select Top 50 percent p.ProductID , p.ProductName,p.UnitPrice 
from Products as p
order by p.UnitPrice desc ;

-- cau 33--


-- cau 34
select c.*
from Customers as c
where c.CustomerID in 
(
select distinct o.CustomerID
from Orders as o
);

-- cau 35
select c.*
from Customers as c
where c.CustomerID not in(
select distinct o.CustomerID
from Orders as o
);

-- cau 36
select *
into Customer1
from Customers ;
--cau 37
drop table if exists Customer1
select Top 20 *
into Customer1
from Customers
where Customers.Country in ('USA', 'UK');

select * 
from Customers
-- cau 38
select *
from Customer1
delete Customer1
where Customer1.Country = 'USA' ;

-- cau 39
insert into Customer1 ([CustomerID], [CompanyName],[ContactName],[ContactTitle],[Address],[City],[Region],[PostalCode],[Country],[Phone],[Fax])
values ('KH001' , 'KING', 'Thomas Edision', 'Sale Manager', '120 Aus Rd.', 'Wingped' , 'NULL', 'WAJ123K', 'Canada', '(123)666-333' , 'NULL');

-- cau 40
update Customer1
set ContactName = 'Le Thanh Binh' , City ='Hà Nội' , Phone ='0111222333'
where Customer1.CustomerID = 'KH001' ;
-- cau 41
update Customer1
set Country = 'Anh'
where Customer1.Country = 'UK';

-- cau 42 
delete from Customer1;
-- cau 43
drop table Customer1;
-----------------------------Bài Thực Hành 6. Viết code dạng DDL----------------------
-- Tạo CSDL
USE master
go
CREATE DATABASE QLSinhVien_HocDDL
Go
--Thiết kế bảng Khoa--
use QLSinhVien_HocDDL
go
create table dbo.Khoa(
	MaKhoa nvarchar(8) Not NULL,
	TenKhoa nvarchar(50) NULL,
	NgayThanhLap date NULL,
	GhiChu ntext NULL,
	primary key (MaKhoa) 
	)
	go
---Thiết kế bảng lớp
create table dbo.Lop(
		MaLop nvarchar(8) Not NULL,
		TenLop nvarchar(50) NULL,
		GVCN nvarchar (50) NULL,
		Makhoa nvarchar (8) NULL,
		GhiChu ntext NULL,
		primary key (MaLop),
		foreign key (MaKhoa) references dbo.Khoa (MaKhoa)
		)
		go
--- Thiết kế bảng Sinh Viên--
create table dbo.SinhVien(
		MaSV nvarchar (10) Not NULL,
		HoSV nvarchar(50) NULL,
		TenSV nvarchar (30) NULL,
		GioiTinh nvarchar(50) NULL,
		NgaySinh datetime NULL,
		DiaChi nvarchar (100) NULL,
		MaLop nvarchar (8) NULL,
		QueQuan nvarchar (50) NULL,
		DienThoaiDD nvarchar (12) NULL,
		GhiChu ntext NULL,
		primary key (MaSV),
		foreign key (MaLop) references dbo.Lop (MaLop)
		)
		go

-- Thiết kế bảng  MonHoc----
create table dbo.MonHoc(
		MaMH int Not NULL,
		TenMH nvarchar (50) NULL,
		SoTinChi float NULL,
		MaKhoaPhuTrach nvarchar (8) NULL,
		GhiChu ntext NULL,
		primary key (MaMH),
		foreign key (MaKhoaPhuTrach) references dbo.Khoa(MaKhoa)
		)
		go
--- Thiết kế bảng Hoc---
create table dbo.Hoc(
		MaMH int NOT NULL,
		MaSV nvarchar (10) Not NULL,
		NgayDangKyMH date Not NULL,
		DiemTBMH float NULL,
		GhiChu ntext NULL,
		primary key (MaMH, MaSV, NgayDangKyMH),
		foreign key (MaMH) references dbo.MonHoc(MaMH),
		foreign key (MaSV) references dbo.SinhVien (MaSV)
		)
		go



	