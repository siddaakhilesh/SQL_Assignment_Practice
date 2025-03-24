Create Database ProductInventorySystem;

use ProductInventorySystem

Create table Product(
ProductID int Identity(1,1) PRIMARY KEY,
ProdcutName varchar(100) NOT NULL,
Category varchar(50) NOT NULL,
Price Decimal(8,2) Check (Price>0),
StockQuantity int Check (StockQuantity>=0));

INSERT INTO Product (ProdcutName, Category, Price, StockQuantity)
VALUES
('Laptop', 'Electronics', 899.99, 50),
('Smartphone', 'Electronics', 599.99, 150),
('Coffee Maker', 'Appliances', 79.99, 30),
('Air Conditioner', 'Appliances', 399.99, 20),
('Bluetooth Speaker', 'Electronics', 59.99, 100),
('Washing Machine', 'Appliances', 499.99, 10),
('Desk Chair', 'Furniture', 129.99, 200),
('Monitor', 'Electronics', 199.99, 75),
('Office Desk', 'Furniture', 249.99, 60),
('Headphones', 'Electronics', 89.99, 120);

update Product Set StockQuantity=0 where ProdcutName='Headphones';

Select *FROM Product where StockQuantity =0;