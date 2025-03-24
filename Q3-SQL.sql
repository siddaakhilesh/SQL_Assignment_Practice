create Database StudentEnrollmentSystem;

use StudentEnrollmentSystem

create table Students(
StudentID int identity(1,1) PRIMARY KEY,
Name Varchar(100) NOT NULL,
DOB Date NOT NULL,
Email Varchar(100) UNIQUE NOT NULL,
Phone Varchar(15) UNIQUE NOT NULL);

INSERT INTO Students (Name, DOB, Email, Phone)
VALUES
('John Doe', '2000-05-10', 'johndoe@example.com', '123-456-7890'),
('Jane Smith', '1998-07-20', 'janesmith@example.com', '234-567-8901'),
('Alice Johnson', '2001-11-15', 'alice.johnson@example.com', '345-678-9012'),
('Bob Brown', '1999-02-25', 'bobbrown@example.com', '456-789-0123'),
('Charlie Davis', '2000-04-30', 'charliedavis@example.com', '567-890-1234'),
('Emily White', '1997-09-13', 'emilywhite@example.com', '678-901-2345'),
('David Clark', '2002-01-18', 'davidclark@example.com', '789-012-3456'),
('Sophia Lewis', '2001-03-25', 'sophialewis@example.com', '890-123-4567'),
('James Wilson', '1996-12-01', 'jameswilson@example.com', '901-234-5678'),
('Olivia Harris', '2002-06-05', 'oliviaharris@example.com', '012-345-6789'),
('Liam Martinez', '2000-08-21', 'liammartinez@example.com', '123-234-5679'),
('Mia Robinson', '1998-05-30', 'miarobinson@example.com', '234-345-6780');

Select *FROM Students where year(DOB)<2000;