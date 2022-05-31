<?php
include "./header.php";
?>

<div class="login-box">
  <form action="./login.php" class="login-form" method="POST">
    <div class="form-group my-2">
      <input type="text" name="ssn" id="ssn" placeholder="Enter your ssn">
      <label for="ssn">SSN</label>
    </div>
    <div class="form-group my-2">
      <input type="text" name="password" id="password" placeholder="Enter your password">
      <label for="password">Password</label>
    </div>
    <button class="btn btn-success my-2" type="submit">Login</button>
  </form>
</div>
<?php
$ssn = "";
$password = "";
if(isset($_POST["ssn"], $_POST["password"])){
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
    header('location: ' . "./student.php");
    //echo "Student - ";
  }
}
?>