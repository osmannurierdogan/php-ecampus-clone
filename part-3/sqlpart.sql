
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;




CREATE TABLE attends (
  sssn varchar(20) NOT NULL,
  eName varchar(20) NOT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester varchar(11) NOT NULL,
  sectionId int(11) NOT NULL,
  score double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO attends (sssn, eName, issn, courseCode, yearr, semester, sectionId, score) VALUES
('s1', 'Final', 'i9', 'math2103', 2022, 'spring', 1, NULL),
('s1', 'M1', 'i1', 'comp2222', 2022, 'spring', 1, 60),
('s1', 'M2', 'i1', 'comp2222', 2022, 'spring', 1, NULL),
('s2', 'Final', 'i9', 'math2103', 2022, 'spring', 1, NULL),
('s2', 'M1', 'i1', 'comp2222', 2022, 'spring', 1, 45),
('s2', 'M1', 'i6', 'comp1111', 2022, 'spring', 2, 45),
('s2', 'M2', 'i1', 'comp2222', 2022, 'spring', 1, NULL),
('s2', 'M2', 'i6', 'comp1111', 2022, 'spring', 2, 73),
('s2', 'M3', 'i6', 'comp1111', 2022, 'spring', 2, NULL),
('s4', 'Final', 'i6', 'comp1111', 2019, 'spring', 1, 50),
('s4', 'Final', 'i9', 'math2103', 2022, 'spring', 1, NULL),
('s4', 'M1', 'i6', 'comp1111', 2019, 'spring', 1, 60),
('s4', 'M2', 'i6', 'comp1111', 2019, 'spring', 1, 50),
('s5', 'M1', 'i1', 'comp2222', 2022, 'spring', 1, 88),
('s5', 'M2', 'i1', 'comp2222', 2022, 'spring', 1, NULL);



CREATE TABLE course (
  courseCode varchar(10) NOT NULL,
  courseName varchar(100) NOT NULL,
  ects int(2) NOT NULL,
  numHours int(2) NOT NULL,
  prereq_courseCode varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO course (courseCode, courseName, ects, numHours, prereq_courseCode) VALUES
('comp1111', 'Java Programming', 6, 3, NULL),
('comp1112', 'object oriented', 6, 2, 'comp1111'),
('comp2102', 'data structures', 6, 3, 'comp1112'),
('comp2222', 'database', 7, 3, 'comp1112'),
('INDE2001', 'Operations Research I', 7, 3, NULL),
('INDE2002', 'Operations Research II', 7, 3, 'INDE2001'),
('INDE2156', 'Engineering Statistics', 6, 3, NULL),
('math2103', 'discrete math', 5, 3, NULL);



CREATE TABLE curricula (
  currCode varchar(10) NOT NULL,
  gradOrUrad tinyint(4) NOT NULL,
  dName varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO curricula (currCode, gradOrUrad, dName) VALUES
('arch0813', 0, 'Architecture'),
('comp', 0, 'Computer Engineering'),
('cse0813', 0, 'Computer Engineering'),
('eco0813', 0, 'Economics'),
('gors0813', 0, 'Visual arts'),
('ie0813', 0, 'Industrial Engineering'),
('msc0813', 1, 'Computer Engineering'),
('phd0813', 1, 'Computer Engineering');



CREATE TABLE curriculacourses (
  currCode varchar(10) NOT NULL,
  dName varchar(50) NOT NULL,
  courseCode varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO curriculacourses (currCode, dName, courseCode) VALUES
('comp', 'Computer Engineering', 'comp1111'),
('comp', 'Computer Engineering', 'comp1112'),
('comp', 'Computer Engineering', 'comp2102'),
('comp', 'Computer Engineering', 'comp2222'),
('comp', 'Computer Engineering', 'INDE2156'),
('comp', 'Computer Engineering', 'math2103'),
('ie0813', 'Industrial Engineering', 'INDE2001'),
('ie0813', 'Industrial Engineering', 'INDE2002'),
('ie0813', 'Industrial Engineering', 'INDE2156');



CREATE TABLE department (
  dName varchar(50) NOT NULL,
  budget double DEFAULT NULL,
  headSsn varchar(20) NOT NULL,
  buildingName varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO department (dName, budget, headSsn, buildingName) VALUES
('Architecture', NULL, 'i4', 'dk'),
('Computer Engineering', NULL, 'i1', 'amf'),
('Economics', NULL, 'i3', 'amf'),
('Industrial Engineering', NULL, 'i2', 'amf'),
('Visual arts', NULL, 'i5', 'maslak');



CREATE TABLE emails (
  email varchar(100) NOT NULL,
  sssn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO emails (email, sssn) VALUES
('mscomp1@isik.edu.tr', 's3'),
('mscomp2@isik.edu.tr', 's6'),
('st1@isik.edu.tr', 's1'),
('st2@isik.edu.tr', 's2'),
('st4@isik.edu.tr', 's4'),
('st5@isik.edu.tr', 's5'),
('student1@gmail.com', 's1');



CREATE TABLE enrollment (
  sssn varchar(20) NOT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  sectionId int(11) NOT NULL,
  yearr int(11) NOT NULL,
  semester varchar(11) NOT NULL,
  lettergrade varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO enrollment (sssn, issn, courseCode, sectionId, yearr, semester, lettergrade) VALUES
('s1', 'i1', 'comp2222', 1, 2022, 'spring', NULL),
('s1', 'i5', 'comp2222', 1, 2021, 'spring', 'F'),
('s1', 'i6', 'comp1111', 1, 2022, 'spring', NULL),
('s1', 'i9', 'math2103', 1, 2022, 'spring', NULL),
('s2', 'i1', 'comp2222', 1, 2022, 'spring', NULL),
('s2', 'i6', 'comp1111', 2, 2022, 'spring', NULL),
('s2', 'i9', 'math2103', 1, 2022, 'spring', NULL),
('s3', 'i1', 'comp2222', 2, 2021, 'spring', 'AA'),
('s3', 'i6', 'comp1111', 2, 2019, 'spring', 'BA'),
('s4', 'i1', 'comp2222', 2, 2022, 'spring', NULL),
('s4', 'i4', 'math2103', 1, 2020, 'spring', 'DD'),
('s4', 'i6', 'comp1111', 1, 2019, 'spring', 'CC'),
('s4', 'i6', 'comp1111', 1, 2022, 'spring', NULL),
('s4', 'i8', 'INDE2156', 1, 2022, 'spring', NULL),
('s4', 'i9', 'INDE2156', 2, 2020, 'spring', 'DD'),
('s4', 'i9', 'math2103', 1, 2022, 'spring', NULL),
('s5', 'i1', 'comp2222', 1, 2022, 'spring', NULL),
('s5', 'i9', 'INDE2156', 2, 2022, 'spring', NULL);



CREATE TABLE exam (
  eName varchar(20) NOT NULL,
  edate date DEFAULT NULL,
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester varchar(11) NOT NULL,
  sectionId int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO exam (eName, edate, issn, courseCode, yearr, semester, sectionId) VALUES
('Final', '2018-01-01', 'i6', 'comp1111', 2019, 'spring', 1),
('Final', '2018-01-01', 'i9', 'math2103', 2022, 'spring', 1),
('M1', '2018-01-01', 'i1', 'comp2222', 2022, 'spring', 1),
('M1', '2018-01-01', 'i6', 'comp1111', 2019, 'spring', 1),
('M1', '2018-01-01', 'i6', 'comp1111', 2022, 'spring', 2),
('M2', '2018-01-01', 'i1', 'comp2222', 2022, 'spring', 1),
('M2', '2018-01-01', 'i6', 'comp1111', 2019, 'spring', 1),
('M2', '2018-01-01', 'i6', 'comp1111', 2022, 'spring', 2),
('M3', '2018-01-01', 'i6', 'comp1111', 2022, 'spring', 2);



CREATE TABLE gradstudent (
  ssn varchar(20) NOT NULL,
  supervisorSsn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO gradstudent (ssn, supervisorSsn) VALUES
('s3', 'i1'),
('s6', 'i6');



CREATE TABLE instructor (
  ssn varchar(20) NOT NULL,
  iname varchar(100) DEFAULT NULL,
  rankk varchar(45) DEFAULT NULL,
  baseSal double DEFAULT NULL,
  dName varchar(50) NOT NULL,
  extraSalary double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO instructor (ssn, iname, rankk, baseSal, dName, extraSalary) VALUES
('i1', 'Emine Ekin', 'AsstProf', 50, 'Computer Engineering', NULL),
('i2', 'Caglar Aksezer', 'Prof', 1500, 'Industrial Engineering', NULL),
('i3', 'Ozlem Inanc', 'AsstProf', 50, 'Economics', NULL),
('i4', 'Elif Suyuk Makakli', 'AsstProf', 50, 'Architecture', NULL),
('i5', 'Banu Inanc Uyan Dur', 'AssocProf', 1000, 'Visual Arts', NULL),
('i6', 'Olcay Yildiz', 'Prof', 1500, 'Computer Engineering', NULL),
('i7', 'instructor7', 'lecturer', 40, 'Economics', NULL),
('i8', 'instructor8', 'AssocProf', 1000, 'Architecture', NULL),
('i9', 'Åirin Ã–zlem', 'AsstProf', 50, 'Industrial Engineering', NULL);



CREATE TABLE prevdegree (
  college varchar(100) NOT NULL,
  degree varchar(20) NOT NULL,
  yearr int(11) NOT NULL,
  Gradssn varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO prevdegree (college, degree, yearr, Gradssn) VALUES
('IÅŸÄ±k Un', 'computer Engineer ba', 2019, 's3'),
('IÅŸÄ±k Un', 'computer Engineer ma', 2018, 's6');



CREATE TABLE project (
  leadSsn varchar(20) NOT NULL,
  pName varchar(45) NOT NULL,
  subject varchar(450) DEFAULT NULL,
  budget double DEFAULT NULL,
  startDate date NOT NULL,
  enddate date NOT NULL,
  controllingDName varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO project (leadSsn, pName, subject, budget, startDate, enddate, controllingDName) VALUES
('i1', 'job1', 'about computers', 50000, '2019-06-01', '2023-01-01', 'Computer Engineering'),
('i6', 'job2', 'about life', 1000, '2018-02-02', '2023-06-06', 'Computer Engineering'),
('i7', 'job3', 'money talks', 1000000, '2018-01-01', '2023-01-01', 'Economics');



CREATE TABLE project_has_gradstudent (
  leadSsn varchar(20) NOT NULL,
  pName varchar(45) NOT NULL,
  Gradssn varchar(20) NOT NULL,
  workingHour int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO project_has_gradstudent (leadSsn, pName, Gradssn, workingHour) VALUES
('i1', 'job1', 's3', 40),
('i6', 'job2', 's3', 12),
('i6', 'job2', 's6', 120),
('i7', 'job3', 's6', 8);



CREATE TABLE project_has_instructor (
  leadSsn varchar(20) NOT NULL,
  pName varchar(45) NOT NULL,
  issn varchar(20) NOT NULL,
  workinghour int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO project_has_instructor (leadSsn, pName, issn, workinghour) VALUES
('i1', 'job1', 'i3', 12),
('i1', 'job1', 'i6', 15),
('i6', 'job2', 'i4', 12),
('i7', 'job3', 'i5', 8),
('i7', 'job3', 'i6', 4);



CREATE TABLE sectionn (
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  yearr int(11) NOT NULL,
  semester varchar(11) NOT NULL,
  sectionId int(11) NOT NULL,
  quota int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO sectionn (issn, courseCode, yearr, semester, sectionId, quota) VALUES
('i1', 'comp2222', 2021, 'spring', 2, 40),
('i1', 'comp2222', 2022, 'spring', 1, 40),
('i1', 'comp2222', 2022, 'spring', 2, 40),
('i4', 'math2103', 2020, 'spring', 1, 100),
('i5', 'comp2222', 2021, 'spring', 1, 40),
('i6', 'comp1111', 2019, 'spring', 1, 40),
('i6', 'comp1111', 2019, 'spring', 2, 45),
('i6', 'comp1111', 2022, 'spring', 1, 40),
('i6', 'comp1111', 2022, 'spring', 2, 45),
('i8', 'INDE2156', 2020, 'spring', 1, 20),
('i8', 'INDE2156', 2022, 'spring', 1, 20),
('i9', 'INDE2156', 2020, 'spring', 2, 25),
('i9', 'INDE2156', 2022, 'spring', 2, 25),
('i9', 'math2103', 2022, 'spring', 1, 100);



CREATE TABLE student (
  ssn varchar(20) NOT NULL,
  gradorUgrad tinyint(4) NOT NULL,
  advisorSsn varchar(20) NOT NULL,
  currCode varchar(10) NOT NULL,
  studentid varchar(10) NOT NULL,
  studentname varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO student (ssn, gradorUgrad, advisorSsn, currCode, studentid, studentname) VALUES
('s1', 0, 'i1', 'comp', 'st1', 'student1'),
('s2', 0, 'i6', 'comp', 'st2', 'student2'),
('s3', 0, 'i6', 'comp', 'st3', 'student3'),
('s30', 1, 'i1', 'phd0813', 'mscomp1', 'gradstcse1'),
('s4', 0, 'i6', 'comp', 'st4', 'student4'),
('s40', 0, 'i4', 'arch0813', 'st40', 'student40'),
('s5', 0, 'i2', 'ie0813', 'st5', 'student5'),
('s6', 1, 'i6', 'phd0813', 'mscomp2', 'gradstcse2');



CREATE TABLE timeslot (
  dayy varchar(12) NOT NULL,
  hourr int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO timeslot (dayy, hourr) VALUES
('Friday', 1),
('Friday', 2),
('Friday', 3),
('Friday', 4),
('Friday', 5),
('Friday', 6),
('Friday', 7),
('Friday', 8),
('Friday', 9),
('Friday', 10),
('Friday', 11),
('Friday', 12),
('Friday', 13),
('Monday', 1),
('Monday', 2),
('Monday', 3),
('Monday', 4),
('Monday', 5),
('Monday', 6),
('Monday', 7),
('Monday', 8),
('Monday', 9),
('Monday', 10),
('Monday', 11),
('Monday', 12),
('Monday', 13),
('Saturday', 1),
('Saturday', 2),
('Saturday', 3),
('Saturday', 4),
('Saturday', 5),
('Saturday', 6),
('Thursday', 1),
('Thursday', 2),
('Thursday', 3),
('Thursday', 4),
('Thursday', 5),
('Thursday', 6),
('Thursday', 7),
('Thursday', 8),
('Thursday', 9),
('Thursday', 10),
('Thursday', 11),
('Thursday', 12),
('Thursday', 13),
('Tuesday', 1),
('Tuesday', 2),
('Tuesday', 3),
('Tuesday', 4),
('Tuesday', 5),
('Tuesday', 6),
('Tuesday', 7),
('Tuesday', 8),
('Tuesday', 9),
('Tuesday', 10),
('Tuesday', 11),
('Tuesday', 12),
('Tuesday', 13),
('Wednesday', 1),
('Wednesday', 2),
('Wednesday', 3),
('Wednesday', 4),
('Wednesday', 5),
('Wednesday', 6),
('Wednesday', 7),
('Wednesday', 8),
('Wednesday', 9),
('Wednesday', 10),
('Wednesday', 11),
('Wednesday', 12),
('Wednesday', 13);



CREATE TABLE user (
  ssn varchar(20) NOT NULL,
  role varchar(10) DEFAULT NULL,
  Password varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE userr (
  ssn varchar(20) NOT NULL,
  role varchar(10) DEFAULT NULL,
  Password varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO userr (ssn, role, Password) VALUES
('i1', 'instructor', NULL),
('i2', 'instructor', NULL),
('i3', 'instructor', NULL),
('i4', 'instructor', NULL),
('i5', 'instructor', NULL),
('i6', 'instructor', NULL),
('i7', 'instructor', NULL),
('i8', 'instructor', NULL),
('i9', 'instructor', NULL),
('s1', 'student', NULL),
('s2', 'student', NULL),
('s3', 'student', NULL),
('s30', 'student', NULL),
('s4', 'student', NULL),
('s40', 'student', NULL),
('s5', 'student', NULL),
('s6', 'student', NULL);



CREATE TABLE weeklyschedule (
  issn varchar(20) NOT NULL,
  courseCode varchar(10) NOT NULL,
  sectionId int(11) NOT NULL,
  yearr int(11) NOT NULL,
  semester varchar(11) NOT NULL,
  dayy varchar(12) NOT NULL,
  hourr int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO weeklyschedule (issn, courseCode, sectionId, yearr, semester, dayy, hourr) VALUES
('i1', 'comp2222', 1, 2022, 'spring', 'Monday', 5),
('i1', 'comp2222', 1, 2022, 'spring', 'Monday', 6),
('i1', 'comp2222', 1, 2022, 'spring', 'Monday', 7),
('i1', 'comp2222', 2, 2022, 'spring', 'Tuesday', 1),
('i1', 'comp2222', 2, 2022, 'spring', 'Tuesday', 2),
('i1', 'comp2222', 2, 2022, 'spring', 'Tuesday', 3),
('i6', 'comp1111', 1, 2022, 'spring', 'Wednesday', 1),
('i6', 'comp1111', 1, 2022, 'spring', 'Wednesday', 2),
('i6', 'comp1111', 1, 2022, 'spring', 'Wednesday', 3),
('i6', 'comp1111', 2, 2022, 'spring', 'Wednesday', 5),
('i6', 'comp1111', 2, 2022, 'spring', 'Wednesday', 6),
('i6', 'comp1111', 2, 2022, 'spring', 'Wednesday', 7),
('i8', 'INDE2156', 1, 2022, 'spring', 'Thursday', 1),
('i8', 'INDE2156', 1, 2022, 'spring', 'Thursday', 2),
('i8', 'INDE2156', 1, 2022, 'spring', 'Thursday', 3),
('i9', 'INDE2156', 2, 2022, 'spring', 'Thursday', 1),
('i9', 'INDE2156', 2, 2022, 'spring', 'Thursday', 2),
('i9', 'INDE2156', 2, 2022, 'spring', 'Thursday', 3),
('i9', 'math2103', 1, 2022, 'spring', 'Friday', 1),
('i9', 'math2103', 1, 2022, 'spring', 'Friday', 2),
('i9', 'math2103', 1, 2022, 'spring', 'Friday', 3),
('i9', 'math2103', 1, 2022, 'spring', 'Friday', 4);


ALTER TABLE attends
  ADD PRIMARY KEY (sssn,eName,issn,courseCode,yearr,semester,sectionId),
  ADD KEY eName (eName,issn,courseCode,yearr,semester,sectionId);

ALTER TABLE course
  ADD PRIMARY KEY (courseCode),
  ADD KEY fk_course_course1 (prereq_courseCode);

ALTER TABLE curricula
  ADD PRIMARY KEY (currCode,dName),
  ADD KEY dName (dName);

ALTER TABLE curriculacourses
  ADD PRIMARY KEY (currCode,dName,courseCode),
  ADD KEY courseCode (courseCode);

ALTER TABLE department
  ADD PRIMARY KEY (dName),
  ADD KEY headSsn (headSsn);

ALTER TABLE emails
  ADD PRIMARY KEY (email,sssn),
  ADD KEY sssn (sssn);

ALTER TABLE enrollment
  ADD PRIMARY KEY (sssn,issn,courseCode,yearr,semester,sectionId),
  ADD KEY issn (issn,courseCode,yearr,semester,sectionId);

ALTER TABLE exam
  ADD PRIMARY KEY (eName,issn,courseCode,yearr,semester,sectionId),
  ADD KEY issn (issn,courseCode,yearr,semester,sectionId);

ALTER TABLE gradstudent
  ADD PRIMARY KEY (ssn),
  ADD KEY supervisorSsn (supervisorSsn);

ALTER TABLE instructor
  ADD PRIMARY KEY (ssn),
  ADD KEY fk_instructor_department (dName);

ALTER TABLE prevdegree
  ADD PRIMARY KEY (college,degree,yearr,Gradssn),
  ADD KEY Gradssn (Gradssn);

ALTER TABLE project
  ADD PRIMARY KEY (leadSsn,pName),
  ADD KEY controllingDName (controllingDName);

ALTER TABLE project_has_gradstudent
  ADD PRIMARY KEY (leadSsn,pName,Gradssn),
  ADD KEY Gradssn (Gradssn);

ALTER TABLE project_has_instructor
  ADD PRIMARY KEY (leadSsn,pName,issn),
  ADD KEY issn (issn);

ALTER TABLE sectionn
  ADD PRIMARY KEY (issn,courseCode,yearr,semester,sectionId),
  ADD KEY courseCode (courseCode);

ALTER TABLE student
  ADD PRIMARY KEY (ssn),
  ADD UNIQUE KEY studentid (studentid),
  ADD KEY currCode (currCode),
  ADD KEY advisorSsn (advisorSsn);

ALTER TABLE timeslot
  ADD PRIMARY KEY (dayy,hourr);

ALTER TABLE user
  ADD PRIMARY KEY (ssn);

ALTER TABLE userr
  ADD PRIMARY KEY (ssn);

ALTER TABLE weeklyschedule
  ADD PRIMARY KEY (issn,courseCode,sectionId,yearr,semester,dayy,hourr),
  ADD KEY dayy (dayy,hourr),
  ADD KEY issn (issn,courseCode,yearr,semester,sectionId);

ALTER TABLE attends
  ADD CONSTRAINT attends_ibfk_1 FOREIGN KEY (eName,issn,courseCode,yearr,semester,sectionId) REFERENCES exam (eName, issn, courseCode, yearr, semester, sectionId),
  ADD CONSTRAINT attends_ibfk_2 FOREIGN KEY (sssn) REFERENCES enrollment (sssn);

ALTER TABLE course
  ADD CONSTRAINT fk_course_course1 FOREIGN KEY (prereq_courseCode) REFERENCES course (courseCode) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE curricula
  ADD CONSTRAINT curricula_ibfk_1 FOREIGN KEY (dName) REFERENCES department (dName) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE curriculacourses
  ADD CONSTRAINT curriculacourses_ibfk_1 FOREIGN KEY (courseCode) REFERENCES course (courseCode) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT curriculacourses_ibfk_2 FOREIGN KEY (currCode,dName) REFERENCES curricula (currCode, dName) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE department
  ADD CONSTRAINT department_ibfk_1 FOREIGN KEY (headSsn) REFERENCES instructor (ssn);

ALTER TABLE emails
  ADD CONSTRAINT emails_ibfk_1 FOREIGN KEY (sssn) REFERENCES student (ssn);


ALTER TABLE enrollment
  ADD CONSTRAINT enrollment_ibfk_1 FOREIGN KEY (issn,courseCode,yearr,semester,sectionId) REFERENCES sectionn (issn, courseCode, yearr, semester, sectionId),
  ADD CONSTRAINT enrollment_ibfk_2 FOREIGN KEY (sssn) REFERENCES student (ssn);


ALTER TABLE exam
  ADD CONSTRAINT exam_ibfk_1 FOREIGN KEY (issn,courseCode,yearr,semester,sectionId) REFERENCES sectionn (issn, courseCode, yearr, semester, sectionId);


ALTER TABLE gradstudent
  ADD CONSTRAINT gradstudent_ibfk_1 FOREIGN KEY (supervisorSsn) REFERENCES instructor (ssn),
  ADD CONSTRAINT gradstudent_ibfk_2 FOREIGN KEY (ssn) REFERENCES student (ssn);


ALTER TABLE instructor
  ADD CONSTRAINT fk_instructor_department FOREIGN KEY (dName) REFERENCES department (dName) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT instructor_ibfk_1 FOREIGN KEY (ssn) REFERENCES userr (ssn);


ALTER TABLE prevdegree
  ADD CONSTRAINT prevdegree_ibfk_1 FOREIGN KEY (Gradssn) REFERENCES gradstudent (ssn);

ALTER TABLE project
  ADD CONSTRAINT project_ibfk_1 FOREIGN KEY (controllingDName) REFERENCES department (dName) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT project_ibfk_2 FOREIGN KEY (leadSsn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE project_has_gradstudent
  ADD CONSTRAINT project_has_gradstudent_ibfk_1 FOREIGN KEY (Gradssn) REFERENCES gradstudent (ssn),
  ADD CONSTRAINT project_has_gradstudent_ibfk_2 FOREIGN KEY (leadSsn,pName) REFERENCES project (leadSsn, pName);


ALTER TABLE project_has_instructor
  ADD CONSTRAINT project_has_instructor_ibfk_1 FOREIGN KEY (leadSsn,pName) REFERENCES project (leadSsn, pName) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT project_has_instructor_ibfk_2 FOREIGN KEY (issn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE sectionn
  ADD CONSTRAINT sectionn_ibfk_1 FOREIGN KEY (courseCode) REFERENCES course (courseCode) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT sectionn_ibfk_2 FOREIGN KEY (issn) REFERENCES instructor (ssn) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE student
  ADD CONSTRAINT student_ibfk_1 FOREIGN KEY (currCode) REFERENCES curricula (currCode),
  ADD CONSTRAINT student_ibfk_2 FOREIGN KEY (advisorSsn) REFERENCES instructor (ssn),
  ADD CONSTRAINT student_ibfk_3 FOREIGN KEY (ssn) REFERENCES userr (ssn);

ALTER TABLE weeklyschedule
  ADD CONSTRAINT weeklyschedule_ibfk_1 FOREIGN KEY (dayy,hourr) REFERENCES timeslot (dayy, hourr) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT weeklyschedule_ibfk_2 FOREIGN KEY (issn,courseCode,yearr,semester,sectionId) REFERENCES sectionn (issn, courseCode, yearr, semester, sectionId) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
