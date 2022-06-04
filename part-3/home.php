<?php
include "./header.php";
?>
<div class="container center-text">
  <?php
  $ssn = $_POST["ssn"] ?? "-";
  $password = $_POST["password"] ?? "-";

  //$findUserRole = "SELECT U.role FROM userr U WHERE U.ssn = '$ssn' AND U.Password = '$password'";
  $findUserRole = "SELECT U.role FROM userr U WHERE U.ssn = '$ssn'";
  $userRole = mysqli_query($conn, $findUserRole);
  if ($row = mysqli_fetch_assoc($userRole)) {
    if ($row["role"] == "instructor") {
      //echo "Instructor - ";
      $issn = $ssn;

      header('location: ' . "./instructor.php?ssn=$issn");
    } else if ($row["role"] == "student") {
      header('location: ' . "./student.php");
      //echo "Student - ";
    }
  }

  $loginQuery = "SELECT ssn, password FROM userr WHERE ssn = '$ssn' AND password = '$password'";
  $loginResult = mysqli_query($conn, $loginQuery);

  if (mysqli_num_rows($loginResult) > 0) {
    while ($tupple = mysqli_fetch_assoc($loginResult)) {
      $loginSsn = $tupple["ssn"];
      $loginPassword = $tupple["password"];
      echo $loginSsn . " - " . $loginPassword;
      //echo $loginSsn;
    }
  } else {
    echo "Error.";
  }
  ?>
</div>
<?php
include "./footer.php";
?>