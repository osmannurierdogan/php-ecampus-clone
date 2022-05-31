<?php
$dbname = "project";
$host = "localhost";
$username = "root";
$password = "";
$conn = mysqli_connect($host, $username, $password, $dbname);
if ($conn->connect_errno) {
  echo "Failed to connect to MySQL: " . $conn->connect_error;
  exit();
} else {
  //echo "CONNECTED";
}



