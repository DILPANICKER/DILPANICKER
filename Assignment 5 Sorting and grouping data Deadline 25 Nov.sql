create database country;
use country;

CREATE TABLE Country (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);
Desc country;

CREATE TABLE Persons (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

Desc persons;

INSERT INTO Country (Country_name, Population, Area) VALUES
('India', 1400000000, 3287263),
('USA', 331000000, 9833520),
('China', 1440000000, 9596961),
('Brazil', 213000000, 8515767),
('UK', 68000000, 243610),
('Canada', 38000000, 9984670),
('Australia', 25000000, 7692024),
('Germany', 83000000, 357022),
('France', 67000000, 551695),
('Japan', 126000000, 377975);

select * from country;

INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
('John', 'Varghese', 5000, 4.5, 2, 'USA'),
('Baby', 'George', 7000, 4.8, 3, 'China'),
('Vinod', 'Kumar', 6000, 3.9, 1, 'India'),
('Susan', 'Davis', 4000, 4.2, 4, 'Brazil'),
('Michael', 'Johnson', 3000, 4.0, 5, 'UK'),
('Serena', 'Williams', 2000, 3.8, 6, 'Canada'),
('Dean', 'Jones', 1000, 4.6, 7, 'Australia'),
('Adolf', 'Hiltler', 8000, 4.7, 8, 'Germany'),
('James', 'Bond', 9000, 3.5, 9, 'France'),
('Biju', 'Paulose', 4500, 4.3, 10, 'Japan');

select * from persons;

# Query to print the first three characters of Country_name from the Country table
SELECT LEFT(Country_name, 3) AS FirstThreeChars FROM Country;

# Query to concatenate first name and last name from Persons table
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons;

# Query to count the number of unique country names from Persons table
SELECT COUNT(DISTINCT Country_name) AS UniqueCountries FROM Persons;

# Query to print the maximum population from the Country table
SELECT MAX(Population) AS MaxPopulation FROM Country;

# Query to print the minimum population from Persons table
SELECT MIN(Population) AS MinPopulation FROM Persons;

# Insert 2 new rows to the Persons table making the Lname NULL.Query to count Lname from Persons table. 
INSERT INTO Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES ('Sam', NULL, 1000, 3.9, 2, 'USA'),
       ('Shyna', NULL, 1500, 4.1, 3, 'China');

select * from persons;

SELECT COUNT(Lname) AS CountLname FROM Persons;

# Query to find the number of rows in the Persons table
SELECT COUNT(*) AS TotalRows FROM Persons;

# Query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
SELECT Population FROM Country LIMIT 3;

# Query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
SELECT * FROM Country ORDER BY RAND() LIMIT 3;

# List all persons ordered by their rating in descending order
SELECT * FROM Persons ORDER BY Rating DESC;

# Total population for each country in the Persons table
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name;

# Countries in the Persons table with a total population greater than 50,000 
SELECT Country_name, SUM(Population) AS TotalPopulation
FROM Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

# Total number of persons and average rating for each country, but only for countries with at least 2 persons, ordered by the average rating in ascending order.
SELECT Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AvgRating FROM Persons
GROUP BY Country_name
HAVING COUNT(*) >= 2
ORDER BY AvgRating ASC;






