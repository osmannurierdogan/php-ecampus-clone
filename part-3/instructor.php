<?php
include "./header.php";

$issn = $_GET["issn"];
$tableRowStart = "<tr>";
$tableDataStart = "<td>";
$tableDataEnd = "</td>";
$tableRowEnd = "</tr>";
//$issn = var_dump($_GET);

/* function createTableElements($issn, $courseCode, $yearr, $semester, $sectionId){
  $tableDataStart = "<td>";
  $tableDataEnd = "</td>";
  echo $tableDataStart . $issn . $tableDataEnd;
  echo $tableDataStart . $courseCode . $tableDataEnd;
  echo $tableDataStart . $yearr . $tableDataEnd;
  echo $tableDataStart . $semester . $tableDataEnd;
  echo $tableDataStart . $sectionId . $tableDataEnd;
} */
function createTableElements(...$arguments)
{
  global $tableDataStart;
  global $tableDataEnd;
  foreach ($arguments as $argument) {
    echo $tableDataStart . $argument . $tableDataEnd;
  }
}

?>

<h3 class="heading--secondary">Teaching Courses</h3>
<table class="table">
  <thead>
    <td>Instructor SSN</td>
    <td>Course Code</td>
    <td>Year</td>
    <td>Semester</td>
    <td>Section ID</td>
  </thead>
  <tbody>
    <?php

    $displayInstructorsCoursesQuery = "SELECT DISTINCT E.issn, E.courseCode, E.yearr, E.semester, E.sectionId FROM enrollment E WHERE E.issn = '$issn'";
    $displayInstructorCourses = mysqli_query($conn, $displayInstructorsCoursesQuery);

    if (mysqli_num_rows($displayInstructorCourses) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayInstructorCourses)) {
        echo $tableRowStart;
        createTableElements($tupple["issn"], $tupple["courseCode"], $tupple["yearr"], $tupple["semester"], $tupple["sectionId"]);
        echo $tableRowEnd;
      }
    }

    ?>
  </tbody>
</table>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<h3 class="heading--secondary">Students of Each Course</h3>
<table class="table">
  <thead>
    <td>Course Code</td>
    <td>Student SSN</td>
    <td>Student Name</td>
    <td>Year</td>
    <td>Semester</td>
    <td>Section ID</td>
  </thead>
  <tbody>
    <?php

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
  </tbody>
</table>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<h3 class="heading--secondary">Leading Projects</h3>
<table class="table">
  <thead>
    <td>Project Name</td>
    <td>Subject</td>
    <td>Budget</td>
    <td>Start Date</td>
    <td>End Date</td>
    <td>Controlling Department Name</td>
  </thead>
  <tbody>
    <?php

    $displayLeadingProjectsQuery = "SELECT P.pName, P.subject, P.budget, P.startDate, P.enddate, P.controllingDName FROM project P WHERE P.leadSsn = '$issn'";
    $displayLeadingProjectsResult = mysqli_query($conn, $displayLeadingProjectsQuery);

    if (mysqli_num_rows($displayLeadingProjectsResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayLeadingProjectsResult)) {
        echo $tableRowStart;
        createTableElements($tupple["pName"], $tupple["subject"], $tupple["budget"], $tupple["startDate"], $tupple["enddate"], $tupple["controllingDName"]);
        echo $tableRowEnd;
      }
    }
    ?>
  </tbody>
</table>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<h3 class="heading--secondary">Working Projects</h3>
<table class="table">
  <thead>
    <td>Project Lead SSN</td>
    <td>Project Name</td>
    <td>Subject</td>
    <td>Budget</td>
    <td>Start Date</td>
    <td>End Date</td>
    <td>Controlling Department Name</td>
  </thead>
  <tbody>
    <?php

    $displayLeadingProjectsQuery = "SELECT PHI.leadSsn, P.pName, P.subject, P.budget, P.startDate, P.enddate, P.controllingDName FROM project P, project_has_instructor PHI WHERE PHI.issn = '$issn' AND P.leadSsn = PHI.leadSsn";
    $displayLeadingProjectsResult = mysqli_query($conn, $displayLeadingProjectsQuery);

    if (mysqli_num_rows($displayLeadingProjectsResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayLeadingProjectsResult)) {
        echo $tableRowStart;
        createTableElements($tupple["leadSsn"], $tupple["pName"], $tupple["subject"], $tupple["budget"], $tupple["startDate"], $tupple["enddate"], $tupple["controllingDName"]);
        echo $tableRowEnd;
      }
    }
    ?>
  </tbody>
</table>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<h3 class="heading--secondary">Advising Students</h3>
<table class="table">
  <thead>
    <td>Student SSN</td>
    <td>Student Name</td>
    <td>GR or UG</td>
    <td>Student ID</td>
  </thead>
  <tbody>
    <?php

    $displayAdvisingStudentsQuery = "SELECT S.studentname, S.ssn, S.gradorUgrad, S.studentid FROM student S, instructor I WHERE S.advisorSsn = I.ssn AND I.ssn = '$issn'";
    $displayAdvisingStudentsResult = mysqli_query($conn, $displayAdvisingStudentsQuery);

    if (mysqli_num_rows($displayAdvisingStudentsResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayAdvisingStudentsResult)) {
        echo $tableRowStart;
        /* if($tupple["gradorUgrad"] == 0){
          $tupple["gradorUgrad"] = "Graduate"
        } */
        createTableElements($tupple["ssn"], $tupple["studentname"], $tupple["gradorUgrad"], $tupple["studentid"]);
        echo $tableRowEnd;
      }
    }
    ?>
  </tbody>
</table>
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<h3 class="heading--secondary">Supervising Students</h3>
<table class="table">
  <thead>
    <td>Student SSN</td>
    <td>Student Name</td>
    <td>Student ID</td>
    <td>Instructor Name</td>
    <td>Instructor SSN</td>
  </thead>
  <tbody>
    <?php

    $displaySupervisingStudentsQuery = "SELECT S.studentname, GS.ssn as sssn, S.studentid, I.iname, I.ssn as issn FROM gradstudent GS, student S, instructor I WHERE GS.supervisorSsn = I.ssn AND I.ssn = '$issn' AND GS.ssn = S.ssn";
    $displaySupervisingStudentsResult = mysqli_query($conn, $displaySupervisingStudentsQuery);

    if (mysqli_num_rows($displaySupervisingStudentsResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displaySupervisingStudentsResult)) {
        echo $tableRowStart;
        /* if($tupple["gradorUgrad"] == 0){
          $tupple["gradorUgrad"] = "Graduate"
        } */
        createTableElements($tupple["sssn"], $tupple["studentname"], $tupple["studentid"], $tupple["iname"], $tupple["issn"]);
        echo $tableRowEnd;
      }
    }
    ?>
  </tbody>
</table>