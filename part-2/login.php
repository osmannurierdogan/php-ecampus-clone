<?php
include "./header.php";
?>

<div class="container">
  <div class="login-box form">
    <h3 class="login-box-heading">WELCOME TO UNIVERSITY DATABASE SYSTEM</h3>
    <form action="./login.php" class="login-form" method="POST">
      <div class="form-group">
        <label for="ssn">SSN</label>
        <input autocomplete="off" type="text" name="ssn" id="ssn" placeholder="Enter your ssn">
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input autocomplete="off" type="text" name="password" id="password" placeholder="Enter your password">
      </div>
      <button class="button button--login" type="submit">Login</button>
    </form>
  </div>
</div>
<?php
$ssn = "";
$password = "";
if (isset($_POST["ssn"], $_POST["password"])) {
  $ssn = $_POST["ssn"];
  $password = $_POST["password"];
}

//$findUserRole = "SELECT U.role FROM userr U WHERE U.ssn = '$ssn' AND U.Password = '$password'";
$findUserRole = "SELECT U.role FROM userr U WHERE U.ssn = '$ssn'";
$userRole = mysqli_query($conn, $findUserRole);
if ($row = mysqli_fetch_assoc($userRole)) {
  if ($row["role"] == "instructor") {
    //echo "Instructor - ";
    $issn = $ssn;
    header("location: ./instructor.php?issn=$issn");
  } else if ($row["role"] == "student") {
    header("location:./student.php");
    //echo "Student - ";
  }
}
?>

<?php include "./footer.php" ?>