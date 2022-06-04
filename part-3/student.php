<?php
include "./header.php";
?>

<?php
$ssn = $_GET["ssn"];
//$gradOrUgrad = "gradOrUgrad";
//$advisorSsn = "advisorSsn";
//$currCode = "currCode";
//$studentid = "studentid";
//$studentname = "studentname";
$tableRowStart = "<tr>";
$tableDataStart = "<td>";
$tableDataEnd = "</td>";
$tableRowEnd = "</tr>";
$isGraduate = "Ungraduated";
function createTableElements(...$arguments)
{
  global $tableDataStart;
  global $tableDataEnd;
  foreach ($arguments as $argument) {
    echo $tableDataStart . $argument . $tableDataEnd;
  }
}

/*$query = "select $ssn, $gradOrUgrad, $advisorSsn, $currCode, $studentid, $studentname from student";
$result = mysqli_query($conn, $query);
while ($row = mysqli_fetch_assoc($result)) {
  //echo "<a class='contact-link text-success' href='contact.php?lname=" . $row["lname"] . "&fname=" . $row["fname"] . "'>" . $row["fname"] . " " . $row["lname"] . "</a>";
  echo $row[$ssn] . " - " . $row[$gradOrUgrad] . " - " . $row[$advisorSsn] . " - " . $row[$currCode] . " - " . $row[$studentid] . " - " . $row[$studentname] . "<br>";
}*/
?>
<!-- 1.  -->
<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Standing </h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>
        <td>Student's ssn</td>
        <td>Student's ID</td>
        <td>Standing</td>
      </thead>
      <tbody>
        <?php
        $gradorUngradquery = "SELECT S.ssn, S.studentid, S.gradorUgrad FROM student S WHERE S.ssn = '$ssn'";
        $standing = mysqli_query($conn, $gradorUngradquery);

        if (mysqli_num_rows($standing) > 0) {
          while ($tupple = mysqli_fetch_assoc($standing)) {
            echo $tableRowStart;
            if ($tupple["gradorUgrad"] == 1) {
              $isGraduate = "Graduated";
            }
            createTableElements($tupple["ssn"], $tupple["studentid"], $isGraduate);
            echo $tableRowEnd;
          }
        }

        ?>
      </tbody>
    </table>
  </div>
</div>

