Create database Teachers;
Use Teachers;

CREATE TABLE teachers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

Desc Teachers;
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Ramakrishnan', 'Mathematics', 5, 45000.00),
('Haridas', 'Physics', 12, 55000.00),
('Narayanan', 'Chemistry', 8, 48000.00),
('Shyamala', 'Biology', 15, 62000.00),
('Thannkamani', 'English', 6, 40000.00),
('Suresh', 'History', 9, 47000.00),
('Harikumar', 'Geography', 3, 39000.00),
('Kurup', 'Computer Science', 10, 60000.00);

select * from teachers;

# Create a before insert trigger named before_insert_teacher that will raise 
# an error “salary cannot be negative” if the salary inserted to the table is less than zero. 

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END $$

DELIMITER ;

# Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, 
# timestamp to a table called teacher_log when a new entry gets inserted to the 
# teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 

CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

Desc teacher_log;

DELIMITER $$
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END $$

DELIMITER ;

# Create a before delete trigger that will raise an error when you try to delete a row that has
# experience greater than 10 years

DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teachers with experience greater than 10 years';
    END IF;
END $$

DELIMITER ;

# Create an after delete trigger that will insert a row to teacher_log table when that row is deleted 
# from teacher table.

DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END $$

DELIMITER ;
