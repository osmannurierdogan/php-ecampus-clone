<?php
include "../header.php";

//$issn = $_GET["issn"];
$issn = "i1";

$query = "SELECT DISTINCT E.issn, E.courseCode, E.yearr, E.semester, E.sectionId FROM enrollment E WHERE E.issn = '$issn'";
$result = mysqli_query($conn, $query);
?>
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
    $tableRowStart = "<tr>";
    $tableDataStart = "<td>";
    $tableDataEnd = "</td>";
    $tableRowEnd = "</tr>";
    if (mysqli_num_rows($result) > 0) {
      while ($tupple = mysqli_fetch_assoc($result)) {
        echo $tableRowStart;
        createTableElements($tupple["issn"], $tupple["courseCode"], $tupple["yearr"], $tupple["semester"], $tupple["sectionId"]);
        echo $tableRowEnd;
      }
    }
    function createTableElements($issn, $courseCode, $yearr, $semester, $sectionId)
    {
      $tableDataStart = "<td>";
      $tableDataEnd = "</td>";
      echo $tableDataStart . $issn . $tableDataEnd;
      echo $tableDataStart . $courseCode . $tableDataEnd;
      echo $tableDataStart . $yearr . $tableDataEnd;
      echo $tableDataStart . $semester . $tableDataEnd;
      echo $tableDataStart . $sectionId . $tableDataEnd;
    }
    ?>
  </tbody>
</table>

<?php include "./footer.php" ?>