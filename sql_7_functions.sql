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
CREATE PROCEDURE number_1 ()
BEGIN
SELECT e.id, e.f_name, e.l_name, e.telephone, a.adress
FROM employees as e, emp_info as a
WHERE e.id=a.id;
END
|
CALL number_1;

DELIMITER |
CREATE PROCEDURE number_2 () 
BEGIN
SELECT employees.id, employees.f_name, employees.l_name, employees.telephone, emp_info.marital, emp_info.birth 
FROM employees, emp_info 
WHERE employees.id = emp_info.id AND emp_info.marital = 'unmeried';
END
|
CALL number_2;

DELIMITER |
CREATE PROCEDURE number_3 () 
BEGIN
SELECT employees.id, employees.f_name, employees.l_name, employees.telephone, emp_info.birth, salary.position
FROM employees, emp_info, salary
WHERE employees.id = emp_info.id AND employees.id = salary.id AND salary.position = 'manager';
END
|
CALL number_3;|

-- Task 6
CREATE DATABASE Car;|

USE Car;|

create table marks(
   id int not null auto_increment primary key,
   mark varchar(20) unique
); |

create table cars(
  id INT NOT NULL auto_increment primary key,
  mark_id INT NOT NULL,
  model varchar(20) NOT NULL,
  price INT NOT NULL,
  foreign key(mark_id) references marks(id)
); |

CREATE TABLE clients
(
	 id INT AUTO_INCREMENT NOT NULL,
     name VARCHAR(30),
     age TINYINT,
     phone VARCHAR(15),
     PRIMARY KEY (id)
); |

create table orders(
     id int not null primary key auto_increment,
     car_id int not null,
     client_id int not null,
     foreign key(car_id) references cars(id),
     foreign key(client_id) references clients(id)
); |

INSERT into marks(mark) values('Audi');|
INSERT into marks(mark) values('Porsche'); |
insert into cars(mark_id, model, price) values (1, 'A5', 50000); |
insert into cars(mark_id, model, price) values (2, 'panamera', 100000); |
insert into cars(mark_id, model, price) values (2, 'caymen S', 88000); |
insert into clients(name, age) values ('petro', 20), ('vasya', 25), ('vitaly', 75); |
insert into orders(car_id, client_id) values(1, 1), (2, 2), (1, 3); |

CREATE PROCEDURE number_1 ()
BEGIN
SELECT id, name, MIN(age) FROM clients;
END
| 
CALL number_1;|

CREATE PROCEDURE number_2 ()
BEGIN
	SELECT car_id, client_id
    FROM orders
    WHERE client_id = 
		(SELECT id FROM clients WHERE age = 
		(SELECT MIN(age) FROM clients));
END
|
CALL number_2;|