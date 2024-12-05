Create database countriesdb;
USE Countriesdb;

# Create the Countries table
CREATE TABLE Countries (
    CountryID INT PRIMARY KEY AUTO_INCREMENT,
    CountryName VARCHAR(50),
    Capital VARCHAR(50),
    Population INT
);

Desc Countries;

# Create the Persons1 table
CREATE TABLE Person(
    PersonID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Rating DECIMAL(3,2),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(CountryID)
);

Desc Person;

# Insert data into the Countries table
INSERT INTO Countries (CountryName, Capital, Population)
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

SELECT * FROM Countries;

# Inserting data into the Person table
INSERT INTO Person (FirstName, LastName, Age, Rating, CountryID)
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

Select * from person;

# Find the number of persons in each country.
SELECT c.CountryName, COUNT(p.PersonID) AS NumberOfPersons
FROM Countries c
LEFT JOIN Person p ON c.CountryID = p.CountryID
GROUP BY c.CountryName;

# Find the number of persons in each country sorted from high to low
SELECT c.CountryName, COUNT(p.PersonID) AS NumberOfPersons
FROM Countries c
LEFT JOIN Person p ON c.CountryID = p.CountryID
GROUP BY c.CountryName
ORDER BY NumberOfPersons DESC;

# Find out an average rating for Persons in respective countries if the average is greater than 3.0
SELECT c.CountryName, AVG(p.Rating) AS AverageRating
FROM Countries c
JOIN Person p ON c.CountryID = p.CountryID
GROUP BY c.CountryName
HAVING AVG(p.Rating) > 3.0;

# Find the countries with the same rating as the USA. (Use Subqueries)
SELECT c.CountryName
FROM Countries c
WHERE c.CountryID IN (
    SELECT p.CountryID
    FROM Person p
    WHERE p.Rating = (SELECT Rating FROM Person WHERE CountryID = 1 LIMIT 1)
);

# Select all countries whose population is greater than the average population of all nations
SELECT CountryName, Population
FROM Countries
WHERE Population > (SELECT AVG(Population) FROM Countries);


# Creating Product database
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

Desc Customer;


# Create a view named customer_info for the Customer table that displays (cont. next line)
# Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view.

CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email
FROM Customer;

SELECT * FROM customer_info;

# Create a view named US_Customers that displays customers located in the US
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

SELECT * FROM US_Customers;

# Create another view named Customer_details with columns full name(Combine first_name and last_name)
#  email, phone_no, and state
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS FullName, Email, Phone_no, State
FROM Customer;

SELECT * FROM Customer_details;

# Update phone numbers of customers who live in California for Customer_details view
UPDATE Customer
SET Phone_no = 'UpdatedPhoneNumber'
WHERE State = 'California';

SELECT * FROM Customer_details WHERE State = 'California';

# Count the number of customers in each state and show only states with more than 5 customers

SELECT State, COUNT(Customer_Id) AS NumberOfCustomers
FROM Customer
GROUP BY State
HAVING COUNT(Customer_Id) > 5;

# Write a query that will return the number of customers in each state, based on the "state" column 
# in the "customer_details" view.
SELECT State, COUNT(*) AS NumberOfCustomers
FROM Customer_details
GROUP BY State;

# Write a query that returns all the columns from the "customer_details" view, 
# sorted by the "state" column in ascending order

SELECT * FROM Customer_details
ORDER BY State ASC;
