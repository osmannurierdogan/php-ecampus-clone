DROP TABLE IF EXISTS department, instructor, project, instrinprojects, gradsinprojects, student , emails , gradstudent, prevdegrees, curricula , curriculacourses, course, sectionn , enrolled, timeslot, exam, attends;

CREATE TABLE department (
dName char(25) not null,
budget real not null, 
headSSn int not null, 
buildingName vpsycar(5) not null,
primary key(dname)
);

CREATE TABLE instructor (
ssn int not null,
iName char(20) not null,
rankk char(10) not null,
baseSalary real not null,
extraSalary real,
dName char(25) not null,
primary key (ssn)
);

CREATE TABLE project (
leadSsn int not null, 
prName char(20) not null, 
budget real not null, 
startDate date not null, 
endDate date not null, 
subjectt char(10) not null,
contrDName char(25) not null,
primary key (prName),
KEY(leadSsn)
);

CREATE TABLE instrinprojects(
PrjleadSsn int not null,
prName char(20) not null, 
issn int not null, 
workingHours int
);

CREATE TABLE gradsinprojects(
PrjleadSsn int not null, 
prName char(20) not null,
gradsssn int not null, 
workingHours int
);

CREATE TABLE course (
courseCode char(8) not null, 
ects int not null, 
courseName char(20) not null, 
numHours int, 
preReqCourseCode char(8),
primary key (courseCode)
);

CREATE TABLE sectionn(
semester varchar(6) not null, 
courseCode char(8) not null, 
yearr int not null, 
sectionID int not null, 
issn int not null, 
quota int,
primary key (sectionID), 
key(semester), 
key(yearr), 
key(issn), 
key(courseCode) 
);

CREATE TABLE enrolled(
sssn int not null, 
lettergrade char(2),
semester varchar(6) not null,
yearr int not null, 
courseCode char(8) not null,
sectionID int not null, 
issn int not null, 
hourr int not null, 
dayy char(12) not null,  
primary key (sssn)
);


CREATE TABLE timeslot(
hourr int not null, 
dayy  char(12) not null, 
primary key (dayy),
key(hourr)
); 

CREATE TABLE exam(
datee date not null, 
semester varchar(6) not null, 
courseCode char(8) not null, 
yearr int not null, 
sectionID int not null, 
ename char(20) not null, 
issn int not null,
primary key (ename), 
key(semester), 
key(courseCode), 
key(yearr), 
key(sectionID), 
key (issn) 
);

CREATE TABLE attends(
semester varchar(6) not null,
courseCode char(8) not null, 
yearr int not null, 
sectionID int not null, 
ename char(20) not null, 
issn int not null,
sssn int not null, 
score int not null
); 


CREATE TABLE student(
sssn int not null, 
gradorUgrad char(2) not null, 
advisorSsn int not null, 
currCode char(4) not null, 
sName char(20) not null, 
studentId char (10) not null, 
primary key(sssn)
);

CREATE TABLE emails(
sssn int not null, 
email char(20) not null,
primary key (sssn, email)
); 

CREATE TABLE gradstudent (
sssn INT NOT NULL,
advisorSsn INT NOT NULL,
primary KEY (sssn)
);


CREATE TABLE prevdegrees(
collage char(10) not null,
degree real not null, 
yearr int not null, 
gradsssn int not null,
primary key (collage, degree, yearr, gradsssn)
);


CREATE TABLE curricula(
currCode char(4) not null, 
gradorUgrad char(2) not null, 
dName char(25) not null, 
primary key (currCode),
key (dName)
);

CREATE TABLE curriculacourses(
courseCode char(8) not null,
dname char(25) not null,
currCode char(4) not null
);

INSERT INTO gradsinprojects (PrjleadSsn, prName, gradsssn, workingHours) VALUES 
(4856961, 'Sculpture', 1011123,26),
(2543618, 'Exhibition', 1011125,48),
(2210458, 'Powerlifting', 1011132,107);

INSERT INTO student (sssn, gradorUgrad, advisorSsn, currCode, sName, studentId) VALUES
(1011123,'GR', 4856961, 'fiar','Osman', '16fiar2000'),
(1011125,'GR', 2543618, 'fiar','Nuri', '16fiar2008'),
(1011132,'GR', 2210458, 'sprt','Erdogan', '18sprt2010'),
(1011148,'GR', 2210458, 'sprt','Ozlem', '19sprt2051'),
(1011156,'GR', 1597324, 'csep','Stephen', '19csep2032'),
(2022213,'UG', 1597324, 'cse','Kobe', '20csep2044'),
(2022233,'UG', 2314011, 'asci','Alpaslan', '17arsc2018'),
(2022266,'UG', 1110452, 'psy','Ayhan', '17psyc2067'),
(2022269,'UG', 1110452, 'psy','Ceyhun', '19psyc2096'),
(2022243,'UG', 1597324, 'cse','Havva', '19csep2105');

