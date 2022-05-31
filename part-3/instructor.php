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
        // TODO createTableElements($tupple["issn"], $tupple["courseCode"], $tupple["yearr"], $tupple["semester"], $tupple["sectionId"], "Add Exam");
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


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<h3 class="heading--secondary">Exams of Courses</h3>
<table class="table">
  <thead>
    <td>Exam Name</td>
    <td>Instructor SSN</td>
    <td>Instructor Name</td>
    <td>Course Code</td>
    <td>Exam Date</td>
    <td>Year</td>
    <td>Semester</td>
    <td>Section ID</td>
  </thead>
  <tbody>
    <?php

    $displayCourseExamsQuery = "SELECT E.eName, I.iname, E.issn, E.courseCode, E.edate, E.yearr, E.semester, E.sectionId FROM exam E, instructor I WHERE E.issn = I.ssn AND I.ssn = '$issn'";
    $displayCourseExamsResult = mysqli_query($conn, $displayCourseExamsQuery);

    if (mysqli_num_rows($displayCourseExamsResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayCourseExamsResult)) {
        echo $tableRowStart;
        /* if($tupple["gradorUgrad"] == 0){
          $tupple["gradorUgrad"] = "Graduate"
        } */
        createTableElements($tupple["eName"], $tupple["issn"], $tupple["iname"], $tupple["courseCode"], $tupple["edate"], $tupple["yearr"], $tupple["semester"], $tupple["sectionId"]);
        echo $tableRowEnd;
      }
    }
    ?>
  </tbody>
</table>

<form action="./addExam.php" class="add-exam-form" method="POST">
  <label for="examName">Exam Name</label>
  <input type="text" name="examName" id="examName" placeholder="Enter your examName">
  <label for="examDate">Exam Date</label>
  <input type="text" name="examDate" id="examDate" placeholder="Enter your examDate">
  <select name="courseList" id="courseList">
    <?php
    $displayInstructorsCoursesQuery = "SELECT DISTINCT E.issn, E.courseCode, E.yearr, E.semester, E.sectionId FROM enrollment E WHERE E.issn = '$issn'";
    $displayInstructorCourses = mysqli_query($conn, $displayInstructorsCoursesQuery);

    if (mysqli_num_rows($displayInstructorCourses) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayInstructorCourses)) {
        $examOption = $tupple["issn"] . "-" . $tupple["courseCode"] . "-" . $tupple["yearr"] . "-" . $tupple["semester"] . "-" . $tupple["sectionId"];
        echo "<option value='$examOption'>" . $examOption . "</option>";
      }
    }
    // TODO => When we add an exam, it must be attended with all student who take the relevant section.
    ?>
  </select>
  <button class="btn btn-success my-2" type="submit">Add Exam</button>
</form>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<h3 class="heading--secondary">Weekly Schedule</h3>
<table class="table">
  <thead>
    <td>Days \ Hours</td>
    <?php

    $displayWeeklyScheduleHoursQuery = "SELECT DISTINCT hourr FROM timeslot";
    $displayWeeklyScheduleHoursResult = mysqli_query($conn, $displayWeeklyScheduleHoursQuery);

    if (mysqli_num_rows($displayWeeklyScheduleHoursResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayWeeklyScheduleHoursResult)) {
        createTableElements($tupple["hourr"]);
      }
    }
    ?>
  </thead>
  <tbody>
    <?php
    $sortedDays = [];
    $displayWeeklyScheduleDistinctDaysQuery = "SELECT DISTINCT dayy as day FROM timeslot ORDER BY CASE WHEN dayy = 'Sunday' THEN 1 WHEN dayy = 'Monday' THEN 2 WHEN dayy = 'Tuesday' THEN 3 WHEN dayy = 'Wednesday' THEN 4 WHEN dayy = 'Thursday' THEN 5 WHEN dayy = 'Friday' THEN 6 WHEN dayy = 'Saturday' THEN 7 END ASC";
    $displayWeeklyScheduleDistinctDaysResult = mysqli_query($conn, $displayWeeklyScheduleDistinctDaysQuery);
    if (mysqli_num_rows($displayWeeklyScheduleDistinctDaysResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayWeeklyScheduleDistinctDaysResult)) {
        /* global $tableRowStart, $tableRowEnd;
        echo $tableRowStart . createTableElements($tupple["day"]); */
        array_push($sortedDays, $tupple["day"]);
      }
    }
    //print_r($sortedDays);

    $courseArray = [];
    //$displayWeeklyScheduleOfInstructorQuery = "SELECT DISTINCT W.issn, W.courseCode, W.sectionId, W.yearr, W.semester, W.dayy, W.hourr FROM sectionn S JOIN weeklyschedule W on S.issn = W.issn WHERE W.issn = '$issn'";
    $displayWeeklyScheduleOfInstructorQuery = "SELECT DISTINCT W.issn, W.courseCode, W.sectionId, W.yearr, W.semester, W.dayy, W.hourr FROM sectionn S JOIN weeklyschedule W on S.issn = W.issn WHERE W.issn = '$issn'";
    $displayWeeklyScheduleOfInstructorQueryResult = mysqli_query($conn, $displayWeeklyScheduleOfInstructorQuery);

    if (mysqli_num_rows($displayWeeklyScheduleOfInstructorQueryResult) > 0) {
      while ($tupple = mysqli_fetch_assoc($displayWeeklyScheduleOfInstructorQueryResult)) {
        array_push($courseArray, $tupple["issn"], $tupple["sectionId"], $tupple["courseCode"], $tupple["yearr"], $tupple["semester"], $tupple["dayy"], $tupple["hourr"]);
      }
    }
    //print_r($courseArray);

    global $tableRowStart, $tableRowEnd;
    for ($i = 0; $i < count($sortedDays); $i++) {
      echo $tableRowStart . createTableElements($sortedDays[$i]);
      /* if ($sortedDays[$i] == $courseArray[5]) {
        createTableElements("osman");
      } */
      for ($j = 0; $j < count($courseArray); $j++) {
        if($sortedDays[$i] == $courseArray[$j]){
          //echo "Osman";
          echo $sortedDays[$i].$courseArray[$j] = "Osman";
          //createTableElements($sortedDays[$i], $courseArray[$j]);
          echo $tableRowEnd;
        }
        echo $tableRowEnd;
      }
    }
    ?>
  </tbody>
</table>