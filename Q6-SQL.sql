CREATE DATABASE BankTransactionSystem;

use BankTransactionSystem

create table Accounts(
AccountID int identity(1,1) PRIMARY KEY,
CustomerName varchar(100) NOT NULL,
AccountNumber varchar(20) UNIQUE NOT NULL,
Balance Decimal(12,2) Check (Balance >=0));

create Table Transactions(
TransactionID int identity(1,1) PRIMARY KEY,
AccountID int,
foreign key (AccountID) REFERENCES Accounts(AccountID));

ALTER TABLE Transactions
ADD 
    TransactionType VARCHAR(10) CHECK (TransactionType IN ('Deposit', 'Withdraw')),  
    Amount DECIMAL(10, 2) CHECK (Amount > 0),                                        
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP;                              

INSERT INTO Accounts (CustomerName, AccountNumber, Balance)
VALUES
('John Doe', 'ACC1234567890', 5000.00),  
('Jane Smith', 'ACC2345678901', 3000.00), 
('Alice Johnson', 'ACC3456789012', 7000.00), 
('Bob Brown', 'ACC4567890123', 1000.00), 
('Emily White', 'ACC5678901234', 2500.00); 

INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
VALUES
(1, 'Deposit', 1000.00, '2025-03-01 10:00:00'),  
(1, 'Withdraw', 500.00, '2025-03-02 11:00:00'),  
(2, 'Deposit', 2000.00, '2025-03-01 14:00:00'),  
(2, 'Withdraw', 1500.00, '2025-03-02 09:00:00'),  
(3, 'Deposit', 5000.00, '2025-03-01 13:00:00'),  
(3, 'Withdraw', 2000.00, '2025-03-02 16:00:00'), 
(4, 'Deposit', 3000.00, '2025-03-01 18:00:00'),   
(4, 'Withdraw', 1000.00, '2025-03-02 15:00:00'),  
(5, 'Deposit', 1500.00, '2025-03-01 17:00:00'),  
(5, 'Withdraw', 1000.00, '2025-03-02 13:00:00');  

SELECT SUM(Balance) AS TotalBalance FROM Accounts;
