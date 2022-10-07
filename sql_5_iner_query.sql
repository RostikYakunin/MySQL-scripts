-- TASK 2
CREATE DATABASE MyJoinsDB;
USE MyJoinsDB;

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

-- TASK 4
SELECT e.id, e.f_name, e.l_name, e.telephone, a.adress
FROM employees as e, emp_info as a
WHERE e.id=a.id ;

SELECT employees.id, employees.f_name, employees.l_name, employees.telephone, emp_info.marital, emp_info.birth 
FROM employees, emp_info 
WHERE employees.id = emp_info.id AND emp_info.marital = 'unmeried';

SELECT employees.id, employees.f_name, employees.l_name, employees.telephone, emp_info.birth, salary.position
FROM employees, emp_info, salary
WHERE employees.id = emp_info.id AND employees.id = salary.id AND salary.position = 'manager';



