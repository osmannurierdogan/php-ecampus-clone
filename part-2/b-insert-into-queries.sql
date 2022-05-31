SET foreign_key_checks = 0;
INSERT INTO gradsinprojects (PrjleadSsn, prName, gradsssn, workingHours) 
VALUES 
(9000017, 'Sculpture', 1000001, 30),
(9000014, 'Exhibition', 1000002, 20),
(9000012, 'Powerlifting', 1000001, 30),
(9000012, 'Powerlifting', 1000003, 72);

INSERT INTO student (sssn, gradorUgrad, advisorSsn, currCode, sName, studentId) 
VALUES
(1000001,'GR', 9000017, 'FAR','Osman Nuri Erdogan', '16FAR2000'),
(1000002,'GR', 9000014, 'FAR','Nuriye Celik', '16FAR2008'),
(1000003,'GR', 9000012, 'SPO','Erdogan Basaran', '18SPO2010'),
(1000004,'GR', 9000012, 'SPO','Ozlem Koparan', '19SPO2051'),
(1000005,'GR', 9000015, 'CSE','Stephen Curry', '19CSE2032'),
(1000006,'UG', 9000015, 'COMP','Kobe Bryant', '20COMP2044'),
(1000007,'UG', 9000013, 'ASCI','Alpaslan Cakir', '17ASCI2018'),
(1000008,'UG', 9000011, 'PSYC','Ayhan Akman', '17PSYC2067'),
(1000009,'UG', 9000011, 'PSYC','Ceyhun Korkmaz', '19PSYC2096'),
(1000010,'UG', 9000015, 'COMP','Havva Adiguzel', '19COMP2105'),
(1000011,'UG', 9000011, 'COMP','Yakup Demir', '19COMP2105');

INSERT INTO emails (sssn, email)
VALUES
(1000001, 'OsmanNuriErdogan@isik.edu.tr'),
(1000002, 'NuriyeCelik@isik.edu.tr'),
(1000003, 'ErdoganBasaran@isik.edu.tr'),
(1000003, 'ErdoganBasaran@gmail.com'),
(1000004, 'OzlemKoparan@isik.edu.tr'),
(1000005, 'StephenCurry@isik.edu.tr'),
(1000005, 'StephenCurry@gmail.com'),
(1000005, 'StephenCurry@outlook.com'),
(1000006, 'KobeBryant@isik.edu.tr'),
(1000007, 'AlpaslanCakir@isik.edu.tr'),
(1000008, 'AyhanAkman@isik.edu.tr'),
(1000009, 'CeyhunKorkmaz@isik.edu.tr'),
(1000009, 'CeyhunKorkmaz@hotmail.com'),
(1000010, 'HavvaAdiguzel@isik.edu.tr'),
(1000011, 'YakupDemir@isik.edu.tr'),
(1000011, 'YakupDemir@hotmail.com');

INSERT INTO gradstudent (sssn, advisorSsn) 
VALUES
(1000001, 9000017),
(1000002, 9000014),
(1000003, 9000012),
(1000004, 9000012),
(1000005, 9000015);

INSERT INTO prevdegrees (collage, degree, yearr, gradsssn) 
VALUES
('Isik', 3.48, 2016, 1000001),
('KATU', 3.5, 2010, 1000001),
('ITU', 3.99, 2018, 1000002),
('Yale', 4.0, 2021, 1000006),
('Cambridge', 3.25, 2020, 1000003),
('Marmara', 2.86, 2011, 1000004),
('Bogazici', 2.56, 2012, 1000005);

INSERT INTO curricula (currCode, gradOrUGrad, dName) 
VALUES
('FAR', 'GR','FineArts'),
('FNAR', 'UG','FineArts'),
('SPO', 'GR','Sport'),
('SPRT', 'UG','Sport'),
('CSE', 'GR','ComputerScience'),
('COMP', 'UG','ComputerScience'),
('ARS', 'GR','ArtsScience'),
('ASCI', 'UG','ArtsScience'),
('PSY', 'GR','Psychology'),
('PSYC', 'UG','Psychology'),
('ECO', 'GR','Economics'),
('ECON', 'UG','Economics');

INSERT INTO curriculacourses (courseCode, dname, currCode) 
VALUES 
('FAR1001','FineArts','FAR'),
('FAR3111','FineArts','FAR'),
('FNAR1111','FineArts','FNAR'),
('CSE1001','ComputerScience','CSE'),
('CSE2011','ComputerScience','CSE'),
('COMP1112','ComputerScience','COMP'),
('SPO3105','Sport','SPO'),
('SPRT2211','Sport','SPRT'),
('SPRT3301','Sport','SPRT'),
('ARS4901','ArtsScience','ARS'),
('ASCI1001','ArtsScience','ASCI'),
('PSY1111','Psychology','PSY'),
('PSYC3111','Psychology','PSYC'),
('PSYC2222','Psychology','PSYC'),
('ECO1005','Economics','ECO'),
('ECO1007','Economics','ECO'),
('ECON2012','Economics','ECON'),
('BUSI1302','Economics','ECON'),
('ECON2222','Economics','ECON');


