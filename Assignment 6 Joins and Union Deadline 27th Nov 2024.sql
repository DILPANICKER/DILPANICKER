CREATE DATABASE Country;
USE Country;

CREATE TABLE Country (
    CountryID INT PRIMARY KEY AUTO_INCREMENT,
    CountryName VARCHAR(50),
    Capital VARCHAR(50),
    Population INT
);

CREATE TABLE Persons (
    PersonID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Rating DECIMAL(3,2),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID),
	CountryName VARCHAR(50)
);

INSERT INTO Country (CountryName, Capital, Population)
VALUES
('USA', 'Washington D.C.', 330000000),
('UK', 'London', 68000000),
('France', 'Paris', 67000000),
('Germany', 'Berlin', 83000000),
('Italy', 'Rome', 60000000),
('Spain', 'Madrid', 47000000),
('Canada', 'Ottawa', 38000000),
('Australia', 'Canberra', 26000000),
('Japan', 'Tokyo', 126000000),
('China', 'Beijing', 1400000000);

Select * from Country;

INSERT INTO Persons (FirstName, LastName, Age, Rating, CountryID, CountryName)
VALUES
('Donald', 'Trump', 30, 4.5, 1, 'USA'),
('Margaratte', 'Thatcher', 25, 3.8, 2, 'UK'),
('Michale', 'Platini', 35, 4.2, 3, 'France'),
('Lother', 'Matheus', 40, 4.8, 4, 'Germany'),
('Sonia', 'Gandhi', 28, 3.9, 5, 'Italy'),
('Richard', 'Foster', 32, 4.1, 6, 'Spain'),
('Justin', 'Trudo', 27, 4.7, 7, 'Canada'),
('David', 'Brown', 38, 3.6, 8, 'Australia'),
('Hiro', 'Hito', 29, 4.3, 9, 'Japan'),
('Xi', 'Jingpin', 31, 4.9, 10, 'China');

select * from Persons;
# Perform inner join, Left join, and Right join on the tables
# Inner Join
SELECT p.FirstName, p.LastName, c.CountryName
FROM Persons p
INNER JOIN Country c ON p.CountryID = c.CountryID;

# Left Join
SELECT c.CountryName, p.FirstName, p.LastName
FROM Country c
LEFT JOIN Persons p ON c.CountryID = p.CountryID;

# Right Join
SELECT p.FirstName, p.LastName, c.CountryName
FROM Persons p
RIGHT JOIN Country c ON p.CountryID = c.CountryID;

# List all distinct country names from both the Country and Persons tables
SELECT DISTINCT c.CountryName
FROM Country c
UNION
SELECT DISTINCT p.CountryName
FROM Persons p;

# List all country names from both the Country and Persons tables, including duplicates
SELECT c.CountryName
FROM Country c
UNION ALL
SELECT p.CountryName
FROM Persons p;

# Round the ratings of all persons to the nearest integer in the Persons table
SELECT 
PersonID AS PersonalID, 
FirstName AS PersonName, 
CountryName AS CountryName, 
ROUND(rating) AS RoundedRating
FROM Persons;

