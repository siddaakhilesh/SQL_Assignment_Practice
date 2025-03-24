create database EmployeeManagementSystem;

use EmployeeManagementSystem

CREATE TABLE Employees (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,  
    Name VARCHAR(100) NOT NULL,           
    Email VARCHAR(100) UNIQUE NOT NULL,    
    Phone VARCHAR(15) UNIQUE NOT NULL,     
    Salary DECIMAL(10, 2) CHECK (Salary > 10000),  
    JoiningDate DATE DEFAULT GETDATE()      
);


INSERT INTO Employees (Name, Email, Phone, Salary)
VALUES
('Sidda Akhilesh', 'akhilesh.s@example.com', '7279995222', 12000.00),
('Karthik', 'Karthik.b@example.com', '9667623652', 15000.00),
('Rohan Manoj', 'rohan.m@example.com', '9856325741', 11000.00),
('Manideep Pyda', 'manideep.p@example.com', '9632581473', 20000.00),
('Basha Guduru', 'basha.g@example.com', '6549873215', 13000.00),
('Naveen Yarra', 'naveen.y@example.com', '87459632145', 18000.00);


Select *FROM Employees where JoiningDate>'2020-12-31';
