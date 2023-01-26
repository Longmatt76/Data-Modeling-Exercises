-- from the terminal run:
-- psql < med_center.sql

DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center

CREATE TABLE locations
(
id SERIAL PRIMARY KEY,
branch_name TEXT NOT NULL,
address TEXT NOT NULL,
phone_num VARCHAR(13) NOT NULL
);

INSERT INTO locations
(branch_name, address, phone_num)
VALUES
('LMH Main', '507 Maine St. Lawrence Ks, 66044','785-854-8842'),
('LMH West', '1945 W 6th St. Lawrence Ks, 66067', '785-834-9934'),
('LMH Rehab Center', '452 Arizona St. Lawrence Ks, 66046', '785-345-6563'),
('LMH Cancer Center', '1223 E. 23rd St. Lawrence Ks, 66045', '785-574-0978');



CREATE TABLE doctors 
(
id SERIAL PRIMARY KEY,
works_at INT NOT NULL,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
DOB DATE NOT NULL,
is_taking_new_patients BOOLEAN,
FOREIGN KEY (works_at) REFERENCES locations(id)
);

INSERT INTO doctors
(works_at, first_name, last_name, DOB, is_taking_new_patients)
VALUES 
(1, 'Jerry','Miller','1954-12-12','true'),
(3, 'Sarah','James', '1975-07-04','true'),
(2, 'Denis', 'Williams','1965-11-23','false'),
(1, 'Mark', 'Thomas', '1981-01-21','true'),
(4, 'Beth', 'Rodgers', '1973-04-05','false'),
(2, 'Don', 'Joyner', '1966-06-30','true'),
(4, 'Larry', 'Davis','1982-02-22','true'),
(3, 'Sally', 'Lewis', '1990-11-09','false');



CREATE TABLE patients 
(
id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
DOB DATE NOT NULL,
insurance_num INT
);

INSERT INTO patients
(first_name, last_name, DOB, insurance_num)
VALUES
('Becky', 'Bryan','1981-11-01','4563462'),
('Alfred', 'Romero','1951-06-02', '3645257'),
('Julian','Ware', '1997-11-30', '5324778'),
('Myla', 'Gibson','1961-10-07','7543481'),
('Emmit' , 'Hurley','1977-02-05', '8645551'),
('Dylan' , 'Hurst','2004-04-17', '1675790'),
('Beth' , 'Knight','1994-02-19', '6545279');


CREATE TABLE medications 
(
id SERIAL PRIMARY KEY,
med_name TEXT NOT NULL,
indications TEXT NOT NULL,
dosage_mg INT NOT NULL
);

INSERT INTO medications
(med_name, indications, dosage_mg)
VALUES
('Lisinopril', 'high blood pressure', 20),
('Omeprazole', 'heartburn', 10),
('Atorvostatin', 'high cholesterol', 40),
('Albuterol', 'asthma', 100),
('Codeine', 'pain relief', 30),
('Celecoxib', 'arthritis', 50),
('Metformin', 'diabetes', 20);



CREATE TABLE visits 
(
id SERIAL PRIMARY KEY,
pats_id INT NOT NULL,
docs_id INT NOT NULL,
meds_id INT,
FOREIGN KEY (pats_id) REFERENCES patients(id),
FOREIGN KEY (docs_id) REFERENCES doctors(id),
FOREIGN KEY (meds_id) REFERENCES medications(id)
);

INSERT INTO visits
VALUES
(1,2,5,3),
(2,1,4,2),
(3,5,2,NULL),
(4,3,5,7),
(5,4,1,NULL),
(6,6,2,5),
(7,7,3,NULL),
(8,1,2,6),
(9,3,1,NULL),
(10,7,8,4),
(11,4,3,NULL);






