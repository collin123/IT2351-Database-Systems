/******************************************************** 

* This script creates the database for students

*********************************************************/ 
DROP
    DATABASE IF EXISTS students;
CREATE DATABASE students;
-- create students tables with student_id as primary key
CREATE TABLE students.students(
    student_id INT auto_increment PRIMARY KEY,
    student_first_name VARCHAR(50) NOT NULL,
    student_last_name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);
-- create classes table with class-id as primary key 
CREATE TABLE students.classes (
  class_id INT AUTO_INCREMENT,
  class_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (class_id)
);
-- class rosters table will use student_id and class_id as primary keys and use class_id as foreign key to create relationship between the class_rosters and classes AND student_id as foreign key to create relationship between students and class_rosters
CREATE TABLE students.class_rosters(
	student_id INT NOT NULL,
    class_id INT NOT NULL,
    PRIMARY KEY(student_id, class_id),
    CONSTRAINT class_roster_fk_classes
    FOREIGN KEY(class_id) references classes(class_id),
    CONSTRAINT class_roster_fk_students
    FOREIGN KEY(student_id) references students(student_id));




-- Insert data into the students table, (not the prettiest or intuitive insert statements but it adds the data exactly how it is in the homework example)
INSERT INTO students.students(student_first_name, student_last_name, address, email, major)
VALUES 
('Kevin',  'Green', '124 Main St.', 'Kevin@school.edu', 'Programming'),
('Lynn', 'Robinson', '345 Second St.', 'Lynn@school.edu', 'Programming'),
('Nick', 'Smith', '45 York Road', 'Nick@school.edu', 'Cybersecurity'),
('Andy', 'Andrews', '600 5th Ave.', 'Andy@school.edu', 'Networking'),
('Collin', 'Stasiak', '9330 Fairmount rd', 'Collin@school.edu', 'Programming'),
('Joe', 'Shmoe', '123 Road Ave.', 'Shmoe@school.edu', 'Cybersecurity'),
('Zippy', 'Cereal', '555 Real Street rd', 'Cereal@school.edu', 'English');


-- populate classes table with classes from examples, sql will auto generate their ids
INSERT INTO students.classes (class_name)
VALUES 
('IT1025'), 
('MATH2400'), 
('IT1050'), 
('IT2351'), 
('1025'), 
('1050'),
('MATH12013');
-- add classes to student's rosters by student_id, class_id
INSERT INTO students.class_rosters(student_id, class_id) VALUES
(1, 1), 
(1, 2), 
(1, 3), 
(2, 1), 
(2, 3), 
(2, 4), 
(3, 5), 
(4, 5), 
(4, 6), 
(5, 3), 
(5, 7);



CREATE USER IF NOT EXISTS mgs_user@localhost 

IDENTIFIED BY 'pa55word'; 

  

-- Grant privileges to that user 

GRANT SELECT, INSERT, UPDATE, DELETE 

ON mgs.* 

TO mgs_user@localhost; 