-- 1 
SELECT S.studentId, S.sName, E.email, S.gradorUgrad
FROM student S, curricula C, emails E, department D
WHERE C.dName = D.dName AND S.currCode = C.currCode  
			AND D.dName = "FineArts"
			AND S.sssn = E.sssn;
-- 2      
SELECT s.studentId, s.sName, s.advisorSsn 
FROM student S, instructor i, department d
WHERE s.advisorSsn = i.ssn AND i.dName = d.dName AND d.dName = 'Sport';
-- 3
SELECT *
FROM instructor i
WHERE i.dName = 'Sport';
-- 4 
SELECT s.courseCode , c.courseName, c.ects 
FROM sectionn s, course c
WHERE c.courseCode = s.courseCode 
AND s.issn = 9000015 
AND s.yearr = 2020 
AND s.semester = 'Spring';
-- 5 
SELECT DISTINCT * 
FROM instructor i 
WHERE i.ssn not IN (SELECT s.issn
			FROM sectionn s 
			WHERE s.yearr = 2020 AND s.semester = 'Spring');
-- 6
SELECT * 
FROM student S 
WHERE S.sssn IN (SELECT E.sssn  
			FROM enrolled E 
			WHERE E.yearr = 2016 AND E.semester = 'Fall' AND E.courseCode = 'FAR1001');
-- 7
SELECT * 
FROM student S 
WHERE S.sssn IN (SELECT E.sssn
			FROM enrolled E 
			WHERE E.courseCode IN (SELECT SE.courseCode
					FROM sectionn SE 
					WHERE SE.sectionID = 1 AND SE.yearr = 2016 
						AND SE.semester = 'Fall' 
						AND SE.issn IN (SELECT I.ssn
								FROM instructor I 
								WHERE I.iName = 'Alp Aslan' )));
-- 8
SELECT C.ects, C.courseCode, C.courseName
FROM course C 
WHERE C.courseCode IN (SELECT CC.courseCode
			FROM curriculacourses CC
			WHERE CC.currCode IN (SELECT S.currCode
			FROM student S 
			WHERE S.sName = 'Stephen Curry'));
-- 9
SELECT  E.courseCode, E.sectionID, E.dayy, E.hourr 
FROM enrolled E
WHERE E.sssn = 1000010 
AND E.semester = 'Fall' 
AND E.yearr = 2019 ;
-- 10
SELECT E.courseCode, E.yearr, E.semester, E.lettergrade
FROM enrolled E
WHERE E.sssn = 1000007;
-- 11
SELECT E.lettergrade
FROM enrolled E 
WHERE E.courseCode = 'FAR1001' AND E.yearr = 2016 AND E.semester = 'Fall';
-- 12
SELECT A.ename, A.score
FROM attends A
WHERE A.sssn = 1000008 AND A.courseCode = 'PSYC3111';
-- 14
SELECT * 
FROM project P 
WHERE P.contrDName = 'FineArts';
-- 15
SELECT IIP.issn AS InstructorID, GIP.gradsssn AS gradStudentID
FROM instrinprojects IIP, gradsinprojects GIP
WHERE IIP.prName = 'Exhibition' AND IIP.prName = GIP.prName;
-- 16
SELECT I.ssn , I.iName, SUM(I.extraSalary) + SUM(IIP.workingHours * 100) AS NewExtraSalary
FROM instructor I
INNER JOIN instrinprojects IIP on I.ssn = IIP.issn AND IIP.prName = 'Powerlifting' 
GROUP BY I.ssn;
-- 18
SELECT I.iName AS Iname, AVG(I.baseSalary) AS AverageSalary 
FROM instructor I 
GROUP BY i.dName;