INSERT INTO project (leadSsn, prName, budget, startDate, endDate, subjectt, contrDName) 
VALUES
(9000017, 'Sculpture', 5000.0, '2018-05-02', '2022-04-11', 'MSS', 'FineArts'),
(9000014, 'Exhibition', 8000.0, '2021-11-08', '2022-04-23', 'PSD', 'FineArts'),
(9000016, 'Webinar', 3000.0, '2022-04-08', '2022-05-23', 'Crypto and Investment', 'Economics'),
(9000015, 'Hackathon', 10000.0, '2022-04-08', '2022-05-20', 'Hackathon for Mobile Development', 'ComputerScience'),
(9000012, 'Powerlifting', 4000.0, '2020-06-20', '2020-07-14', 'SBD', 'Sport');

INSERT INTO department (dName, budget, headSSn, buildingName) 
VALUES
('Psychology', 10000, 9000011, 'AMF'),
('Sport', 15000, 9000012, 'D/K'),
('ArtsScience', 8000, 9000013, 'LMF'),
('FineArts', 20000, 9000014, 'D/K'),
('ComputerScience', 16000, 9000015, 'DMF'),
('Economics', 5000, 9000016,'DMF');

INSERT INTO instructor (ssn, iName, rankk, baseSalary, extraSalary, dName) 
VALUES
(9000011, 'Ayhan Akman', 'Associate', 14000.0, 0.0, 'Psychology'),
(9000012, 'Özlem Karaduman', 'Adjunct', 15000.0, 0.0, 'Sport'),
(9000013, 'İlyas Akbaba', 'Adjunct', 10000.0, 0.0, 'ArtsScience'),
(9000014, 'Alp Aslan', 'Associate', 11000.0, 0.0, 'FineArts'),
(9000015, 'Reyhan Arsen', 'Associate', 6000.0, 0.0, 'ComputerScience'),
(9000016, 'Betül Caka', 'Assistant', 10000.0, 0.0, 'Economics'),
(9000017, 'Ayşegül Korkmaz', 'Research', 8000.0, 0.0, 'FineArts'),
(9000019, 'Furkan Kaya', 'Research', 20000.0, 0.0, 'Sport'),
(9000018, 'Ali Erol', 'Visiting', 10000.0, 0.0, 'Sport');


INSERT INTO instrinprojects (PrjleadSsn, prName, issn, workingHours) 
VALUES
(9000014, 'Exhibition', 9000017, 130),
(9000016, 'Webinar', 9000016, 20),
(9000015, 'Hackathon', 9000015, 72),
(9000012, 'Powerlifting', 9000018,250),
(9000014, 'Exhibition', 9000014, 125),
(9000017, 'Sculpture', 9000017, 160),
(9000012, 'Powerlifting', 9000012, 350);

INSERT INTO course (courseCode, ects, courseName, numHours, preReqCourseCode) 
VALUES
('FAR1001', 5, 'Introduction to Fine Arts', 3, null),
('FAR3111', 4, 'Advanced Principles of Fine Arts ',4, 'FAR1001'),
('FNAR1111', 3, 'Introduction to Fine Arts', 5, null),
('CSE1001', 3, 'Introduction to Programming', 5, null),
('CSE2011', 4, 'Object Oriented Programming', 3, 'CSE1001'),
('COMP1112', 3, 'OOP', 3, null),
('SPO3105', 4, 'Science of Exercise', 2, null),
('SPRT2211', 2, 'Progressive Overload', 3, null),
('SPRT3301', 4, 'Physiotherapy', 4, 'SPRT2211'),
('ARS4901', 5, 'Introduction to Science', 2, null),
('ASCI1001', 5, 'Introduction to Arts and Science', 4, null),
('PSY1111', 1, 'Introduction to Psychology', 5, null),
('PSYC2222', 1, 'Fundamentals of Psychological Research', 5, null),
('PSYC3111', 3, 'Advanced Techniques to Psychological Research', 4, 'PSYC2222'),
('ECO1005', 5,'Microeconomics', 5, null),
('ECO1007', 6,'Macroeconomics', 2, 'ECO1005'),
('ECON2012', 4, 'Taxation Policy in Turkey', 2, null),
('COMP2222', 7, 'Database Systems', 3, "COMP1112"),
('ECON2222', 5,'Principles of Management', 3, 'ECON2012'),
('BUSI1302', 3,'Business Management', 3, null);