INSERT INTO emails (sssn, email)VALUES
(1011123, 'Osman@edu.tr'),
(1011125, 'Nuri@edu.tr'),
(1011132, 'Erdogan@edu.tr'),
(1011132, 'Erdogan2@edu.tr'),
(1011148, 'Ozlem@edu.tr'),
(1011156, 'Stephen@edu.tr'),
(1011156, 'Stephen2@edu.tr'),
(1011156, 'Stephen@outlook.com'),
(2022213, 'Kobe@edu.tr'),
(2022233, 'Alpaslan@edu.tr'),
(2022266, 'Ayhan@edu.tr'),
(2022269, 'Ceyhun@edu.tr'),
(2022269, 'CeyhunB@hotmail.com'),
(2022243, 'Havva@edu.tr');

INSERT INTO gradstudent (sssn, advisorSsn) VALUES
(1011123, 4856961),
(1011125, 2543618),
(1011132, 2210458),
(1011148, 2210458),
(1011156, 1597324);

INSERT INTO prevdegrees (collage, degree, yearr, gradsssn) VALUES
('METU', 2.56, 2015, 1011123),
('ISIK', 3.10, 2015, 1011125),
('HARVARD', 2.25, 2017, 1011132),
('OXFORD', 2.86, 2018, 1011148),
('STANFORD', 3.76, 2018, 1011156);

INSERT INTO curricula (currCode, gradOrUGrad, dName) VALUES
('fiar', 'GR','FineArts'),
('fnar', 'UG','FineArts'),
('sprt', 'GR','Sport'),
('spo', 'UG','Sport'),
('csep', 'GR','ComputerScience'),
('cse', 'UG','ComputerScience'),
('arsc', 'GR','ArtsScience'),
('asci', 'UG','ArtsScience'),
('psyc', 'GR','Psychology'),
('psy', 'UG','Psychology'),
('econ', 'GR','Economics'),
('eco', 'UG','Economics');

INSERT INTO curriculacourses (courseCode, dname, currCode) VALUES 
('fiar1001','FineArts','fiar'),
('fiar3106','FineArts','fiar'),
('fnar1111','FineArts','fnar'),
('csep1001','ComputerScience','csep'),
('csep2011','ComputerScience','csep'),
('cse21012','ComputerScience','cse'),
('sprt3106','Sport','sprt'),
('spo2211','Sport','spo'),
('spo3301','Sport','spo'),
('arsc4106','ArtsScience','arsc'),
('asci3001','ArtsScience','asci'),
('psyc3114','Psychology','psyc'),
('psy3111','Psychology','psy'),
('psy2222','Psychology','psy'),
('econ1005','Economics','econ'),
('econ1007','Economics','econ'),
('eco2016','Economics','eco'),
('eco2118','Economics','eco');


INSERT INTO project (leadSsn, prName, budget, startDate, endDate, subjectt, contrDName) VALUES
(4856961, 'Sculpture', 5000.0, '2018-05-02', '2022-04-11', 'A', 'FineArts'),
(2543618, 'Exhibition', 8000.0, '2021-11-08', '2022-04-23', 'B', 'FineArts'),
(2210458, 'Powerlifting', 4000.0, '2020-06-20', '2020-07-14', 'C', 'Sport');

INSERT INTO department (dName, budget, headSSn, buildingName) VALUES
('Psychology', 10000, 110012, 'AMF'),
('Sport', 15000, 2210458, 'D/K'),
('ArtsScience', 8000, 2314011, 'LMF'),
('FineArts', 20000, 2543618, 'D/K'),
('ComputerScience', 16000, 1597324, 'DMF'),
('Economics', 5.000, 9990018,'DMF');

INSERT INTO instructor (ssn, iName, rankk, baseSalary, extraSalary, dName) VALUES
(1110452, 'Ayhan', 'Associate', 14000.0, 0.0, 'Psychology'),
(2210458, 'Özlem', 'Adjunct', 16000.0, 0.0, 'Sport'),
(2314011, 'İlyas', 'Adjunct', 18000.0, 0.0, 'ArtsScience'),
(2543618, 'Alp', 'Associate', 14000.0, 0.0, 'FineArts'),
(1597324, 'Reyhan', 'Associate', 7000.0, 0.0, 'ComputerScience'),
(9990018, 'Betül', 'Assistant', 17000.0, 0.0, 'Economics'),
(4856961, 'Ayşegül', 'Research', 10000.0, 0.0, 'FineArts'),
(3654821, 'Ali', 'Visiting', 19000.0, 0.0, 'Sport');


INSERT INTO instrinprojects (PrjleadSsn, prName, issn, workingHours) VALUES
(2543618, 'Exhibition', 4856961,128),
(2210458, 'Powerlifting', 3654821,217),
(2543618, 'Exhibition', 2543618, 265),
(4856961, 'Sculpture', 4856961, 96),
(2210458, 'Powerlifting', 2210458, 300);

