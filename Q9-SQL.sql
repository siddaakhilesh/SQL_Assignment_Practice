use EmployeeManagementSystem


CREATE INDEX idx_salary ON Employees(Salary);

CREATE INDEX idx_email ON Employees(Email);

CREATE INDEX idx_phone ON Employees(Phone);

CREATE INDEX idx_joindate ON Employees(JoiningDate);


SELECT * 
FROM Employees
WHERE Salary > 12000;

-- Before indexing:
SET STATISTICS TIME ON;
SELECT * 
FROM Employees
WHERE Salary > 12000;
SET STATISTICS TIME OFF;

-- After indexing:
SET STATISTICS TIME ON;
SELECT * 
FROM Employees
WHERE Salary > 12000;
SET STATISTICS TIME OFF;


-- before and after indexing it will give time taken to execute
SET SHOWPLAN_ALL ON;
GO

SELECT * 
FROM Employees
WHERE Salary > 12000;

SET SHOWPLAN_ALL OFF;
GO

--using this database to imporve performance on orders and analyze it after indexing
use OnlineShoppingSystem

CREATE INDEX idx_orderdate ON Orders(OrderDate);

CREATE INDEX idx_customerid ON Orders(CustomerID);


SELECT * 
FROM Orders
WHERE OrderDate >= DATEADD(MONTH, -6, GETDATE());


-- Before indexing:
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT * 
FROM Orders
WHERE OrderDate >= DATEADD(MONTH, -6, GETDATE());

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;




