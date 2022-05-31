<?php 
include "./header.php";

$examName = $_POST["examName"];
$examDate = $_POST["examDate"];
$courseInformation = $_POST["courseList"];
//print_r($courseInformation);

$examOptions = explode("-", $courseInformation);
$issn = $examOptions[0];
$courseCode = $examOptions[1];
$yearr = $examOptions[2];
$semester = $examOptions[3];
$sectionId = $examOptions[4];
print_r($examOptions);

$addExamQuery = "INSERT INTO exam(eName, edate, issn, courseCode, yearr, semester, sectionId) VALUES ('$examName', '$examDate', '$issn', '$courseCode', '$yearr', '$semester', '$sectionId')";
$addExamQueryResult = mysqli_query($conn, $addExamQuery);

if($addExamQueryResult){
  echo "Exam Added.";
  header("location: ./instructor.php?issn=$issn");
} else {
  echo "Error in adding the exam.";
}

?>