INSERT INTO course (courseCode, ects, courseName, numHours, preReqCourseCode) VALUES
('fiar1001', 5, 'Introduction to Fine Arts', 3, null),
('fiar3106', 4, 'Advance Principles of Fine Arts ',4, 'fiar1001'),
('fnar1111', 3, 'MedIn', 5, null),
('csep1001', 3, 'Introduction to Programming', 5, null),
('csep2011', 4, 'Object Oriented Programming', 3, 'csep1001'),
('cse21012', 3, 'OOP', 3, null),
('sprt3106', 4, 'Science of Exercise', 2, null),
('spo2211', 2, 'Progressive Overload', 3, null),
('spo3301', 4, 'Physiotherapy', 4, 'spo2211'),
('arsc4106', 5, 'Introduction to Science', 2, null),
('asci3001', 5, 'Mathematics 101', 4, null),
('psyc3114', 1, 'Introduction to Psychology', 5, null),
('psy3111', 1, 'Fundamentals of Psychological Research', 5, 'psy2222'),
('psy2222', 3, 'Advanced Techniques to Psychological Research', 4, null),
('econ1005', 5,'Microeconomics', 5, null),
('econ1007', 6,'Macroeconomics', 2, 'econ1005'),
('eco2016', 4, 'Taxation Policy in Turkey', 2, null),
('eco2118', 5,'Principles of Management', 3, 'eco2016');


INSERT INTO sectionn (semester, courseCode, yearr, sectionID, issn, quota) VALUES
('Fall', 'fiar1001', 2016, 101, 2543618, 50), 
('Fall', 'fiar3106', 2021, 102, 2543618, 70), 
('Fall', 'fnar1111', 2020, 103, 4856961, 90), 
('Fall', 'csep1001', 2018, 201, 1597324, 50), 
('Spring', 'csep2011', 2020, 202, 1597324, 50), 
('Spring', 'cse21012', 2020, 203, 1597324, 50), 
('Spring', 'sprt3106', 2020, 301, 3654821, 70), 
('Spring', 'spo2211', 2018, 302, 2210458, 90), 
('Fall', 'spo3301', 2016, 303, 2210458, 85), 
('Fall', 'arsc4106', 2017, 401, 2314011, 120), 
('Spring', 'asci3001', 2017, 402, 2314011, 80), 
('Fall', 'psyc3114', 2018, 501, 1110452, 90), 
('Fall', 'psy3111', 2019, 502, 1110452, 85), 
('Spring', 'psy2222', 2019, 503, 1110452, 120), 
('Spring', 'econ1005', 2021, 601, 9990018, 50), 
('Spring', 'econ1007', 2019, 602, 9990018, 40), 
('Fall', 'eco2016', 2019, 603, 9990018, 100), 
('Fall', 'eco2118', 2018, 604, 9990018, 85);


INSERT INTO enrolled (sssn, lettergrade, semester, yearr, courseCode, sectionID, issn, hourr, dayy) VALUES
(1011123, 'AA', 'Fall', 2016, 'fiar1001', 101, 2543618, 3, 'TTT'),
(1011125, 'BA', 'Fall', 2016, 'fiar1001', 101, 2543618, 3, 'TTT'),
(1011132, 'CC', 'Spring', 2020, 'sprt3106', 301, 3654821, 2, 'WW'),
(1011148, 'DD', 'Spring', 2020, 'sprt3106', 301, 3654821, 2, 'WW'),
(1011156, 'FF', 'Spring', 2020, 'csep2011', 202, 1597324, 3, 'MMM'),
(2022213, 'CB', 'Spring', 2020, 'cse21012', 203, 1597324, 3, 'FFF'),
(2022233, 'DC', 'Spring', 2017, 'asci3001', 402, 2314011, 4, 'ThThThTh'),
(2022266, 'AA', 'Fall', 2019, 'psy3111', 502, 1110452, 5, 'FFFFF'),
(2022269, 'BA', 'Spring', 2019, 'psy2222', 503, 1110452, 4, 'TTTT'),
(2022243, 'BB', 'Fall', 2019, 'eco2016', 603, 9990018, 3, 'ThThTh');

INSERT INTO timeslot (hourr, dayy) VALUES 
(3, 'TTT'),
(2, 'WW'),
(3, 'MMM'),
(3, 'FFF'),
(4, 'ThThThTh'),
(5, 'FFFFF'),
(4, 'TTTT'),
(3, 'ThThTh');


INSERT INTO exam (datee, semester, courseCode, yearr, sectionID, ename, issn) VALUES 
('2020-06-05', 'Spring', 'sprt3106',2020, 301, 'Final2020', 3654821),
('2019-03-22', 'Spring', 'psy3111',2019, 502, 'Midterm2019', 1110452),
('2019-02-01', 'Fall', 'eco2016',2019, 603, 'Final2019', 9990018),
('2016-11-28', 'Fall', 'fiar1001',2016, 101, 'Midterm2016', 2543618),
('2017-12-12', 'Fall', 'fiar1001',2017, 101, 'Midterm2017', 2543618);


INSERT INTO attends (semester, courseCode, yearr, sectionID, ename, issn, sssn, score) VALUES 
('Spring', 'sprt3106',2020, 301, 'Final2020', 3654821, 1011148, 62),
('Spring', 'psy3111',2019, 502, 'Midterm2019', 1110452, 2022266, 99),
('Fall', 'eco2016',2019, 603, 'Final2019', 9990018, 2022243, 75),
('Fall', 'fiar1001',2016, 101, 'Midterm2016', 2543618, 1011123, 100),
('Fall', 'fiar1001',2017, 101, 'Midterm2017', 2543618, 1011125, 86);





