
-- UNNORMAL TABLE

CREATE DATABASE Task2;
USE Task2;

CREATE TABLE military (
Names VARCHAR (30),
squad INT,
weapon VARCHAR (10),
giver VARCHAR (60)
);

INSERT INTO military (names, squad, weapon, giver)
VALUES 
('Petrov V.A., of. 205', 222, 'AK-47', 'Byrov O.C., major'),
('Petrov V.A., of. 205', 222, 'Glock20', 'Rubakov N.G., major'),
('Lodarev P.S, of. 221', 232, 'AK-47', 'Derebanov V.Y., lieutenant colonel'),
('Lodarev P.S, of. 221', 232, 'Glock20', 'Rubakov N.G., major'),
('Leontiev K.V., of. 201', 212, 'AK-47', 'Byrov O.C., major'),
('Leontiev K.V., of. 201', 212, 'Glock20', 'Rubakov N.G., major'),
('Dyhov V.M.', 200, 'AK-47', 'Byrov O.C., major');

-- ---------------------------------------------------------------------------
-- FIRST FORM NORMALIZATION

DROP DATABASE Task2;

CREATE DATABASE Task2;
USE Task2;

CREATE TABLE military (
Name VARCHAR (30),
office INT DEFAULT NULL,
squad INT,
weapon VARCHAR (10),
giver_name VARCHAR (30),
giver_rank VARCHAR (30)
);

INSERT INTO military (name, office, squad, weapon, giver_name, giver_rank)
VALUES 
('Petrov V.A.', 205, 222, 'AK-47', 'Byrov O.C.', 'major'),
('Petrov V.A.', 205, 222, 'Glock20', 'Rubakov N.G.', 'major'),
('Lodarev P.S.', 221, 232, 'AK-47', 'Derebanov V.Y.', 'lieutenant colonel'),
('Lodarev P.S.', 221, 232, 'Glock20', 'Rubakov N.G.', 'major'),
('Leontiev K.V.', 201, 212, 'AK-47', 'Byrov O.C.', 'major'),
('Leontiev K.V.', 201, 212, 'Glock20', 'Rubakov N.G.', 'major'),
('Dyhov V.M.', NULL, 200, 'AK-47', 'Byrov O.C.', 'major');

-- --------------------------------------------------------------------------------
-- SECOND AND THIRD FORM NORMALIZATION

DROP DATABASE Task2;

CREATE DATABASE Task2;
USE Task2;

CREATE TABLE name_info (
id INT AUTO_INCREMENT,
Name VARCHAR (30),
office INT DEFAULT NULL,
squad INT,
PRIMARY KEY (id)
);

INSERT INTO name_info (name, office, squad)
VALUES 
('Petrov V.A.', 205, 222),
('Lodarev P.S.', 221, 232),
('Leontiev K.V.', 201, 212),
('Dyhov V.M.', NULL, 200);

CREATE TABLE weapon_info (
id INT AUTO_INCREMENT,
weapon VARCHAR (10),
PRIMARY KEY (id)
);

INSERT INTO weapon_info (weapon)
VALUES
('AK-47'),
('Glock20');

CREATE TABLE giver_info (
id INT AUTO_INCREMENT,
giver_name VARCHAR (30),
giver_rank VARCHAR (30),
PRIMARY KEY (id)
);

INSERT INTO giver_info (giver_name, giver_rank)
VALUES
('Byrov O.C.', 'major'),
('Rubakov N.G.', 'major'),
('Derebanov V.Y.', 'lieutenant colonel');

CREATE TABLE military (
enumeration INT AUTO_INCREMENT,
name_id INT,
weapon_id INT,
giver_id INT,
FOREIGN KEY (name_id) REFERENCES name_info (id),
FOREIGN KEY (weapon_id) REFERENCES weapon_info (id),
FOREIGN KEY (giver_id) REFERENCES giver_info (id),
PRIMARY KEY (enumeration)
);

INSERT INTO military (name_id, weapon_id, giver_id)
VALUES 
(1, 1, 1),
(1, 2, 2),
(2, 1, 3),
(2, 2, 2),
(3,1,1),
(3, 2, 2),
(4,1,1);

-- -------------------------------------------------------------------------------
-- TASK 3

CREATE DATABASE Task3 ;
USE Task3;

CREATE TABLE PERSONAL (
id INT AUTO_INCREMENT,
name VARCHAR (10) NOT NULL,
surname VARCHAR (10) NOT NULL,
age INT NOT NULL,
person_info_id INT,
registration_info_id INT,
date_start_end_work_info_id INT,
PRIMARY KEY (id),
FOREIGN KEY (person_info_id) REFERENCES person_info (id),
FOREIGN KEY(registration_info_id) REFERENCES registration_info (id),
FOREIGN KEY(date_start_end_work_info_id) REFERENCES date_start_end_work_info (id)
);

CREATE TABLE person_info (
id INT AUTO_INCREMENT ,
marital_status VARCHAR (10) NOT NULL,
education VARCHAR (20) NOT NULL,
telephone VARCHAR (15) NOT NULL,
position VARCHAR (20) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE registration_info (
id INT AUTO_INCREMENT,
residential_adress VARCHAR (30) NOT NULL,
registration_adress VARCHAR (30) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE date_start_end_work_info (
id INT AUTO_INCREMENT,
date_of_start_work DATE NOT NULL,
date_of_end_work DATE DEFAULT NULL,
PRIMARY KEY (id)
);
