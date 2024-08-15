use Northwind ;
go

drop table if exists customer1;
 select top 20 *
 into customer1
 from Customers
 where Customers.Country in (N'USA' , N'UK');


 select*
 from customer1
 delete from customer1 
 where customer1.Country in (N'USA');


 insert into customer1 (CustomerID, CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode, Country, Phone,Fax)
 values
 ( 'NORTH', 'KING', 'David Roya', 'It maneger', '125Feoger', 'Vanguaver', 'NULL', 'WXU2KI', 'Canada', '(098)1111111', 'NULL');
 
 update customer1
 set ContactName = 'Lê Thanh Bình' , Phone = '0111222333', Country = 'Ha Noi '
 where  customer1.CustomerID = 'NORTH';
 
 update customer1
 set Country = 'Anh'
 where customer1.Country = (N'UK');


 --xoa tat ca cac hang neu k co dk
 delete from customer1; 
 
 drop table customer1;
 