/* 
INSERT INTO student VALUES
	("11111111111", "UG", "91111111111", "SOFT2019", "Osman Nuri Erdogan", "19SOFT1013"),
	("11111111112", "UG", "91111111111", "SOFT2020", "Orhan Dogan", "19SOFT1014"),
	("11111111113", "UG", "91111111113", "COMP2018", "Ahmet Aslan", "19SOFT1015"),
	("11111111114", "GR", "91111111111", "SOFT2019", "Ahmet Kaya", "19SOFT1016"),
	("11111111115", "UG", "91111111111", "SOFT2019", "Selda Bagcan", "19SOFT1017"),
	("11111111116", "GR", "91111111112", "SOFT2017", "Erkan Balkir", "19SOFT1018"),
	("11111111117", "UG", "91111111111", "SOFT2019", "Elif Su Tuncel", "19SOFT1032"),
	("11111111118", "GR", "91111111111", "SOFT2019", "Aleyna Tilki", "19SOFT1020"),
	("11111111119", "UG", "91111111111", "SOFT2019", "Onur Tan", "19SOFT1021"),
	("11111111120", "UG", "91111111111", "SOFT2019", "Eda Belge", "19SOFT1022");

INSERT INTO emails VALUES 
	("11111111111", "19SOFT1013@isik.edu.tr"), 
	("11111111111", "osmerd04@gmail.com"),
	("11111111111", "onurierdogan@hotmail.com"),
	("11111111111", "osmannurierdogann@gmail.com"),
	("11111111112", "orhandogan@isik.edu.tr"),
	("11111111113", "ahmetaslaan@isik.edu.tr"),
	("11111111114", "ahmetkaya@isik.edu.tr"),
	("11111111115", "seldabagcan@isik.edu.tr"),
	("11111111116", "erkanbalkir@isik.edu.tr"),
	("11111111117", "19SOFT1032@isik.edu.tr"),
	("11111111118", "aleynatilki@isik.edu.tr"),
	("11111111119", "onurtan@isik.edu.tr"),
	("11111111120", "19SOFT1022@isik.edu.tr");

INSERT INTO exam VALUES ();
INSERT INTO attends VALUES ();
INSERT INTO curriculacourses VALUES ();
INSERT INTO curricula VALUES ();
INSERT INTO course VALUES ();
INSERT INTO section VALUES ();
INSERT INTO enrolled VALUES ();
INSERT INTO timeSlot VALUES ();
INSERT INTO prevDegrees VALUES ();
INSERT INTO gradStudent VALUES ();
INSERT INTO department VALUES ();
INSERT INTO instructor VALUES ();
INSERT INTO instrInProjects VALUES ();
INSERT INTO project VALUES ();
INSERT INTO gradsInProjects VALUES ();

 */





