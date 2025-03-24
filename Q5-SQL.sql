CREATE DATABASE OnlineShoppingSystem;

use OnlineShoppingSystem

Create table Customers(
CustomerID int Identity(1,1) PRIMARY KEY,
Name varchar(100) NOT NULL,
Email varchar(100) UNIQUE NOT NULL,
Phone varchar(15) UNIQUE NOT NULL);

Create table Orders(
OrderID int identity(1,1) PRIMARY KEY,
CustomerID int,
OrderDate Datetime Default CURRENT_TIMESTAMP,
TotalAmount Decimal(10,2),
Foreign key(CustomerID) References Customers(CustomerID));

create table OrderDetails(
OrderDetails int identity(1,1) PRIMARY KEY,
OrderID int,
ProductID int,
Quantity int check (Quantity>0),
Price Decimal(8,2),
Foreign Key (OrderID) references Orders(OrderID),
Foreign key (ProductID) references Products(ProductID));

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),     
    ProductName VARCHAR(100) NOT NULL,            
    Price DECIMAL(8,2) NOT NULL                   
);

INSERT INTO Customers (Name, Email, Phone)
VALUES
('John Doe', 'johndoe@example.com', '123-456-7890'),
('Jane Smith', 'janesmith@example.com', '234-567-8901'),
('Alice Johnson', 'alice.johnson@example.com', '345-678-9012'),
('Bob Brown', 'bobbrown@example.com', '456-789-0123'),
('Emily White', 'emily.white@example.com', '567-890-1234');

INSERT INTO Products (ProductName, Price)
VALUES
('Product A', 50.00),
('Product B', 25.75),
('Product C', 70.00),
('Product D', 65.25),
('Product E', 35.25);

INSERT INTO Orders (CustomerID, TotalAmount)
VALUES
(1, 150.75), 
(2, 200.50),  
(3, 120.25),  
(4, 180.00),  
(5, 250.00);  

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
(1, 1, 2, 50.00),  
(1, 2, 1, 25.75),  
(2, 3, 3, 70.00),  
(2, 4, 2, 65.25),  
(3, 1, 1, 50.00),  
(3, 5, 2, 35.25),  
(4, 2, 1, 25.75),  
(4, 3, 4, 70.00),  
(5, 1, 2, 50.00),  
(5, 4, 3, 65.25);  

SELECT o.OrderID, o.OrderDate, o.TotalAmount, od.OrderDetails, p.ProductName, od.Quantity, od.Price
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.CustomerID = 1;  




