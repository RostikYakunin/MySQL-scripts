-- TASK 1 !!!!

CREATE DATABASE warehouse;
USE warehouse;

CREATE TABLE Personal (
id INT AUTO_INCREMENT UNIQUE,
name VARCHAR (10) NOT NULL,
surname VARCHAR (10) NOT NULL,
telephone VARCHAR (15),
position VARCHAR (20),
PRIMARY KEY (id)
);

CREATE TABLE Provider (
id INT AUTO_INCREMENT UNIQUE,
name VARCHAR (10) NOT NULL,
telephone VARCHAR (15),
PRIMARY KEY (id)
);

CREATE TABLE Costumers (
id INT AUTO_INCREMENT UNIQUE,
name VARCHAR (10) NOT NULL,
surname VARCHAR (10) NOT NULL,
telephone VARCHAR (15) DEFAULT 'NULL',
PRIMARY KEY (id)
);

-- TASK 4 !!!

CREATE DATABASE Personal_Departament ;
USE Personal_Departament;

CREATE TABLE PERSONAL (
id INT AUTO_INCREMENT UNIQUE,
name VARCHAR (10) NOT NULL,
surname VARCHAR (10) NOT NULL,
age INT NOT NULL,
marital_status VARCHAR (10) NOT NULL,
education VARCHAR (20) NOT NULL,
telephone VARCHAR (15) NOT NULL,
position VARCHAR (20) NOT NULL,
residential_adress VARCHAR (30) NOT NULL,
registration_adress VARCHAR (30) NOT NULL,
date_of_start_work DATE NOT NULL,
date_of_end_work DATE,
PRIMARY KEY (id)
);


