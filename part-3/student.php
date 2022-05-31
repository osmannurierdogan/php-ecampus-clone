<?php
include "./header.php";
?>

<?php
$ssn = "ssn";
$gradOrUgrad = "gradOrUgrad";
$advisorSsn = "advisorSsn";
$currCode = "currCode";
$studentid = "studentid";
$studentname = "studentname";

$query = "select $ssn, $gradOrUgrad, $advisorSsn, $currCode, $studentid, $studentname from student";
$result = mysqli_query($conn, $query);
while ($row = mysqli_fetch_assoc($result)) {
  //echo "<a class='contact-link text-success' href='contact.php?lname=" . $row["lname"] . "&fname=" . $row["fname"] . "'>" . $row["fname"] . " " . $row["lname"] . "</a>";
  echo $row[$ssn] . " - " . $row[$gradOrUgrad] . " - " . $row[$advisorSsn] . " - " . $row[$currCode] . " - " . $row[$studentid] . " - " . $row[$studentname] . "<br>";
}
