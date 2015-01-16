
-- create results database 

DROP DATABASE IF EXISTS results_db;
CREATE DATABASE results_db;

USE results_db;

-- structure for modules table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

DROP TABLE IF EXISTS modules;

CREATE TABLE modules (
  code VARCHAR(10) NOT NULL DEFAULT '',
  name VARCHAR(50) NOT NULL DEFAULT '',
  credit_weighting INT NOT NULL DEFAULT '0',
  ca_mark_percentage INT NOT NULL DEFAULT '0',
  final_exam_percentage INT NOT NULL DEFAULT '0',
  lecturer VARCHAR(50) DEFAULT '',
  PRIMARY KEY (code)
);

-- empty results table
DELETE FROM modules; 

-- populate modules table
INSERT INTO modules VALUES ('CS101','Introduction to Computer Systems',15,20,80, 'A. Williams'),
						   ('CS102','Introductory Programming',15,20,80, 'B. Thompson'),
						   ('CS103','Information Security',10,15,85, 'A. Williams'),
						   ('CS104','Web Servers',10,15,85, 'B. Thompson'),
						   ('CS105','Computer Mathematics',10,10,90, 'C. Smith'),
						   ('CS106','Introductory Telecommunications',5,10,90, 'A. Williams'),
						   ('CS107','Digital Logic Design',5,20,80, 'B. Thompson'),
						   ('CS108','Computers in Society',5,20,80, 'C. Smith'),
						   ('CS109','Introduction to Software Engineering',5,20,80, 'C. Smith');

-- structure for results table    

DROP TABLE IF EXISTS results;

CREATE TABLE results (
  student_num VARCHAR(10) NOT NULL DEFAULT '',
  module_code VARCHAR(10) NOT NULL DEFAULT '',
  ca_mark INT NOT NULL DEFAULT '0',
  final_exam_mark INT NOT NULL DEFAULT '0',
  PRIMARY KEY (student_num, module_code)
);

-- empty results table
DELETE FROM results;

-- populate modules table
INSERT INTO results VALUES ('1001','CS101',15,60),('1002','CS101',10,55),('1003','CS101',0,42),('1004','CS101',5,28),('1005','CS101',15,64),('1006','CS101',18,74),('1007','CS101',20,59),('1008','CS101',20,75),('1009','CS101',11,53),('1010','CS101',8,50),('1011','CS101',13,20),('1012','CS101',13,64),('1013','CS101',0,32),('1014','CS101',7,44),('1015','CS101',13,61),('1016','CS101',17,32),('1017','CS101',18,57),('1018','CS101',10,49),('1019','CS101',0,43),('1020','CS101',14,60),('1001','CS102',20,68),('1003','CS102',15,59),('1005','CS102',0,22);

SELECT AVG(ca_mark + final_exam_mark) AS average FROM results; -- WHERE module_code = "CS101";
SELECT MAX(ca_mark + final_exam_mark) as max FROM results; -- WHERE module_code = "CS101";
SELECT MIN(ca_mark + final_exam_mark) AS min FROM results; -- WHERE module_code = "CS101";
SELECT stddev(ca_mark + final_exam_mark) AS stddev FROM results; -- WHERE module_code = "CS101";


--DROP TABLE IF EXISTS countries;
--
--CREATE TABLE countries (
--  code CHAR(3) NOT NULL DEFAULT '',
--  name CHAR(52) NOT NULL DEFAULT '',
--  continent ENUM('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL DEFAULT 'Asia',
--  region CHAR(26) NOT NULL DEFAULT '',
--  surface_area FLOAT(10,2) NOT NULL DEFAULT '0.00',
--  indep_year SMALLINT(6) DEFAULT NULL,
--  population INT(11) NOT NULL DEFAULT '0',
--  life_expectancy FLOAT(3,1) DEFAULT NULL,
--  gnp FLOAT(10,2) DEFAULT NULL,
--  gnp_old FLOAT(10,2) DEFAULT NULL,
--  local_name CHAR(45) NOT NULL DEFAULT '',
--  government_form CHAR(45) NOT NULL DEFAULT '',
--  head_of_state CHAR(60) DEFAULT NULL,
--  capital INT(11) DEFAULT NULL,
--  code2 CHAR(2) NOT NULL DEFAULT '',
--  PRIMARY KEY (code)
--
--) ;
--
--
