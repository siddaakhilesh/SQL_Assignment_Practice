create database EmployeeHierarchySystem;

use EmployeeHierarchySystem


CREATE TABLE EmployeesHierarchy (
    EmpID INT PRIMARY KEY IDENTITY(1,1),          
    Name VARCHAR(100) NOT NULL,                    
    ManagerID INT NULL,                            
    FOREIGN KEY (ManagerID) REFERENCES EmployeesHierarchy(EmpID));

INSERT INTO EmployeesHierarchy (Name, ManagerID)
VALUES
('John Doe', NULL),               
('Jane Smith', 1),                
('Alice Johnson', 1),             
('Bob Brown', 2),                 
('Emily White', 2),               
('Michael Davis', 3),             
('Sarah Wilson', 3),              
('David Clark', 4),               
('Laura Turner', 5),              
('Tom Harris', 5);               

SELECT EmpID, Name, ManagerID
FROM EmployeesHierarchy
WHERE ManagerID = 3; 
