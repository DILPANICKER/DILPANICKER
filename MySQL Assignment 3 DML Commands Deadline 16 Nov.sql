create database Managers;
Use Managers; 

# Create table Managers

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Age INT CHECK (Age>0),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) check (salary>0) NOT NULL
    );
desc managers;

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary)
VALUES
(1, 'John', 'Abraham', '1980-05-14', 43, 'Male', 'IT', 28000),
(2, 'Aaliya', 'Singh', '1985-09-23', 38, 'Female', 'HR', 30000),
(3, 'Robert', 'Vadra', '1978-03-10', 46, 'Male', 'Finance', 32000),
(4, 'Ambili', 'Rajan', '1990-06-20', 33, 'Female', 'IT', 25000),
(5, 'Michael', 'Jackson', '1983-11-17', 40, 'Male', 'Operations', 27000),
(6, 'Sarah', 'Thomas', '1986-12-05', 37, 'Female', 'Marketing', 22000),
(7, 'David', 'copperfield', '1982-04-28', 42, 'Male', 'IT', 26000),
(8, 'Shilpa', 'Battathiri', '1988-07-15', 35, 'Female', 'Sales', 21000),
(9, 'Aji', 'Mathew', '1975-01-09', 49, 'Male', 'Finance', 31000),
(10, 'Nanditha', 'Nair', '1992-10-11', 31, 'Female', 'IT', 24000);

Select * from Managers;

# Retrieving the name and date of birth of the manager with Manager_Id 1. 3
SELECT First_name, Last_Name, DOB FROM Managers 
WHERE Manager_Id = 1;

# Querry AAnnual income of all Managers
SELECT Manager_Id, First_name, Last_Name, (Salary * 12) AS Annual_Income 
FROM Managers;

# Write a query to display records of all managers except ‘Aaliya’. 5
SELECT * FROM Managers WHERE First_name <> 'Aaliya';

# Query to display details of managers whose department is IT and earns more than 25000 per month
SELECT * FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;

# Query to display details of managers whose salary is between 10000 and 35000.
SELECT * FROM Managers 
WHERE Salary BETWEEN 10000 AND 35000;
