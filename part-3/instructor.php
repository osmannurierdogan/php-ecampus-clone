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


<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Teaching Courses</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
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
  </div>
</div>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Students of Each Course</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
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
  </div>
</div>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Leading Projects</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
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
  </div>
</div>



<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Working Projects</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
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
  </div>
</div>




<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Advising Students</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
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
  </div>
</div>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Supervising Students</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
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
  </div>

</div>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Exams of Courses</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
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
  </div>
</div>

<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Add Exam</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <div class="form">
      <form action="./addExam.php" class="add-exam-form" method="POST">
        <div class="add-exam-form__information-box">
          <div class="form-group">
            <label for="examName">Exam Name</label>
            <input autocomplete="off" type="text" name="examName" id="examName" placeholder="Enter your exam name">
          </div>
          <div class="form-group">
            <label for="examDate">Exam Date</label>
            <input autocomplete="off" type="date" name="examDate" id="examDate" value="2022-01-30">
          </div>
          <div class="form-group">
            <label for="courseList">Select Section</label>
            <select name="courseList" id="courseList">
              <?php
              $displayInstructorsCoursesQuery = "SELECT DISTINCT E.issn, E.courseCode, E.yearr, E.semester, E.sectionId FROM enrollment E WHERE E.issn = '$issn'";
              $displayInstructorCourses = mysqli_query($conn, $displayInstructorsCoursesQuery);

              if (mysqli_num_rows($displayInstructorCourses) > 0) {
                while ($tupple = mysqli_fetch_assoc($displayInstructorCourses)) {
                  $examValueText = $tupple["issn"] . "-" . $tupple["courseCode"] . "-" . $tupple["yearr"] . "-" . $tupple["semester"] . "-" . $tupple["sectionId"];

                  $examSelectOptionText = strtoupper($tupple["courseCode"]) . "." . $tupple["sectionId"] . " " . ucfirst($tupple["semester"]) . " " . $tupple["yearr"];
                  echo "<option value='$examValueText'>" . $examSelectOptionText . "</option>";
                }
              }
              // TODO => When we add an exam, it must be attended with all student who take the relevant section.
              ?>
            </select>
          </div>
          <button class="button button--add-exam" type="submit">Add Exam</button>
        </div>
        <div class="add-exam-form__image-box"></div>
      </form>
    </div>
  </div>
</div>


<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->



<div class="container">
  <div class="section-heading">
    <h3 class="heading--secondary">Weekly Schedule</h3>
    <i class="section-heading__icon fas fa-chevron-down"></i>
  </div>
  <div class="section-container">
    <table class="table">
      <thead>
        <td>Days \ Hours</td>
        <?php
        $hoursArray = [];
        $displayWeeklyScheduleHoursQuery = "SELECT DISTINCT hourr FROM timeslot";
        $displayWeeklyScheduleHoursResult = mysqli_query($conn, $displayWeeklyScheduleHoursQuery);

        if (mysqli_num_rows($displayWeeklyScheduleHoursResult) > 0) {
          while ($tupple = mysqli_fetch_assoc($displayWeeklyScheduleHoursResult)) {
            createTableElements($tupple["hourr"]);
            array_push($hoursArray, $tupple["hourr"]);
          }
        }
        ?>
      </thead>
      <tbody>
        <?php
        $sortedDays = [];
        $displayWeeklyScheduleDistinctDaysQuery = "SELECT DISTINCT dayy FROM timeslot ORDER BY CASE WHEN dayy = 'Monday' THEN 1 WHEN dayy = 'Tuesday' THEN 2 WHEN dayy = 'Wednesday' THEN 3 WHEN dayy = 'Thursday' THEN 4 WHEN dayy = 'Friday' THEN 5 WHEN dayy = 'Saturday' THEN 6 WHEN dayy = 'Sunday' THEN 7 END ASC";
        $displayWeeklyScheduleDistinctDaysResult = mysqli_query($conn, $displayWeeklyScheduleDistinctDaysQuery);
        if (mysqli_num_rows($displayWeeklyScheduleDistinctDaysResult) > 0) {
          while ($tupple = mysqli_fetch_assoc($displayWeeklyScheduleDistinctDaysResult)) {
            array_push($sortedDays, $tupple["dayy"]);
            //createTableElements($tupple["dayy"]);
          }
        }
        
        global $tableRowStart, $tableRowEnd;
        $courseArray = [];        
        $displayWeeklyScheduleOfInstructorQuery = "SELECT DISTINCT W.courseCode, W.sectionId, W.dayy, W.hourr FROM sectionn S JOIN weeklyschedule W on S.issn = W.issn WHERE W.issn = '$issn'";
        $displayWeeklyScheduleOfInstructorQueryResult = mysqli_query($conn, $displayWeeklyScheduleOfInstructorQuery);
        
        if (mysqli_num_rows($displayWeeklyScheduleOfInstructorQueryResult) > 0) {
          while ($tupple = mysqli_fetch_assoc($displayWeeklyScheduleOfInstructorQueryResult)) {
            $courseCode = $tupple["courseCode"];
            $sectionId = $tupple["sectionId"];
            $dayy = $tupple["dayy"];
            $hourr = $tupple["hourr"];
            
            //array_push($courseArray, $tupple["sectionId"], $tupple["courseCode"], $tupple["dayy"], $tupple["hourr"]);
            
            for($i = 0; $i < count($sortedDays); $i++){
              echo $tableRowStart;
              if($dayy == $sortedDays[$i]){
                echo createTableElements($sortedDays[$i]);
                for($j = 0; $j < count($hoursArray); $j++){
                  if($hourr == $hoursArray[$j]){
                    createTableElements($courseCode.".".$sectionId);
                  } else {
                    createTableElements("Free");
                  }
                }
                echo $tableRowEnd;
              }
            }
          }
          
        }
        
        print_r($courseArray);
        echo "<br><br><br>";


        ?>

      </tbody>
    </table>
  </div>
</div>

<?php include "./footer.php" ?>