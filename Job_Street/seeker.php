<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "dbdes.css">
<title>Online Job Hunt</title>
</head>
<body>
<div class ="topic">
<center>
Online Job Hunt<br>
Job Seekers
</center>
</div>
<ul>
<li><a href = "jobhunt.php">Home</a></li>
<li><a href = "seeker.php">Job Seeker</a></li>
<li><a href = "employer.php">Employer</a></li>
</ul>
<div class = "content">
Login<br><br>
<form action=""  method = "post">
<label for="username">Username:</label>
<input type = "text" name="id" id="username"><br>
<label for="username">Password:</label>
<input type = "password" name="password" id="password"><br>
<input type = "submit" name = "form_login" value = "Login"><br>New user ?<br>
<a href ="seeker_reg.php">Register</a>
</form>
</div>
<?php
    if ( isset( $_POST['form_login'] ) ) 
{ 
	$user = $_POST['id'];
	$pwd  = $_POST['password'];
	$cry_pwd = sha1($pwd);
//var_dump($user);
	$con =  new mysqli('localhost','root','','jobhunt');
	if(!$con)
	{
	echo "Can not connect to DB";
	}
	$query = "SELECT * FROM seeker  where sid  = '$user' and password = '$cry_pwd'";
	$result = mysqli_query($con,$query);
//	var_dump($result);
	$rowcount = $result->num_rows;
	//var_dump($rowcount);
	if($rowcount==1)
	{
		session_start();
		//header("seeklogin.php");
			//echo "successful login";
		$_SESSION['id'] = $user;
		$_SESSION['password'] = $pwd;
		header("location:index.php");
	}
	else
	{
	echo "error login";
	header("location:seeker.php");
	}
}
?>

</body>
</html>