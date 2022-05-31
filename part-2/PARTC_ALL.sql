-- 1 
select s.studentId, s.sName, e.email, s.gradorUgrad
from student s, curricula c, emails e, department d
where c.dName = d.dName and s.currCode = c.currCode  
      and d.dName = "FineArts"
      and s.sssn = e.sssn
;
-- 2      
select s.studentId, s.sName, s.advisorSsn 
from student s, instructor i, department d
where s.advisorSsn = i.ssn and i.dName = d.dName and d.dName = 'Sport'
;
-- 3
select *
from instructor i
where i.dName = 'Sport'
;
-- 4 
select s.courseCode , c.courseName, c.ects 
from sectionn s, course c
where c.courseCode = s.courseCode 
and s.issn = 1597324 
and s.yearr = 2020 
and s.semester = 'Spring'
;
-- 5 
select DISTINCT * 
from instructor i 
where i.ssn not IN (select s.issn
      from sectionn s 
      where s.yearr = 2020 and s.semester = 'Spring')
;
-- 6
select * 
from student s 
where s.sssn IN (select e.sssn  
			from enrolled e 
			where e.yearr = 2016 and e.semester = 'Fall' and e.courseCode = 'fiar1001' )
;
-- 7
select * 
from student s 
where s.sssn IN (select e.sssn
      from enrolled e 
      where e.courseCode IN (select s.courseCode
      		from sectionn s 
      		where s.sectionID=101 and s.yearr = 2016 
						and s.semester = 'Fall' 
						and s.issn IN (select i.ssn
      					from instructor i 
      					where i.iName = 'Alp' )));
-- 8
select c.ects, c.courseCode, c.courseName
from course c 
where c.courseCode IN (select cc.courseCode
      from curriculacourses cc
      where cc.currCode IN (select s.currCode
			from student s 
			where s.sName = 'Stephen'))
;
-- 9
select  e.courseCode, e.sectionID, e.dayy, e.hourr 
from enrolled e 
where e.sssn = 2022243 
and e.semester = 'Fall' 
and e.yearr = 2019 
;
-- 10
select e.courseCode, e.yearr, e.semester, e.lettergrade
from enrolled e
where e.sssn = 2022233
;
-- 11
select e.lettergrade
from enrolled e 
where e.courseCode = 'fiar1001' and e.yearr = 2016 and e.semester = 'Fall'
;
-- 12
select a.ename, a.score
from attends a
where a.sssn = 2022266 and a.courseCode = 'psy3111'
;
-- 14
select * 
from project p 
where p.contrDName = 'FineArts'
;
-- 15
select i.issn as InstructorID, g.gradsssn as gradStudentID
from instrinprojects i, gradsinprojects g
where i.prName = 'Exhibition' and i.prName = g.prName
;
-- 16
select i.ssn , i.iName, SUM(i.extraSalary) + SUM(ins.workingHours*100) as NewExtraSalary
from instructor i
INNER JOIN instrinprojects ins on i.ssn = ins.issn and ins.prName = 'Powerlifting' 
group by i.ssn
;
-- 18
select i.iName as Iname, AVG(i.baseSalary) as AverageSalary 
from instructor i 
group by i.dName;
