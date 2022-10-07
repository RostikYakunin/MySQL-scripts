-- task_2

CREATE DATABASE MyDB;

-- task_3

USE MyDB;

CREATE TABLE Members_Table (
id INT AUTO_INCREMENT NOT NULL,
first_name VARCHAR (10) NOT NULL,
telephone VARCHAR (15) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Salary_Table (
salary INT NOT NULL,
position VARCHAR (30),
id INT,
FOREIGN KEY (id) REFERENCES Memebers_Table (id)
);

CREATE TABLE Personal_Info_Table (
marital_status VARCHAR (10),
date_birth VARCHAR (10),
adress VARCHAR (50),
id INT,
FOREIGN KEY (id) REFERENCES Memebers_Table (id)
);

INSERT INTO Memebers_Table (first_name, telephone)
VALUES ('Pavel', 0669876738);

INSERT INTO personal_info_table (marital_status, date_birth, adress, id)
VALUES ('not maried', '12.09.1990', 'Ivanova str. 12', 1);

INSERT INTO salary_table (salary, position, id)
VALUES (10000, 'manager', 1);

INSERT INTO Memebers_Table (first_name, telephone)
VALUES ('Ivan', 0504785467);

INSERT INTO personal_info_table (marital_status, date_birth, adress, id)
VALUES ('not maried', '24.07.1998', 'Bankova str. 37', 2);

INSERT INTO salary_table (salary, position, id)
VALUES (12000, 'main manager', 2);

-- task_4
SELECT id FROM mydb.salary_table
WHERE salary > 10000;

-- task_5
UPDATE personal_info_table 
SET marital_status = 'maried'
WHERE id = 1;

-- task7
USE mydb;

CREATE TABLE Car_Table (
id INT AUTO_INCREMENT NOT NULL,
mark VARCHAR (10) NOT NULL,
model VARCHAR (10) NOT NULL,
engine_capacity VARCHAR (10) NOT NULL,
price INT NOT NULL,
max_speed INT NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO Car_Table (mark, model, engine_capacity, price, max_speed)
VALUES ('BMW', 'X3', 'M230', 14000, 250);

INSERT INTO Car_Table (mark, model, engine_capacity, price, max_speed)
VALUES ('Audi', 'Xz5', 'Xz270', 21000, 350);
