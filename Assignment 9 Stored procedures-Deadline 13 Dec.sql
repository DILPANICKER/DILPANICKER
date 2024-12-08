CREATE DATABASE WorkerList;
USE WorkerList;

CREATE TABLE WorkersList (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT(15),
    JoiningDate DATETIME,
    Department CHAR(25)
);
Desc WorkersList;

INSERT INTO WorkersList (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'Antony', 'Varghese', 50000, '2023-01-15 09:00:00', 'HR'),
(2, 'Babu', 'Mathew', 60000, '2023-02-01 10:00:00', 'Finance'),
(3, 'Catherine', 'George', 70000, '2023-03-10 11:00:00', 'IT'),
(4, 'Deepa', 'Lal', 55000, '2023-04-20 12:00:00', 'HR'),
(5, 'Eli', 'Malouf', 75000, '2023-05-25 13:00:00', 'IT'),
(6, 'Gopal', 'Sundar', 80000, '2023-06-30 14:00:00', 'Finance'),
(7, 'Harish', 'Vasudaevan', 65000, '2023-07-05 15:00:00', 'HR'),
(8, 'Indu', 'Choodan', 58000, '2023-08-15 16:00:00', 'Finance'),
(9, 'Janaki', 'Subrahmaniam', 72000, '2023-09-10 17:00:00', 'IT'),
(10, 'Kesav', 'prasad', 52000, '2023-10-05 18:00:00', 'HR'),
(11, 'Lyla', 'Philip', 83000, '2023-11-15 19:00:00', 'Finance'),
(12, 'Manoj', 'Nair', 77000, '2023-12-20 20:00:00', 'IT'),
(13, 'Neeraj', 'Mani', 69000, '2023-01-05 21:00:00', 'HR'),
(14, 'Omana', 'Raghav', 61000, '2023-02-15 22:00:00', 'Finance'),
(15, 'Pradeep', 'Panicker', 78000, '2023-03-10 23:00:00', 'IT');

Select * from WorkersList;

# Create a stored procedure that takes in IN parameters for all the columns in the Worker table
#  and adds a new record to the table and then invokes the procedure call. 
DELIMITER //

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT(15),
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO WorkersList (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;

CALL AddWorker(16, 'Ravi', 'kumar', 56000, '2024-01-01 10:00:00', 'HR');

# Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
# It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
# Then make the procedure call.

DELIMITER //

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT(15)
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM WorkersList
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

CALL GetWorkerSalary(15, @p_Salary);
SELECT @p_Salary;

# Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
# It should update the department of the worker with the given ID. Then make a procedure call. 

DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE WorkersList
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

CALL UpdateWorkerDepartment(4, 'IT');

# Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
# It should retrieve the number of workers in the given department and returns it in the p_workerCount 
# parameter. Make procedure call. 

DELIMITER //

CREATE PROCEDURE CountWorkersByDepartment(
    IN p_Department CHAR(25),
    OUT p_WorkerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_WorkerCount
    FROM WorkersList
    WHERE Department = p_Department;
END //

DELIMITER ;

CALL CountWorkersByDepartment('Finance', @p_WorkerCount);
SELECT @p_WorkerCount;

# Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter 
# for p_avgSalary. It should retrieve the average salary of all workers in the given department 
# and returns it in the p_avgSalary parameter and call the procedure.

DELIMITER //

CREATE PROCEDURE AvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_AvgSalary INT
)
BEGIN
    SELECT AVG(Salary) INTO p_AvgSalary
    FROM WorkersList
    WHERE Department = p_Department;
END //

DELIMITER ;

CALL AvgSalaryByDepartment('IT', @p_AvgSalary);
SELECT @p_AvgSalary;





