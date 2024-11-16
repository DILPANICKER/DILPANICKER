Create database Countries;
Use Countries;

# Creating Table Country
CREATE TABLE Country (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Country_name VARCHAR(100) NOT NULL,
    Population INT NOT NULL,
    Area INT NOT NULL
);
Desc country;

# Creating Table Persons

CREATE TABLE Persons (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Fname VARCHAR(100) NOT NULL,
    Lname VARCHAR(100) NOT NULL,
    Population INT NOT NULL,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

Desc Persons;

# Inserting values into Country

INSERT INTO Country (Country_name, Population, Area) VALUES
('USA', 331000000, 9834000),
('India', 1380000000, 3287000),
('Canada', 38000000, 9985000),
('UK', 67000000, 243000),
('Australia', 26000000, 7692000),
('Germany', 83000000, 357000),
('France', 65000000, 551000),
('Italy', 1800000, 301000),
('Spain', 47000000, 505000),
('Japan', 125000000, 377000);

Select * from Country;

# Inserting Values into Persons

INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
('Donald', 'Trump', 10000, 4.5, 1, 'USA'),
('Narendra', 'Modi', 20000, 4.8, 2, 'India'),
('Justin', 'Trudeau', 30000, 3.9, 3, 'Canada'),
('Kamala', 'Harris', 40000, 5.0, 1, 'USA'),
('Kier', 'Starmar', 50000, 4.2, 4, 'UK'),
('Anthony', 'Albanese', 60000, 4.9, 5, 'Australia'),
('Clinton', 'Garcia', 70000, 4.1, NULL, NULL),
('Olaf', 'Scholf', 80000, 3.8, 6, 'Germany'),
('Michel', 'Barnier', 90000, 4.6, 7, 'France'),
('Giorgia', 'Meloni', 100000, 3.7, 8, 'Italy');

Select * From Persons;

# List Distinct country from Pesons table
SELECT DISTINCT Country_name FROM Persons;

# Select first names and last names from the Persons table with aliases.
SELECT Fname AS FirstName, Lname AS LastName FROM Persons;

# Find all persons with a rating greater than 4.0.
SELECT * FROM Persons WHERE Rating > 4.0;

# Find countries with a population greater than 10 lakhs
SELECT * FROM Country WHERE Population > 1000000;

# Find persons who are from 'USA' or have a rating greater than 4.5.
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;

# Find all persons where the country name is NULL. 
SELECT * FROM Persons WHERE Country_name IS NULL;

# Find all persons from the countries 'USA', 'Canada', and 'UK'.
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');

# Find all persons not from the countries 'India' and 'Australia'.
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'Australia');

# Find all countries with a population between 5 lakhs and 20 lakhs
SELECT * FROM Country WHERE Population BETWEEN 500000 AND 2000000;

# Find all countries whose names do not start with 'C'
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';