/* DROP TABLE IF EXISTS department, instructor, project, instrinprojects, gradsinprojects, student , emails , gradstudent, prevdegrees, curricula , curriculacourses, course, sectionn , enrolled, timeslot, exam, attends;

CREATE TABLE department (
dName char(20) not null,
budget real not null, 
headSSn int not null, 
buildingName char(5) not null,
primary key(dname)
);

INSERT INTO department (dName, budget, headSSn, buildingName) VALUES
('ComputerScience', 10000, 110012, 'AMF'),
('Psychology', 9000, 2210031, 'AMF'),
('ArtsScience', 8000, 2314011, 'D/K'),
('Economics', 6000, 1234567, 'AMF'),
('FineArts', 8000, 8679432, 'D/K'),
('Sport', 15000, 9990018,'DMF');

CREATE TABLE instructor (
ssn int not null,
iName char(20) not null,
rankk char(10) not null,
baseSalary real not null,
extraSalary real,
dName char(20) not null,
primary key (ssn)
);

INSERT INTO instructor (ssn, iName, rankk, baseSalary, extraSalary, dName) VALUES
(1111001, 'Özlem', 'Associate', 15000.0, 0.0, 'Psychology'),
(1111002, 'Ali', 'Adjunct', 17000.0, 0.0, 'Psychology'),
(1111003, 'Ayhan', 'Adjunct', 15000.0, 0.0, 'ArtsScience'),
(1111004, 'Cenk', 'Associate', 14000.0, 0.0, 'FineArts'),
(1111005, 'Refik', 'Adjuct', 16000.0, 0.0, 'ComputerScience'),
(1111006, 'Sevil', 'Assistant', 17000.0, 0.0, 'Economics'),
(1111007, 'Emrah', 'Research', 10000.0, 0.0, 'FineArts'),
(1111008, 'Sezer', 'Visiting', 9000.0, 0.0, 'Sport');

CREATE TABLE project (
leadSsn int not null, 
prName char(20) not null, 
budget real not null, 
startDate date not null, 
endDate date not null, 
subjectt char(10) not null,
contrDName char(20) not null,
primary key (prName),
KEY(leadSsn)
);

INSERT INTO project (leadSsn, prName, budget, startDate, endDate, subjectt, contrDName) VALUES
(4856961, 'ABJK', 5000.0, '2013-05-02', '2015-04-11', 'A', 'FineArts'),
(1234567, 'LMFOK', 8000.0, '2011-11-08', '2012-04-23', 'B', 'FineArts'),
(2210031, 'DFOP', 4000.0, '2019-06-26', '2020-06-14', 'C', 'Sport');

CREATE TABLE instrinprojects(
PrjleadSsn int not null,
prName char(20) not null, 
issn int not null, 
workingHours int
);

INSERT INTO instrinprojects (prjleadSsn, prName, issn, workingHours) VALUES
(1234567, 'LMFOK', 4856961,128),
(2210031, 'DFOP', 7853111,217),
(1234567, 'LMFOK', 1234567, 265),
(4856961, 'ABJK', 4856961, 96),
(2210031, 'DFOP', 2210031, 300);


CREATE TABLE gradsinprojects(
PrjleadSsn int not null, 
prName char(20) not null,
gradsssn int not null, 
workingHours int
);

INSERT INTO gradsinprojects (PrjleadSsn, prName, gradsssn, workingHours) VALUES 
(4856961, 'ABJK', 1011123,26),
(1234567, 'LMFOK', 1011125,48),
(2210031, 'DFOP', 1011132,107);

CREATE TABLE student(
sssn int not null, 
gradorUgrad char(2) not null, 
advisorSsn int not null, 
currCode char(4) not null, 
sName char(20) not null, 
studentId char (10) not null, 
primary key(sssn)
);

INSERT INTO student (sssn, gradorUgrad, advisorSsn, currCode, sName, studentId) VALUES
(1011123,'GR', 4856961, 'mdci','Osman', '16mdci2000'),
(1011125,'GR', 1234567, 'mdci','Nuri', '16mdci2008'),
(1011132,'GR', 2210031, 'biol','Erdogan', '18biol2010'),
(1011148,'GR', 2210031, 'biol','Elif', '19biol2051'),
(1011156,'GR', 8679432, 'csep','Su', '19csep2032'),
(2022213,'UG', 8679432, 'cse','Kevin', '20csep2044'),
(2022233,'UG', 2314011, 'ahi','Muhammed', '17ahis2018'),
(2022266,'UG', 1110012, 'arc','Efe', '17arch2067'),
(2022269,'UG', 1110012, 'arc','Ilyas', '19arch2096'),
(2022243,'UG', 8679432, 'cse','Hizir', '19csep2105');

CREATE TABLE emails(
sssn int not null, 
email char(20) not null,
primary key (sssn, email)
); 

INSERT INTO emails (sssn, email)VALUES
(1011123, 'Nick@edu.tr'),
(1011125, 'Rosa@edu.tr'),
(1011132, 'Hector@edu.tr'),
(1011132, 'Hector2@edu.tr'),
(1011148, 'Hope@edu.tr'),
(1011156, 'Paul@edu.tr'),
(1011156, 'PaulG@edu.tr'),
(1011156, 'Paul@outlook.com'),
(2022213, 'Kevin@edu.tr'),
(2022233, 'Zack@edu.tr'),
(2022266, 'Anna@edu.tr'),
(2022269, 'Julia@edu.tr'),
(2022269, 'JuliaB@hotmail.com'),
(2022243, 'Eve@edu.tr');

CREATE TABLE gradstudent (
		sssn INT NOT NULL,
		advisorSsn INT NOT NULL,
		PRIMARY KEY (sssn)
);


INSERT INTO gradstudent (sssn, advisorSsn) VALUES
(1011123, 4856961),
(1011125, 1234567),
(1011132, 2210031),
(1011148, 2210031),
(1011156, 8679432);

CREATE TABLE prevdegrees(
collage char(10) not null,
degree real not null, 
yearr int not null, 
gradsssn int not null,
primary key (collage, degree, yearr, gradsssn)
);

INSERT INTO prevdegrees (collage, degree, yearr, gradsssn) VALUES
('METU', 2.56, 2015, 1011123),
('ISIK', 3.10, 2015, 1011125),
('HARVARD', 2.25, 2017, 1011132),
('OXFORD', 2.86, 2018, 1011148),
('STANFORD', 3.76, 2018, 1011156);


CREATE TABLE curricula(
currCode char(4) not null, 
gradOrUGrad char(2) not null, 
dName char(20) not null, 
primary key (currCode),
key (dName)
);

INSERT INTO curricula (currCode, gradOrUGrad, dName) VALUES
('fnar', 'GR','FineArts'),
('fnar', 'UG','FineArts'),
('sprt', 'GR','Sport'),
('sprt', 'UG','Sport'),
('csep', 'GR','ComputerScience'),
('cse', 'UG','ComputerScience'),
('art', 'GR','ArtsScience'),
('arts', 'UG','ArtsScience'),
('psy', 'GR','Psychology'),
('psyc', 'UG','Psychology'),
('econ', 'GR','Economics'),
('econ', 'UG','Economics');

CREATE TABLE curriculacourses(
courseCode char(8) not null,
dname char(20) not null,
currCode char(4) not null
);

INSERT INTO curriculacourses (courseCode, dname, currCode) VALUES 
('mdci1101','FineArts','mdci'),
('mdci3106','FineArts','mdci'),
('mdc11110','FineArts','mdc'),
('csep1001','ComputerScience','csep'),
('csep2011','ComputerScience','csep'),
('cse21012','ComputerScience','cse'),
('biol3106','Sport','biol'),
('bio22211','Sport','bio'),
('bio34567','Sport','bio'),
('ahis4106','ArtsScience','ahis'),
('ahi31076','ArtsScience','ahi'),
('arch3114','Psychology','arch'),
('arc31057','Psychology','arc'),
('arc22168','Psychology','arc'),
('econ1005','Economics','econ'),
('econ1007','Economics','econ'),
('eco20016','Economics','eco'),
('eco21018','Economics','eco');


CREATE TABLE course (
courseCode char(8) not null, 
ects int not null, 
courseName char(20) not null, 
numHours int, 
preReqCourseCode char(8),
primary key (courseCode)
);

INSERT INTO course (courseCode, ects, courseName, numHours, preReqCourseCode) VALUES
('mdci1101', 5, 'MedInt', 3, null),
('mdci3106', 4, 'MedAdv',4, 'mdci1101'),
('mdc11110', 3, 'MedIn', 5, null),
('csep1001', 3, 'compIn', 5, null),
('csep2011', 4, 'oopAI', 3, 'csep1001'),
('cse21012', 3, 'OOP', 3, null),
('biol3106', 4, 'Biolog', 2, null),
('bio22211', 2, 'BioMeta', 3, null),
('bio34567', 4, 'Medbio', 4, 'bio22211'),
('ahis4106', 5, 'Hisart', 2, null),
('ahi31076', 5, 'artRec', 4, null),
('arch3114', 1, 'archi', 5, null),
('arc31057', 1, 'areaArch', 5, 'arc22168'),
('arc22168', 3, 'archistor', 4, null),
('econ1005', 5,'microe', 5, null),
('econ1007', 6,'macroe', 2, 'econ1005'),
('eco20016', 4, 'Taxtr', 2, null),
('eco21018', 5,'bankEcon', 3, 'eco20016');

CREATE TABLE sectionn(
semester char(6) not null, 
courseCode char(8) not null, 
yearr int not null, 
sectionID int not null, 
issn int not null, 
quota int,
primary key (sectionID), 
key(semester), 
key(yearr), 
key(issn), 
key(courseCode) 
);

INSERT INTO sectionn (semester, courseCode, yearr, sectionID, issn, quota) VALUES
('FALL16', 'mdci1101', 2016, 101, 1234567, 50), 
('FALL21', 'mdci3106', 2021, 102, 1234567, 70), 
('FALL20', 'mdc11110', 2020, 103, 4856961, 90), 
('FALL18', 'csep1001', 2018, 201, 8679432, 50), 
('SPRG20', 'csep2011', 2020, 202, 8679432, 50), 
('SPRG20', 'cse21012', 2020, 203, 8679432, 50), 
('SPRG20', 'biol3106', 2020, 301, 7853111, 70), 
('SPRG18', 'bio22211', 2018, 302, 2210031, 90), 
('FALL16', 'bio34567', 2016, 303, 2210031, 85), 
('FALL17', 'ahis4106', 2017, 401, 2314011, 120), 
('SPRG17', 'ahi31076', 2017, 402, 2314011, 80), 
('FALL18', 'arch3114', 2018, 501, 1110012, 90), 
('FALL19', 'arc31057', 2019, 502, 1110012, 85), 
('SPRG19', 'arc22168', 2019, 503, 1110012, 120), 
('SPRG21', 'econ1005', 2021, 601, 9990018, 50), 
('SPRG19', 'econ1007', 2019, 602, 9990018, 40), 
('FALL19', 'eco20016', 2019, 603, 9990018, 100), 
('FALL18', 'eco21018', 2018, 604, 9990018, 85);

CREATE TABLE enrolled(
sssn int not null, 
lettergrade char(2),
semester char(6) not null,
yearr int not null, 
courseCode char(8) not null,
sectionID int not null, 
issn int not null, 
hourr int not null, 
dayy char(12) not null,  
primary key (sssn)
);

INSERT INTO enrolled (sssn, lettergrade, semester, yearr, courseCode, sectionID, issn, hourr, dayy) VALUES
(1011123, 'AA', 'FALL16', 2016, 'mdci1101', 101, 1234567, 3, 'TTT'),
(1011125, 'BA', 'FALL16', 2016, 'mdci1101', 101, 1234567, 3, 'TTT'),
(1011132, 'CC', 'SPRG20', 2020, 'biol3106', 301, 7853111, 2, 'WW'),
(1011148, 'DD', 'SPRG20', 2020, 'biol3106', 301, 7853111, 2, 'WW'),
(1011156, 'FF', 'SPRG20', 2020, 'csep2011', 202, 8679432, 3, 'MMM'),
(2022213, 'CB', 'SPRG20', 2020, 'cse21012', 203, 8679432, 3, 'FFF'),
(2022233, 'DC', 'SPRG17', 2017, 'ahi31076', 402, 2314011, 4, 'ThThThTh'),
(2022266, 'AA', 'FALL19', 2019, 'arc31057', 502, 1110012, 5, 'FFFFF'),
(2022269, 'BA', 'SPRG19', 2019, 'arc22168', 503, 1110012, 4, 'TTTT'),
(2022243, 'BB', 'FALL19', 2019, 'eco20016', 603, 9990018, 3, 'ThThTh');

CREATE TABLE timeslot(
hourr int not null, 
dayy  char(12) not null, 
primary key (dayy),
key(hourr)
); 

INSERT INTO timeslot (hourr, dayy) VALUES 
(3, 'TTT'),
(2, 'WW'),
(3, 'MMM'),
(3, 'FFF'),
(4, 'ThThThTh'),
(5, 'FFFFF'),
(4, 'TTTT'),
(3, 'ThThTh');


CREATE TABLE exam(
datee date not null, 
semester char(6) not null, 
courseCode char(8) not null, 
yearr int not null, 
sectionID int not null, 
ename char(20) not null, 
issn int not null,
primary key (ename), 
key(semester), 
key(courseCode), 
key(yearr), 
key(sectionID), 
key (issn) 
);

INSERT INTO exam (datee, semester, courseCode, yearr, sectionID, ename, issn) VALUES 
('2020-06-05', 'SPRG20', 'biol3106',2020, 301, 'Final2020', 7853111),
('2019-03-22', 'SPRG19', 'arc31057',2019, 502, 'Midterm2019', 1110012),
('2019-02-01', 'FALL19', 'eco20016',2019, 603, 'Final2019', 9990018),
('2016-11-28', 'FALL16', 'mdci1101',2016, 101, 'Midterm2016', 1234567),
('2017-12-12', 'FALL17', 'mdci1101',2017, 101, 'Midterm2017', 1234567);

CREATE TABLE attends(
semester char(6) not null,
courseCode char(8) not null, 
yearr int not null, 
sectionID int not null, 
ename char(20) not null, 
issn int not null,
sssn int not null, 
score int not null
); 

INSERT INTO attends (semester, courseCode, yearr, sectionID, ename, issn, sssn, score) VALUES 
('SPRG20', 'biol3106',2020, 301, 'Final2020', 7853111, 1011148, 62),
('SPRG19', 'arc31057',2019, 502, 'Midterm2019', 1110012, 2022266, 99),
('FALL19', 'eco20016',2019, 603, 'Final2019', 9990018, 2022243, 75),
('FALL16', 'mdci1101',2016, 101, 'Midterm2016', 1234567, 1011123, 100),
('FALL17', 'mdci1101',2017, 101, 'Midterm2017', 1234567, 1011125, 86);
 */



























 /* DROP TABLE IF exists attends, course, curriculacourses, curricula, department, emails, enrolled, exam, gradstudent, gradsinprojects, instructor, instrinprojects, project, prevdegrees, section, student, timeslot;

CREATE TABLE Exam(
	date date,
	semester varchar(1),
	courseCode varchar(20),
	yearr varchar(4),
	sectionId varchar(10),
	ename varchar(20),
	issn varchar(11),
	constraint ExamPK primary key (semester, courseCode, yearr, sectionId, ename, issn)
);
CREATE TABLE Attends (
	semester varchar(1),
	courseCode varchar(20),
	yearr varchar(4),
	sectionId varchar(10),
	ename varchar(20),
	issn varchar(11),
	sssn varchar(11),
	score varchar(20),
	constraint AttendsPK primary key (semester, courseCode, yearr, sectionId, ename, issn, sssn)
);
CREATE TABLE CurriculaCourses (
	courseCode varchar(20),
	dName varchar(20),
	currCode varchar(20),
	constraint CurriculaCoursesPK primary key (courseCode, dName, currCode)
);
CREATE TABLE Curricula (
	currCode varchar(20),
	gradOrUGrad char(2),
	dName varchar(20),
	constraint CurriculaPK primary key (currCode, dName)
);
CREATE TABLE Course (
	ects integer,
	courseName varchar(20),
	courseCode varchar(20),
	numHours integer,
	preReqCourseCode varchar(20),
	constraint `CoursePK` primary key (courseCode)
);
CREATE TABLE Section (
	quota integer,
	semester varchar(1),
	courseCode varchar(20),
	yearr varchar(4),
	sectionId integer,
	issn varchar(11),
	constraint SectionPK primary key (courseCode, semester, yearr, sectionId, issn)
);
create table enrolled (
	sssn varchar(11),
	lettergrade char(2),
	semester varchar(1),
	courseCode varchar(20),
	yearr varchar(4),
	sectionId integer,
	issn varchar(11),
	hourr time,
	dayy date,
	constraint EnrolledPK primary key (sssn, semester, courseCode, yearr, sectionId, issn)
);
create table TimeSlot (
	dayy date,
	hourr time,
	constraint TimeSlotPK primary key (dayy, hourr)
);
create table student (
	sssn varchar(11),
	gradOrUGrad char(2),
	advisorSsn varchar(11),
	currCode varchar(20),
	sName varchar(20),
	studentId varchar(20),
	constraint StudentPK primary key (sssn)
);
create table emails (
	sssn varchar(11),
	email varchar(20),
	constraint EmailsPK primary key (sssn, email)
);
create table prevDegrees (
	college varchar(20),
	degree varchar(20),
	year date,
	gradsssn varchar(11),
	constraint PrevDegreesPK primary key (college, degree, year, gradsssn)
);
create table gradStudent (
	sssn varchar(11),
	advisorSsn varchar(11),
	constraint GradStudentPK primary key (sssn)
);
create table Department (
	dName varchar(20),
	budget real,
	headSsn varchar(11),
	buildingName varchar(20),
	constraint DepartmentPK primary key (dName)
);
create table Instructor (
	ssn varchar(11),
	iName varchar(20),
	rankk varchar(20),
	baseSalary real,
	extraSalary real,
	dName varchar(20),
	constraint Instructorssn primary key (ssn)
);
create table InstrInProjects (
	prjleadSsn varchar(11),
	prName varchar(20),
	issn varchar(11),
	workingHours integer,
	constraint InstructorInProjectsPK primary key (prjleadSsn, prName, issn)
);
create table Project (
	leadSsn varchar(11),
	prName varchar(20),
	budget real,
	startDate date,
	endDate date,
	subject varchar(20),
	contrDName varchar(20),
	constraint ProjectPK primary key (leadSsn, prName)
);
create table GradsInProjects (
	prjLeadSsn varchar(11),
	prName varchar(20),
	gradsssn varchar(11),
	workingHours integer,
	constraint GradsInProjectsPK primary key (prjleadSsn, prName, gradsssn)
);

alter table course 
add constraint CoursePreReqCourseCodeFK foreign key course(preReqCourseCode) references course(courseCode);

alter table curricula
add constraint CurriculaDName foreign key (dName) references Department(dName);

alter table curriculaCourses 
add constraint CurriculaCoursesCourseCode foreign key (courseCode) references Course(courseCode),
add constraint CurriculaCoursesDName foreign key (dName) references Curricula(dName),
add constraint CurriculaCoursesCurrCode foreign key (currCode) references Curricula(currCode);

alter table department
add constraint DepartmentHeadSsn foreign key (headSsn) references instructor(ssn);

alter table Instructor
add constraint InstructorDepartmentName foreign key (dName) references Department(dName); 

alter table Project 
add constraint ProjectLeadSsnFK foreign key (leadSsn) references instructor(ssn),
add constraint ProjectContrDNameFK foreign key (contrDName) references department(dName);

alter table instrinprojects
add constraint InstructorInProjectsIssn foreign key (issn) references Instructor(ssn),
add constraint InstructorInProjectsPrName foreign key (prName) references Project(prName),
add constraint InstructorInProjectsPrjLeadSsn foreign key (prjleadSsn) references Project(leadSsn);

ALTER TABLE Section
add constraint SectionInstructorSsn foreign key (issn) references Instructor(ssn);

ALTER TABLE Exam 
ADD constraint ExamSemesterFK foreign key (semester) references section(semester),
ADD constraint ExamCourseCodeFK foreign key (courseCode) references section(courseCode),
ADD constraint ExamYearFK foreign key (yearr) references section(yearr),
ADD constraint ExamSectionIdFK foreign key (sectionId) references section(sectionId),
ADD constraint ExamIssnFK foreign key (issn) references section(issn);

alter table attends
ADD constraint AttendsSemesterFK foreign key (semester) references exam(semester),
ADD constraint AttendsCourseCodeFK foreign key (courseCode) references exam(courseCode),
ADD constraint AttendsYearFK foreign key (yearr) references exam(yearr),
ADD constraint AttendsSectionIdFK foreign key (sectionId) references exam(sectionId),
ADD constraint AttendsIssnFK foreign key (ename) references exam(ename),
ADD constraint AttendsSectionIdFK foreign key (issn) references exam(issn),
ADD constraint AttendsIssnFK foreign key (sssn) references enrolled(sssn);

alter table enrolled 
add constraint EnrolledSemesterFK foreign key (semester) references section(semester),
add constraint EnrolledCourseCodeFK foreign key (courseCode) references section(courseCode),
add constraint EnrolledYearFK foreign key (yearr) references section(yearr),
add constraint EnrolledSectionIdFK foreign key (sectionId) references section(sectionId),
add constraint EnrolledIssnFK foreign key (issn) references Instructor(issn),
add constraint EnrolledSssnFK foreign key (sssn) references student(sssn),
add constraint EnrolledHourrFK foreign key (hourr) references timeslot(hourr),
add constraint EnrolledDayyFK foreign key (dayy) references timeslot(dayy);

alter table gradstudent
add constraint GradStudentAdvisorSsnFK foreign key (advisorSsn) references instructor(ssn);

alter table gradsinprojects
add foreign key (prName) references project(prName),
add foreign key (gradsssn) references gradStudent(sssn);

alter table student
add constraint StudentAdvisorFK foreign key (advisorSsn) references Instructor(ssn),
add constraint StudentCurrCodeFK foreign key (currCode) references Curricula(currCode);

alter table emails
add foreign key (sssn) references student(sssn);

alter table prevdegrees
add foreign key (gradsssn) references gradstudent(sssn);
 */