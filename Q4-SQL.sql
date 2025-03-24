CREATE DATABASE LibraryManagementSystem;


use LibraryManagementSystem

CREATE TABLE BOOKS(
BookID int identity(1,1) PRIMARY KEY,
Title Varchar(255) NOT NULL,
Author Varchar(100) NOT NULL,
ISBN Varchar(20) UNIQUE NOT NULL,
PublishedYear int);

CREATE TABLE Members (
    MemberID INT IDENTITY(1,1) PRIMARY KEY,  
    Name VARCHAR(100) NOT NULL,               
    Email VARCHAR(100) UNIQUE NOT NULL        
);

CREATE TABLE IssuedBooks (
    IssueID Int IDENTITY(1,1) PRIMARY KEY,  
    MemberID int,                             
    BookID int,                               
    IssueDate DATE DEFAULT GETDATE(),         
    ReturnDate DATE,                          
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),  
    FOREIGN KEY (BookID) REFERENCES Books(BookID)         
);

INSERT INTO Books (Title, Author, ISBN, PublishedYear)
VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925),
('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 1960),
('1984', 'George Orwell', '9780451524935', 1949),
('Pride and Prejudice', 'Jane Austen', '9781503290563', 1813),
('The Catcher in the Rye', 'J.D. Salinger', '9780316769488', 1951);

INSERT INTO Members (Name, Email)
VALUES
('John Doe', 'johndoe@example.com'),
('Jane Smith', 'janesmith@example.com'),
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Brown', 'bobbrown@example.com'),
('Emily White', 'emily.white@example.com');

INSERT INTO IssuedBooks (MemberID, BookID, IssueDate, ReturnDate)
VALUES
(1, 2, '2025-03-01', '2025-03-15'), 
(2, 3, '2025-03-05', '2025-03-20'),  
(3, 1, '2025-03-10', NULL);         

SELECT b.BookID, b.Title, b.Author, b.ISBN, b.PublishedYear, ib.IssueDate, ib.ReturnDate
FROM IssuedBooks ib
JOIN Books b ON ib.BookID = b.BookID
WHERE ib.MemberID = 1;  
