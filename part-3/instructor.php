<?php
include "./header.php";
$ssn = "ssn";
$iname = "iname";
$rankk = "rankk";
$baseSal = "baseSal";
$dName = "dName";

$query = "select $ssn, $iname, $rankk, $baseSal, $dName from instructor";
$result = mysqli_query($conn, $query);
while ($row = mysqli_fetch_assoc($result)) {
  //echo "<a class='contact-link text-success' href='contact.php?lname=" . $row["lname"] . "&fname=" . $row["fname"] . "'>" . $row["fname"] . " " . $row["lname"] . "</a>";
  echo $row[$ssn] . " - " . $row[$iname] . " - " . $row[$rankk] . " - " . $row[$baseSal] . " - " . $row[$dName] . "<br>";
}
