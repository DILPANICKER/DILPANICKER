# Creating Datavase Schoo
CREATE DATABASE School;

USE School;

# Create Students table

CREATE TABLE STUDENT (
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT,
    Grade CHAR(1)
);

desc Student;

INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Aji', 85, 'A'),
(2, 'Babu', 78, 'B'),
(3, 'Charlie', 92, 'A'),
(4, 'Deepthi', 67, 'C');

select * from student;

# Adding new column Contact to Student Table
Alter table student
ADD COLUMN Contact VARCHAR(15);

# Remove Grade Column from Student table
ALTER TABLE STUDENT
DROP COLUMN Grade;

Select * from student;

# Rename Table student to CLASSTEN
RENAME TABLE STUDENT TO CLASSTEN;

Select * from CLASSTEN;

# delete raws from Table Classten
TRUNCATE TABLE CLASSTEN;

desc classten;

# Remove CLASSTEN From the database school
DROP TABLE CLASSTEN;


