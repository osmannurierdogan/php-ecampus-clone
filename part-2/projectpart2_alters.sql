SET foreign_key_checks = 0;
ALTER TABLE department
ADD CONSTRAINT department_fk_1 FOREIGN KEY (headSSn) REFERENCES instructor (ssn);

ALTER TABLE instructor
ADD CONSTRAINT instructor_fk_1 FOREIGN KEY (dName) REFERENCES department (dName);

ALTER TABLE project
ADD CONSTRAINT project_fk_1 FOREIGN KEY (contrDName) REFERENCES department (dName),
ADD CONSTRAINT project_fk_2 FOREIGN KEY (leadSsn) REFERENCES instructor (ssn);

ALTER TABLE student
ADD CONSTRAINT student_fk_1 FOREIGN KEY (advisorSsn) REFERENCES instructor (ssn),
ADD CONSTRAINT student_fk_2 FOREIGN KEY (currCode) REFERENCES curricula (currCode);

ALTER TABLE emails
ADD CONSTRAINT emails_fk_1 FOREIGN KEY (sssn) REFERENCES student (sssn);

ALTER TABLE gradstudent
ADD CONSTRAINT gradstudent_fk_1 FOREIGN KEY (sssn) REFERENCES student (sssn),
ADD CONSTRAINT gradstudent_fk_2 FOREIGN KEY (advisorSsn) REFERENCES instructor (ssn);

ALTER TABLE prevdegrees
ADD CONSTRAINT prevdegrees_fk_1 FOREIGN KEY (gradsssn) REFERENCES gradstudent (sssn);

ALTER TABLE curricula
ADD CONSTRAINT curricula_fk_1 FOREIGN KEY (dName) REFERENCES department (dName);

ALTER TABLE curriculacourses
ADD CONSTRAINT curriculacourses_fk_1 FOREIGN KEY (courseCode) REFERENCES course (courseCode),
ADD CONSTRAINT curriculacourses_fk_2 FOREIGN KEY (dName) REFERENCES department (dName),
ADD CONSTRAINT curriculacourses_fk_3 FOREIGN KEY (currCode) REFERENCES curricula (currCode);

ALTER TABLE course
ADD CONSTRAINT course_fk_1 FOREIGN KEY (preReqCourseCode) REFERENCES course (courseCode);

ALTER TABLE sectionn
ADD CONSTRAINT sectionn_fk_1 FOREIGN KEY (courseCode) REFERENCES course (courseCode),
ADD CONSTRAINT sectionn_fk_2 FOREIGN KEY (issn) REFERENCES instructor (ssn);


ALTER TABLE gradsinprojects
ADD CONSTRAINT gradsinprojects_fk_1 FOREIGN KEY (PrjleadSsn) REFERENCES project (leadSsn),
ADD CONSTRAINT gradsinprojects_fk_2 FOREIGN KEY (prName) REFERENCES project (prName),
ADD CONSTRAINT gradsinprojects_fk_3 FOREIGN KEY (gradsssn) REFERENCES gradstudent (sssn);

ALTER TABLE instrinprojects
ADD CONSTRAINT instrinprojects_fk_1 FOREIGN KEY (PrjleadSsn) REFERENCES project (leadSsn),
ADD CONSTRAINT instrinprojects_fk_2 FOREIGN KEY (prName) REFERENCES project (prName),
ADD CONSTRAINT instrinprojects_fk_3 FOREIGN KEY (issn) REFERENCES instructor (ssn);

ALTER TABLE exam 
ADD CONSTRAINT exam_fk_1 FOREIGN KEY (semester) REFERENCES sectionn (semester),
ADD CONSTRAINT exam_fk_2 FOREIGN KEY (courseCode) REFERENCES sectionn (courseCode),
ADD CONSTRAINT exam_fk_3 FOREIGN KEY (yearr) REFERENCES sectionn (yearr),
ADD CONSTRAINT exam_fk_4 FOREIGN KEY (sectionID) REFERENCES sectionn (sectionID),
ADD CONSTRAINT exam_fk_5 FOREIGN KEY (issn) REFERENCES sectionn (issn);

ALTER TABLE enrolled
ADD CONSTRAINT enrolled_fk_1 FOREIGN KEY (sssn) REFERENCES student (sssn),
ADD CONSTRAINT enrolled_fk_2 FOREIGN KEY (semester) REFERENCES sectionn (semester),
ADD CONSTRAINT enrolled_fk_3 FOREIGN KEY (courseCode) REFERENCES sectionn (courseCode),
ADD CONSTRAINT enrolled_fk_4 FOREIGN KEY (yearr) REFERENCES sectionn (yearr),
ADD CONSTRAINT enrolled_fk_5 FOREIGN KEY (sectionID) REFERENCES sectionn (sectionID),
ADD CONSTRAINT enrolled_fk_6 FOREIGN KEY (hourr) REFERENCES timeslot (hourr),
ADD CONSTRAINT enrolled_fk_7 FOREIGN KEY (dayy) REFERENCES timeslot (dayy),
ADD CONSTRAINT enrolled_fk_8 FOREIGN KEY (issn) REFERENCES instructor (ssn);

ALTER TABLE attends
ADD CONSTRAINT attends_fk_1 FOREIGN KEY (sssn) REFERENCES enrolled (sssn),
ADD CONSTRAINT attends_fk_2 FOREIGN KEY (semester) REFERENCES exam (semester),
ADD CONSTRAINT attends_fk_3 FOREIGN KEY (courseCode) REFERENCES exam (courseCode),
ADD CONSTRAINT attends_fk_4 FOREIGN KEY (yearr) REFERENCES exam (yearr),
ADD CONSTRAINT attends_fk_5 FOREIGN KEY (sectionID) REFERENCES exam (sectionID),
ADD CONSTRAINT attends_fk_6 FOREIGN KEY (issn) REFERENCES exam (issn),
ADD CONSTRAINT attends_fk_7 FOREIGN KEY (ename) REFERENCES exam (ename);

SET foreign_key_checks = 1 
