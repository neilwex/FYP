
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
						   ('CS105','Computer Mathematics',10,15,85, 'C. Smith'),
						   ('CS106','Introductory Telecommunications',5,10,90, 'A. Williams'),
						   ('CS107','Digital Logic Design',5,10,90, 'B. Thompson'),
						   ('CS108','Computers in Society',5,10,90, 'C. Smith'),
						   ('CS109','Introduction to Software Engineering',5,10,90, 'C. Smith');

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
INSERT INTO results VALUES ('1001','CS101',15,60),('1002','CS101',10,55),('1003','CS101',00,42),('1004','CS101',05,28),('1005','CS101',15,64),('1006','CS101',14,44),('1007','CS101',20,59),('1008','CS101',20,75),('1009','CS101',11,53),('1010','CS101',08,50),('1011','CS101',13,50),('1012','CS101',13,64),('1013','CS101',10,39),('1014','CS101',07,44),('1015','CS101',13,61),('1016','CS101',17,32),('1017','CS101',18,57),('1018','CS101',10,49),('1019','CS101',00,43),('1020','CS101',14,60),
						   ('1001','CS102',20,68),('1002','CS102',15,59),('1003','CS102',15,50),('1004','CS102',10,48),('1005','CS102',18,55),('1006','CS102',13,49),('1007','CS102',16,50),('1008','CS102',14,44),('1009','CS102',07,44),('1010','CS102',18,41),('1011','CS102',18,49),('1012','CS102',15,52),('1013','CS102',12,44),('1014','CS102',10,47),('1015','CS102',18,59),('1016','CS102',12,40),('1017','CS102',14,50),('1018','CS102',12,51),('1019','CS102',05,41),('1020','CS102',09,55),
                           ('1001','CS103',12,59),('1002','CS103',09,52),('1003','CS103',12,56),('1004','CS103',07,50),('1005','CS103',11,52),('1006','CS103',06,41),('1007','CS103',12,35),('1008','CS103',11,50),('1009','CS103',09,41),('1010','CS103',07,52),('1011','CS103',11,42),('1012','CS103',12,59),('1013','CS103',06,39),('1014','CS103',11,47),('1015','CS104',15,68),('1016','CS104',11,46),('1017','CS104',05,40),('1018','CS104',09,44),('1019','CS104',07,47),('1020','CS104',09,60),
                           ('1001','CS104',13,67),('1002','CS104',07,41),('1003','CS104',06,31),('1004','CS104',12,44),('1005','CS104',14,59),('1006','CS104',09,44),('1007','CS104',10,55),('1008','CS105',09,64),('1009','CS105',11,49),('1010','CS105',10,41),('1011','CS105',09,45),('1012','CS105',15,60),('1013','CS105',08,44),('1014','CS105',10,42),('1015','CS105',10,44),('1016','CS105',09,40),('1017','CS105',08,50),('1018','CS105',10,50),('1019','CS105',00,41),('1020','CS105',08,45),          
						   ('1001','CS107',10,52),('1002','CS107',06,50),('1003','CS106',02,35),('1004','CS107',04,41),('1005','CS106',05,50),('1006','CS107',06,49),('1007','CS106',06,51),('1008','CS106',05,49),('1009','CS107',06,51),('1010','CS107',08,59),('1011','CS106',04,36),('1012','CS107',08,64),('1013','CS107',05,45),('1014','CS106',02,26),('1015','CS106',04,41),('1016','CS107',04,51),('1017','CS107',08,55),('1018','CS106',01,31),('1019','CS107',00,38),('1020','CS107',07,51),
						   ('1001','CS109',10,82),('1002','CS108',06,55),('1003','CS108',06,49),('1004','CS109',08,65),('1005','CS109',10,71),('1006','CS108',06,50),('1007','CS109',08,65),('1008','CS109',10,85),('1009','CS109',08,59),('1010','CS109',10,58),('1011','CS108',08,50),('1012','CS108',10,69),('1013','CS109',07,55),('1014','CS109',08,52),('1015','CS109',10,75),('1016','CS109',08,60),('1017','CS109',09,62),('1018','CS109',06,59),('1019','CS108',04,43),('1020','CS109',10,59);

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
