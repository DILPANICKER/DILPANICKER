CREATE DATABASE Country;
USE Country;

# Create the Country table
CREATE TABLE Country (
    CountryID INT PRIMARY KEY AUTO_INCREMENT,
    CountryName VARCHAR(50),
    Capital VARCHAR(50),
    Population INT
);

Desc Country;

# Create the Persons table
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Rating DECIMAL(3,2),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

Desc Persons;

# Insert data into the Country table
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

SELECT * FROM Country;

# Inserting data into the Persons table
INSERT INTO Persons (FirstName, LastName, Age, Rating, CountryID)
VALUES
('Donald', 'Trump', 30, 4.5, 1),
('Margaret', 'Thatcher', 25, 3.8, 2),
('Michel', 'Platini', 35, 4.2, 3),
('Lothar', 'Matthäus', 40, 4.8, 4),
('Sonia', 'Gandhi', 28, 3.9, 5),
('Richard', 'Foster', 32, 4.1, 6),
('Justin', 'Trudeau', 27, 4.7, 7),
('David', 'Brown', 38, 3.6, 8),
('Hiro', 'Hito', 29, 4.3, 9),
('Xi', 'Jinping', 31, 4.9, 10);

Select * from persons;

# Add a new column called DOB in Persons table with data type as Date
ALTER TABLE Persons ADD DOB DATE;
Desc Persons;

# Insert Values into Persons
UPDATE Persons 
SET DOB = '1993-01-20' WHERE FirstName = 'Donald' AND LastName = 'Trump';

UPDATE Persons 
SET DOB = '1998-07-18' WHERE FirstName = 'Margaret' AND LastName = 'Thatcher';

UPDATE Persons 
SET DOB = '1988-12-10' WHERE FirstName = 'Michel' AND LastName = 'Platini';

UPDATE Persons 
SET DOB = '1983-04-15' WHERE FirstName = 'Lothar' AND LastName = 'Matthäus';

UPDATE Persons 
SET DOB = '1995-09-09' WHERE FirstName = 'Sonia' AND LastName = 'Gandhi';

UPDATE Persons 
SET DOB = '1991-03-22' WHERE FirstName = 'Richard' AND LastName = 'Foster';

UPDATE Persons 
SET DOB = '1996-11-11' WHERE FirstName = 'Justin' AND LastName = 'Trudeau';

UPDATE Persons 
SET DOB = '1985-05-30' WHERE FirstName = 'David' AND LastName = 'Brown';

UPDATE Persons 
SET DOB = '1994-08-24' WHERE FirstName = 'Hiro' AND LastName = 'Hito';

UPDATE Persons 
SET DOB = '1992-06-15' WHERE FirstName = 'Xi' AND LastName = 'Jinping';

select * from persons;

# Write a user-defined function to calculate age using DOB

DELIMITER $$
CREATE FUNCTION CalculateAge(BirthDate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE Age INT;
  SET Age = TIMESTAMPDIFF(YEAR, BirthDate, CURDATE());
  RETURN Age;
END $$
DELIMITER ;

# SELECT query to fetch the Age
SELECT FirstName, LastName, CalculateAge(DOB) AS Age
FROM Persons;

# Finding the length of Each country name in the country table
SELECT CountryName, LENGTH(CountryName) AS Length
FROM Country;

#Extract the first three characters of each country's name in the Country table
SELECT CountryName, LEFT(CountryName, 3) AS FirstThreeCharacters FROM Country;

# Convert all country names to uppercase and lowercase in the Country table
# Uppercase
SELECT UPPER(CountryName) AS UppercaseName
FROM Country;

# Lowercase
SELECT LOWER(CountryName) AS LowercaseName
FROM Country;



