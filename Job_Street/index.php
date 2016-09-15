<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "dbdes.css">
<title>Online Job Hunt</title>
</head>
<body>
<?php
session_start();
$user = $_SESSION['id'];
$pwd  = $_SESSION['password'];
//if($_SESSION['user']) {
if($user) {
?>
<p>Welcome <?php echo $_SESSION["id"]; ?>. <br></p>Click here to <a href="update_seeker.php" tite="update">Update<br>
<!--Click here to <a href="update_seeker.php" tite="update">update your details.<br> -->
<?php
}
?>
</body>
</html>