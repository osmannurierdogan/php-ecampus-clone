<?php
include "./header.php";

$examName = $_POST["examName"];
$examDate = $_POST["examDate"];
$courseInformation = $_POST["courseList"];
//print_r($courseInformation);

$examValueOptions = explode("-", $courseInformation);
$issn = $examValueOptions[0];
$courseCode = $examValueOptions[1];
$yearr = $examValueOptions[2];
$semester = $examValueOptions[3];
$sectionId = $examValueOptions[4];
print_r($examValueOptions);

$addExamQuery = "INSERT INTO exam(eName, edate, issn, courseCode, yearr, semester, sectionId) VALUES ('$examName', '$examDate', '$issn', '$courseCode', '$yearr', '$semester', '$sectionId')";
$addExamQueryResult = mysqli_query($conn, $addExamQuery);

if ($addExamQueryResult) {
  echo "Exam Added.";
  header("location: ./instructor.php?issn=$issn");
} else {
  echo "Error in adding the exam.";
}
/* <?php

DROP TRIGGER attendExam;
CREATE TRIGGER attendExam 
	AFTER INSERT ON exam
FOR EACH ROW INSERT 
	INTO attends(sssn, eName, issn, courseCode, yearr, semester, sectionId, score)
		SELECT *
		FROM ((Student S JOIN enrollment E ON E.sssn = S.ssn) JOIN attends A ON E.sssn = A.sssn AND E.issn = A.issn AND E.courseCode = A.courseCode AND E.sectionId = A.sectionId AND E.semester = A.semester AND E.yearr = A.yearr);
        
DROP TRIGGER attendExam;
    $displayStudentsOfCoursesQuery = "SELECT S.studentname, E.sssn, E.courseCode, E.yearr, E.semester, E.sectionId FROM enrollment E, student S  WHERE E.issn = '$issn' AND E.sssn = S.ssn";
    $displayStudentsOfCoursesResult = mysqli_query($conn, $displayStudentsOfCoursesQuery);

    if (mysqli_num_rows($displayStudentsOfCoursesResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayStudentsOfCoursesResult)) {
        echo $tableRowStart;
        createTableElements($tupple["courseCode"], $tupple["sssn"], $tupple["studentname"], $tupple["yearr"], $tupple["semester"], $tupple["sectionId"]);
        echo $tableRowEnd;
      }
    }
    ?> 
    */

$createTrigger = "";
?>

<?php include "./footer.php" ?>