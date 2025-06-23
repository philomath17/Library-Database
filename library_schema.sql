-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Bio TEXT
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(100) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    PublicationYear YEAR,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- BookAuthors Junction Table (Many-to-Many)
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- Borrow Transactions Table
CREATE TABLE BorrowTransactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

INSERT INTO Categories (CategoryName) VALUES 
('Science Fiction'),
('History'),
('Programming'),
('Biographies'),
('Fantasy');