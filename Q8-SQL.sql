create database LargeData;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),      
    ProductName NVARCHAR(100),                     
    Price DECIMAL(10, 2),                          
    Category NVARCHAR(50)                         
);



CREATE PARTITION FUNCTION SalesPartitionFunction (DATE)
AS RANGE LEFT FOR VALUES ('2020-01-01', '2023-01-01');


CREATE PARTITION SCHEME SalesPartitionScheme
AS PARTITION SalesPartitionFunction
TO ([PRIMARY], [PRIMARY], [PRIMARY]);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1),                  
    ProductID INT,                                
    SaleDate DATE,                               
    QuantitySold INT CHECK (QuantitySold > 0),    
    TotalAmount DECIMAL(10, 2),                   
    CONSTRAINT PK_Sales PRIMARY KEY (SaleDate, SaleID),  
    CONSTRAINT FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)
ON SalesPartitionScheme (SaleDate);  

INSERT INTO Products (ProductName, Price, Category)
VALUES 
    ('Laptop', 1000.00, 'Electronics'),
    ('Smartphone', 500.00, 'Electronics'),
    ('Table', 150.00, 'Furniture'),
    ('Chair', 75.00, 'Furniture');


INSERT INTO Sales (ProductID, SaleDate, QuantitySold, TotalAmount)
VALUES 
    (1, '2019-12-15', 5, 5000.00), 
    (2, '2021-05-20', 3, 1500.00),  
    (3, '2024-03-05', 2, 300.00);  

SELECT * FROM Sales
WHERE SaleDate < '2020-01-01';

SELECT * FROM Sales
WHERE SaleDate >= '2020-01-01' AND SaleDate < '2024-01-01';


SELECT * FROM Sales
WHERE SaleDate >= '2024-01-01';



                         