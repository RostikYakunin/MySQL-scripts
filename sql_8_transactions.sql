-- TASK 2
CREATE DATABASE MyFunkDB;
USE MyFunkDB;

-- TASK 3

CREATE TABLE salary (
id INT,
salary INT,
position VARCHAR (30),
PRIMARY KEY (id)
);

INSERT INTO salary (id, salary, position)
VALUES
(1, 10000, 'director'),
(2, 8000, 'manager'),
(3, 5000, 'worker');

CREATE TABLE emp_Info (
id INT AUTO_INCREMENT,
marital VARCHAR (30),
birth DATE,
adress VARCHAR (30),
PRIMARY KEY (id)
);

INSERT INTO emp_Info (id, marital, birth, adress)
VALUES
(1, 'unmeried', '1994-10-11', 'Kiev, Ostraykova str.'),
(2, 'meried', '1975-07-28', 'Kiev, Degtayrivska str.'),
(3, 'unmeried', '1990-08-06', 'Kiev, Irpinska str.');

CREATE TABLE employees (
id INT AUTO_INCREMENT,
F_name VARCHAR (30),
L_name VARCHAR (30),
telephone VARCHAR (30),
salary_id INT,
emp_id INT,
PRIMARY KEY (id),
FOREIGN KEY (salary_id) REFERENCES salary (id),
FOREIGN KEY (emp_id) REFERENCES emp_Info (id)
);

INSERT INTO employees (f_name, l_name, telephone, salary_id, emp_id)
VALUES
('Ivan', 'Ivanov', '044-542-58-93', 1, 1),
('Roman', 'Kytyzov', '044-123-34-65', 2 , 2),
('Vadim', 'Sachov', '044-523-36-35', 3 , 3);

-- Task 4
DELIMITER |
CREATE PROCEDURE add_member ( 		-- salary table
									IN s_id_1 INT, IN s_salary INT, IN s_position VARCHAR (30),
                                    -- emp_info table
									IN e_id_2 INT, IN e_marital VARCHAR (30), IN e_birth DATE, IN e_adress VARCHAR (30),
                                    -- employees table
                                    IN e1_f_name VARCHAR (30), IN e1_l_name VARCHAR (30), IN e1_telephone VARCHAR (30))
BEGIN
	START TRANSACTION;

	INSERT INTO salary (id, salary, position)
	VALUES (s_id_1, s_salary, s_position);

	INSERT INTO emp_info (id, marital, birth, adress)
	VALUES (e_id_2, e_marital, e_birth , e_adress);

	INSERT INTO employees (f_name, l_name, telephone, salary_id, emp_id)
	VALUES (e1_f_name, e1_l_name, e1_telephone, s_id_1, e_id_2);
    
   IF NOT EXISTS (
			SELECT salary_id FROM employees WHERE emp_id = s_id_1
                ) THEN ROLLBACK;
   END IF;
    
	COMMIT;
END
|

CALL add_member (4, 5000, 'collector', 
				4, 'maried', '1990-10-10', 'Kiev, Antonova str.',
                'Ivan', 'Ivanov', '044-500-54-12');|

-- Task 5

CREATE TRIGGER new_trig 
BEFORE DELETE ON employees
FOR EACH ROW
	BEGIN
    DELETE FROM salary WHERE id = OLD.id ;
    DELETE FROM emp_info WHERE id = OLD.id;
    END;|
    
-- Task 6
CREATE DATABASE shopdb;|
USE shopdb;|

DROP TABLE IF EXISTS customer;|
 
CREATE TABLE IF NOT EXISTS Customer (
id INT,
f_name VARCHAR (30),
l_name VARCHAR (30)
)|

DROP TABLE IF EXISTS customer;|

CREATE TABLE IF NOT EXISTS Customer (
id INT PRIMARY KEY,
f_name VARCHAR (30),
l_name VARCHAR (30)
)|

CREATE TABLE IF NOT EXISTS users(
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(32) NOT NULL UNIQUE,
password VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME NOT NULL);|

CREATE TABLE IF NOT EXISTS profiles(
id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
name VARCHAR(100),
last_name VARCHAR(100),
photo_path VARCHAR(100),
about TEXT, 
FOREIGN KEY(user_id) REFERENCES users(id));|

CREATE INDEX first_index
ON users (email);|
  