<!-- 2 -->
<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Courses Taken by The Student</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>
        <td>Student's ssn</td>
        <td>Course Code</td>
        <td>Instrcutor Name</td>
        <td>Section ID</td>

      </thead>
      <tbody>
        <?php

        $StudentCoursesquery = "SELECT E.sssn, E.courseCode, I.iname , E.sectionId From enrollment E, instructor I WHERE E.sssn= '$ssn' AND I.ssn = E.issn and E.yearr = 2022 ";
        $StudentCourses = mysqli_query($conn, $StudentCoursesquery);

        if (mysqli_num_rows($StudentCourses) > 0) {
          while ($tupple = mysqli_fetch_assoc($StudentCourses)) {
            echo $tableRowStart;
            createTableElements($tupple["sssn"], $tupple["courseCode"], $tupple["iname"], $tupple["sectionId"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>

<!-- 3 -->
<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Transcript</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>

        <td>Course Code</td>
        <td>Course Title</td>
        <td>ECTS</td>
        <td>Letter Grade </td>
      </thead>
      <tbody>
        <?php

        $Transcriptquery = "SELECT C.courseCode, C.courseName, C.ects, E.lettergrade FROM course C, enrollment E WHERE E.sssn= '$ssn' AND C.courseCode = E.courseCode ";
        $Transcript = mysqli_query($conn, $Transcriptquery);

        if (mysqli_num_rows($Transcript) > 0) {
          while ($tupple = mysqli_fetch_assoc($Transcript)) {
            echo $tableRowStart;
            //echo $tableDataStart . $tupple["yearr"]. $tableDataEnd;
            createTableElements($tupple["courseCode"], $tupple["courseName"], $tupple["ects"], $tupple["lettergrade"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>
<!--4 -->
<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Exam Grade</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>

        <td>Course Code</td>
        <td>Course Title</td>
        <td>Exam Name</td>
        <td> Year </td>
        <td> Semester </td>
        <td> Score </td>
      </thead>
      <tbody>
        <?php

        $Examquery = "SELECT C.courseCode, C.courseName, A.eName, A.yearr, A.semester, A.score FROM  (attends A INNER JOIN course C on C.courseCode = A.courseCode) WHERE  A.sssn = '$ssn' ";
        $Exam = mysqli_query($conn, $Examquery);
        if (mysqli_num_rows($Exam) > 0) {
          while ($tupple = mysqli_fetch_assoc($Exam)) {
            echo $tableRowStart;

            createTableElements($tupple["courseCode"], $tupple["courseName"], $tupple["eName"], $tupple["yearr"], $tupple["semester"], $tupple["score"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>

<!-- 5 -->
<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Weekly Schedule</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>

        <td>Course Code</td>
        <td>Section ID</td>
        <td>Year</td>
        <td>Day</td>
        <td>hour</td>
      </thead>
      <tbody>
        <?php

        $WSquery = "SELECT DISTINCT W.courseCode, W.sectionId, W.yearr, W.dayy, W.hourr FROM (sectionn S INNER JOIN weeklyschedule W on S.issn = W.issn) INNER JOIN enrollment E on E.issn= W.issn WHERE W.issn = E.issn AND E.courseCode = W.courseCode AND E.sssn = '$ssn' AND E.sectionId = W.sectionID ";
        $WS = mysqli_query($conn, $WSquery);
        if (mysqli_num_rows($WS) > 0) {
          while ($tupple = mysqli_fetch_assoc($WS)) {
            echo $tableRowStart;

            createTableElements($tupple["courseCode"], $tupple["sectionId"], $tupple["yearr"], $tupple["dayy"], $tupple["hourr"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>


<!-- 6 -->

<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Student's Advisor</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>

        <td>Name</td>
        <td>Status</td>
        <td>Department</td>
      </thead>
      <tbody>
        <?php

        $Advisorquery = "SELECT  i.iname, i.rankk, i.dName FROM instructor i WHERE i.ssn in (SELECT s.advisorSsn FROM  student s WHERE  s.ssn = '$ssn') ";
        $Advisor = mysqli_query($conn, $Advisorquery);

        if (mysqli_num_rows($Advisor) > 0) {
          while ($tupple = mysqli_fetch_assoc($Advisor)) {
            echo $tableRowStart;

            createTableElements($tupple["iname"], $tupple["rankk"], $tupple["dName"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>

<!-- 7 -->
<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Curriculum</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>

        <td>Course Code</td>
        <td>Course Title</td>
        <td>ECTS</td>
      </thead>
      <tbody>
        <?php

        $Curriculumquery = "SELECT C.courseCode, C.courseName, C.ects FROM (student S INNER JOIN curriculacourses CC on S.currCode = CC.currcode) INNER JOIN course C on C.courseCode = CC.courseCode WHERE S.ssn = '$ssn' ";
        $Curriculum = mysqli_query($conn, $Curriculumquery);

        if (mysqli_num_rows($Curriculum) > 0) {
          while ($tupple = mysqli_fetch_assoc($Curriculum)) {
            echo $tableRowStart;

            createTableElements($tupple["courseCode"], $tupple["courseName"], $tupple["ects"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>

<!-- 8 -->

<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Department</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>

        <td>Department Name</td>
        <td>Building</td>
      </thead>
      <tbody>
        <?php

        $Departmentquery = "SELECT D.dName, D.buildingName FROM (student S INNER JOIN curricula C on S.currCode = C.currcode) INNER JOIN department D on D.dName = C.dName WHERE S.ssn = '$ssn'";
        $Department = mysqli_query($conn, $Departmentquery);

        if (mysqli_num_rows($Department) > 0) {
          while ($tupple = mysqli_fetch_assoc($Department)) {
            echo $tableRowStart;

            createTableElements($tupple["dName"], $tupple["buildingName"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>


<!-- 9 -->

<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">List of Projects</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>

        <td> Instructor Name</td>
        <td>Project Name</td>
        <td>Project Topic</td>
        <td>Working Hour</td>

      </thead>
      <tbody>
        <?php

        $Projectquery = "SELECT  I.iname, PHS.pname, P.subject, PHS.workingHour FROM (project_has_gradstudent PHS INNER JOIN project P on PHS.leadSsn = P.leadSsn) JOIN instructor I on I.ssn = PHS.leadSsn WHERE PHS.Gradssn = '$ssn'";
        $Project = mysqli_query($conn, $Projectquery);

        if (mysqli_num_rows($Project) > 0) {
          while ($tupple = mysqli_fetch_assoc($Project)) {
            echo $tableRowStart;

            createTableElements($tupple["iname"], $tupple["pname"], $tupple["subject"], $tupple["workingHour"]);
            echo $tableRowEnd;
          }
        }
        ?>
      </tbody>
    </table>
  </div>
</div>
<?php include "./footer.php" ?>