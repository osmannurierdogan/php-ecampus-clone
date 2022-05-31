SET foreign_key_checks = 0;
DROP TABLE IF EXISTS department, instructor, project, instrinprojects, gradsinprojects, student, emails, gradstudent, prevdegrees, curricula, curriculacourses, course, sectionn, enrolled, timeslot, exam, attends;

CREATE TABLE department (
dName VARCHAR(25) NOT NULL,
budget REAL NOT NULL, 
headSSn INT NOT NULL, 
buildingName varchar(5) NOT NULL,
PRIMARY KEY(dname)
);

CREATE TABLE instructor (
ssn INT NOT NULL,
iName VARCHAR(20) NOT NULL,
rankk VARCHAR(10) NOT NULL,
baseSalary REAL NOT NULL,
extraSalary REAL,
dName VARCHAR(25) NOT NULL,
PRIMARY KEY (ssn)
);

CREATE TABLE project (
leadSsn INT NOT NULL, 
prName VARCHAR(20) NOT NULL, 
budget REAL NOT NULL, 
startDate DATE NOT NULL, 
endDate DATE NOT NULL, 
subjectt VARCHAR(10) NOT NULL,
contrDName VARCHAR(25) NOT NULL,
PRIMARY KEY (prName),
KEY(leadSsn)
);

CREATE TABLE instrinprojects(
PrjleadSsn INT NOT NULL,
prName VARCHAR(20) NOT NULL, 
issn INT NOT NULL, 
workingHours INT
);

CREATE TABLE gradsinprojects(
PrjleadSsn INT NOT NULL, 
prName VARCHAR(20) NOT NULL,
gradsssn INT NOT NULL, 
workingHours INT
);

CREATE TABLE course (
courseCode VARCHAR(8) NOT NULL, 
ects INT NOT NULL, 
courseName VARCHAR(20) NOT NULL, 
numHours INT, 
preReqCourseCode VARCHAR(8),
PRIMARY KEY (courseCode)
);

CREATE TABLE sectionn(
semester varchar(6) NOT NULL, 
courseCode VARCHAR(8) NOT NULL, 
yearr INT NOT NULL, 
sectionID INT NOT NULL, 
issn INT NOT NULL, 
quota INT,
PRIMARY KEY (sectionID), 
KEY(semester), KEY(yearr), KEY(issn), KEY(courseCode) 
);

CREATE TABLE enrolled(
sssn INT NOT NULL, 
lettergrade VARCHAR(2),
semester varchar(6) NOT NULL,
yearr INT NOT NULL, 
courseCode VARCHAR(8) NOT NULL,
sectionID INT NOT NULL, 
issn INT NOT NULL, 
hourr INT NOT NULL, 
dayy VARCHAR(12) NOT NULL,  
PRIMARY KEY (sssn)
);

CREATE TABLE timeslot(
hourr INT NOT NULL, 
dayy  VARCHAR(12) NOT NULL, 
PRIMARY KEY (dayy),
KEY(hourr)
); 

CREATE TABLE exam(
datee DATE NOT NULL, 
semester varchar(6) NOT NULL, 
courseCode VARCHAR(8) NOT NULL, 
yearr INT NOT NULL, 
sectionID INT NOT NULL, 
ename VARCHAR(20) NOT NULL, 
issn INT NOT NULL,
PRIMARY KEY (ename, courseCode), 
KEY(semester), KEY(courseCode), KEY(yearr), KEY(sectionID), KEY(issn)      
);

CREATE TABLE attends(
semester varchar(6) NOT NULL,
courseCode VARCHAR(8) NOT NULL, 
yearr INT NOT NULL, 
sectionID INT NOT NULL, 
ename VARCHAR(20) NOT NULL, 
issn INT NOT NULL,
sssn INT NOT NULL, 
score INT NOT NULL
); 

CREATE TABLE student(
sssn INT NOT NULL, 
gradorUgrad VARCHAR(2) NOT NULL, 
advisorSsn INT NOT NULL, 
currCode VARCHAR(4) NOT NULL, 
sName VARCHAR(20) NOT NULL, 
studentId VARCHAR (10) NOT NULL, 
PRIMARY KEY(sssn)
);

CREATE TABLE emails(
sssn INT NOT NULL, 
email VARCHAR(20) NOT NULL,
PRIMARY KEY (sssn, email)
); 

CREATE TABLE gradstudent (
sssn INT NOT NULL,
advisorSsn INT NOT NULL,
PRIMARY KEY (sssn)
);

CREATE TABLE prevdegrees(
collage VARCHAR(10) NOT NULL,
degree REAL NOT NULL, 
yearr INT NOT NULL, 
gradsssn INT NOT NULL,
PRIMARY KEY (collage, degree, yearr, gradsssn)
);

CREATE TABLE curricula(
currCode VARCHAR(4) NOT NULL, 
gradorUgrad VARCHAR(2) NOT NULL, 
dName VARCHAR(25) NOT NULL, 
PRIMARY KEY (currCode),
KEY (dName)
);

CREATE TABLE curriculacourses(
courseCode VARCHAR(8) NOT NULL,
dname VARCHAR(25) NOT NULL,
currCode VARCHAR(4) NOT NULL
);

SET foreign_key_checks = 0;
ALTER TABLE department
ADD CONSTRAINT departmentheadSsnFK FOREIGN KEY (headSSn) REFERENCES instructor(ssn);

ALTER TABLE instructor
ADD CONSTRAINT instructordnameFK FOREIGN KEY (dName) REFERENCES department(dName);

