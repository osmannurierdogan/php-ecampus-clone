<?php
include "./header.php";
?>

<div class="login-box">
  <form action="./home.php" class="login-form" method="POST">
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

<!-- <?php 
$ssn = $_POST["ssn"];
$password = $_POST["password"];

$query = "SELECT role FROM userr WHERE $ssn = ssn";
$result = mysqli_query($conn, $query);
$role = $result;
if($role == "instructor"){
  echo "Instructor";
} else {
  echo "Student";
}
?> -->