INSERT INTO sectionn (semester, courseCode, yearr, sectionID, issn, quota) 
VALUES
('Fall', 'FAR1001', 2016, 1, 9000014, 50), 
('Fall', 'BUSI1302', 2019, 2, 9000016, 35), 
('Fall', 'FAR3111', 2018, 3, 9000014, 70), 
('Fall', 'FNAR1111', 2020, 4, 9000017, 90), 
('Fall', 'CSE1001', 2018, 5, 9000015, 50), 
('Spring', 'CSE2011', 2018, 6, 9000015, 50), 
('Spring', 'COMP1112', 2020, 7, 9000015, 50), 
('Spring', 'SPO3105', 2018, 8, 9000018, 70), 
('Spring', 'SPRT2211', 2019, 9, 9000012, 90), 
('Fall', 'SPRT3301', 2020, 10, 9000012, 85), 
('Fall', 'ARS4901', 2017, 11, 9000013, 120), 
('Spring', 'ASCI1001', 2019, 12, 9000013, 80), 
('Fall', 'PSY1111', 2018, 13, 9000011, 90), 
('Fall', 'PSYC3111', 2019, 14, 9000011, 85), 
('Spring', 'PSYC2222', 2019, 15, 9000011, 120), 
('Spring', 'ECO1005', 2016, 16, 9000016, 50), 
('Spring', 'ECO1007', 2017, 17, 9000016, 40), 
('Fall', 'ECON2012', 2019, 18, 9000016, 100), 
('Fall', 'ECON2222', 2020, 19, 9000016, 85);


INSERT INTO enrolled (sssn, lettergrade, semester, yearr, courseCode, sectionID, issn, hourr, dayy) 
VALUES
(1000001, 'AA', 'Fall', 2016, 'FAR1001', 1, 9000014, 4, 'MMFF'),
(1000002, 'BA', 'Fall', 2016, 'FAR1001', 1, 9000014, 4, 'MMFF'),
(1000003, 'BB', 'Spring', 2018, 'SPO3105', 8, 9000018, 2, 'ThTh'),
(1000004, 'CB', 'Spring', 2018, 'SPO3105', 8, 9000018, 2, 'ThTh'),
(1000005, 'CC', 'Spring', 2018, 'CSE2011', 6, 9000015, 3, 'TTT'),
(1000006, 'DC', 'Spring', 2020, 'COMP1112', 7, 9000015, 3, 'WWW'),
(1000007, 'DD', 'Spring', 2019, 'ASCI1001', 12, 9000013, 5, 'ThThWFF'),
(1000008, 'FF', 'Fall', 2019, 'PSYC3111', 14, 9000011, 5, 'TTTTT'),
(1000009, 'AA', 'Spring', 2019, 'PSYC2222', 15, 9000011, 2, 'FF'),
(1000010, 'BA', 'Fall', 2019, 'ECON2012', 18, 9000016, 3, 'MWF');

INSERT INTO timeslot (hourr, dayy) 
VALUES 
(4, 'MMFF'),
(2, 'ThTh'),
(3, 'TTT'),
(3, 'WWW'),
(5, 'ThThWFF'),
(5, 'TTTTT'),
(2, 'FF'),
(3, 'MWF');

INSERT INTO exam (datee, semester, courseCode, yearr, sectionID, ename, issn) 
VALUES 
('2018-06-05', 'Spring', 'SPO3105', 2018, 8, 'Final2020', 9000018),
('2019-03-22', 'Spring', 'PSYC3111', 2019, 14, 'Midterm2019', 9000011),
('2019-02-01', 'Fall', 'ECON2012', 2019, 18, 'Final2019', 9000016),
('2016-11-28', 'Fall', 'FAR1001', 2016, 1, 'Midterm2016', 9000014),
('2019-11-28', 'Fall', 'BUSI1302', 2019, 2, 'Midterm2019', 9000016),
('2017-12-12', 'Fall', 'FAR1001', 2017, 1, 'Midterm2017', 9000014);


INSERT INTO attends (semester, courseCode, yearr, sectionID, ename, issn, sssn, score) 
VALUES 
('Spring', 'SPO3105', 2018, 8, 'Final', 9000018, 1000004, 62),
('Spring', 'PSYC3111', 2019, 14, 'Midterm', 9000011, 1000008, 99),
('Fall', 'ECON2012', 2019, 18, 'Final', 9000016, 1000010, 75),
('Fall', 'FAR1001', 2016, 1, 'Midterm', 9000014, 1000001, 100),
('Fall', 'BUSI1302', 2019, 2, 'Midterm', 9000016, 1000001, 100),
('Fall', 'FAR1001', 2017, 1, 'Midterm', 9000014, 1000002, 86);

SET foreign_key_checks = 1;