ALTER TABLE project
ADD CONSTRAINT projectleadSsnFK FOREIGN KEY (leadSsn) REFERENCES instructor(ssn),
ADD CONSTRAINT projectcontrDnameFK FOREIGN KEY (contrDName) REFERENCES department(dName);

ALTER TABLE student
ADD CONSTRAINT studentcurrCodeFK FOREIGN KEY (currCode) REFERENCES curricula(currCode),
ADD CONSTRAINT studentadvisorSsnFK FOREIGN KEY (advisorSsn) REFERENCES instructor(ssn);

ALTER TABLE emails
ADD CONSTRAINT emailssssnFK FOREIGN KEY (sssn) REFERENCES student(sssn);

ALTER TABLE gradstudent
ADD CONSTRAINT gradstudentadvisorSsnFK FOREIGN KEY (advisorSsn) REFERENCES instructor(ssn),
ADD CONSTRAINT gradstudentsssnFK FOREIGN KEY (sssn) REFERENCES student(sssn);

ALTER TABLE prevdegrees
ADD CONSTRAINT prevdegreesgradsssnFK FOREIGN KEY (gradsssn) REFERENCES gradstudent(sssn);

ALTER TABLE curricula
ADD CONSTRAINT curriculadnameFK FOREIGN KEY (dName) REFERENCES department(dName);

ALTER TABLE curriculacourses
ADD CONSTRAINT curriculacoursesdnameFK FOREIGN KEY (dName) REFERENCES department(dName),
ADD CONSTRAINT curriculacoursescurrCodeFK FOREIGN KEY (currCode) REFERENCES curricula(currCode),
ADD CONSTRAINT curriculacoursescourseCodeFK FOREIGN KEY (courseCode) REFERENCES course(courseCode);

ALTER TABLE course
ADD CONSTRAINT coursepreReqCourseCodeFK FOREIGN KEY (preReqCourseCode) REFERENCES course(courseCode);

ALTER TABLE sectionn
ADD CONSTRAINT sectionnissnFK FOREIGN KEY (issn) REFERENCES instructor(ssn),
ADD CONSTRAINT sectionncourseCodeFK FOREIGN KEY (courseCode) REFERENCES course(courseCode);

ALTER TABLE gradsinprojects
ADD CONSTRAINT gradsinprojectsprNameFK FOREIGN KEY (prName) REFERENCES project(prName),
ADD CONSTRAINT gradsinprojectsgradsssnFK FOREIGN KEY (gradsssn) REFERENCES gradstudent(sssn),
ADD CONSTRAINT gradsinprojectsPrjleadSsnFK FOREIGN KEY (PrjleadSsn) REFERENCES project(leadSsn);

ALTER TABLE instrinprojects
ADD CONSTRAINT instrinprojectsprNameFK FOREIGN KEY (prName) REFERENCES project(prName),
ADD CONSTRAINT instrinprojectsissnFK FOREIGN KEY (issn) REFERENCES instructor(ssn),
ADD CONSTRAINT instrinprojectsPrjleadSsnFK FOREIGN KEY (PrjleadSsn) REFERENCES project(leadSsn);

ALTER TABLE exam 
ADD CONSTRAINT examyearrFK FOREIGN KEY (yearr) REFERENCES sectionn(yearr),
ADD CONSTRAINT examcourseCodeFK FOREIGN KEY (courseCode) REFERENCES sectionn(courseCode),
ADD CONSTRAINT examsemesterFK FOREIGN KEY (semester) REFERENCES sectionn(semester),
ADD CONSTRAINT examissnFK FOREIGN KEY (issn) REFERENCES sectionn(issn),
ADD CONSTRAINT examsectionIDFK FOREIGN KEY (sectionID) REFERENCES sectionn(sectionID);

ALTER TABLE enrolled
ADD CONSTRAINT enrolledsemesterFK FOREIGN KEY (semester) REFERENCES sectionn(semester),
ADD CONSTRAINT enrolledcourseCodeFK FOREIGN KEY (courseCode) REFERENCES sectionn(courseCode),
ADD CONSTRAINT enrolledyearrFK FOREIGN KEY (yearr) REFERENCES sectionn(yearr),
ADD CONSTRAINT enrolledsectionIDFK FOREIGN KEY (sectionID) REFERENCES sectionn(sectionID),
ADD CONSTRAINT enrolledsssnFK FOREIGN KEY (sssn) REFERENCES student(sssn),
ADD CONSTRAINT enrolleddayyFK FOREIGN KEY (dayy) REFERENCES timeslot(dayy),
ADD CONSTRAINT enrolledhourrFK FOREIGN KEY (hourr) REFERENCES timeslot(hourr),
ADD CONSTRAINT enrolledissnFK FOREIGN KEY (issn) REFERENCES instructor(ssn);

ALTER TABLE attends
ADD CONSTRAINT attendssemesterFK FOREIGN KEY (semester) REFERENCES exam(semester),
ADD CONSTRAINT attendscourseCodeFK FOREIGN KEY (courseCode) REFERENCES exam(courseCode),
ADD CONSTRAINT attendsyearrFK FOREIGN KEY (yearr) REFERENCES exam(yearr),
ADD CONSTRAINT attendsissnFK FOREIGN KEY (issn) REFERENCES exam(issn),
ADD CONSTRAINT attendssssnFK FOREIGN KEY (sssn) REFERENCES enrolled(sssn),
ADD CONSTRAINT attendssectionIDFK FOREIGN KEY (sectionID) REFERENCES exam(sectionID),
ADD CONSTRAINT attendsenameFK FOREIGN KEY (ename) REFERENCES exam(ename);

SET foreign_key_checks = 1;