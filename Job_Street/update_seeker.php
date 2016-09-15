<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "dbdes.css">
<title>Online Job Hunt</title>
</head>
<body>
<div class ="topic">
<center>
Online Job Hunt
</center>
</div>
<?php
session_start();
$user = $_SESSION['id'];
$password = $_SESSION['password'];
$cry_pwd = sha1($password);
//var_dump($user);
	$con =  new mysqli('localhost','root','','jobhunt');
	if(!$con)
	{
	echo "Can not connect to DB";
	}
	$query = "SELECT * FROM seeker where sid  = '$user' and password = '$cry_pwd'";
	$result = $con->query($query);
	//var_dump($result);
	$rowcount = $result->num_rows;

for ($i=0; $i<$rowcount; $i++) :
$disp = $result->fetch_assoc();
endfor;
?>
<form action = "" method = "post">
	<h3>Update</h3>
	First Name<input type = "text" name = "fname" value = "<?php echo $disp['fname'];?> " >	<br><br> 
	Last Name <input type = "text" name = "lname" value = "<?php echo $disp['lname'];?> ">	<br><br>
	Contact number<input type = "text" name = "contact" value = "<?php echo $disp['contact'];?> ">	<br><br>
	Email-id <input type = "text" name = "email" value = "<?php echo $disp['email'];?> ">	<br><br>
	Date of Birth <input type = "text" name = "dob" value = "<?php echo $disp['dob'];?> ">	<br><br>
	Gender <input type = "text" name = "gender" value = "<?php echo $disp['gender'];?> ">	<br><br>
	Address<input type = "text" name = "address" value = "<?php echo $disp['address'];?> ">	<br><br> 
	Religion <input type = "text" name = "religion" value = "<?php echo $disp['religion'];?> ">	<br><br>
	Experience<input type = "text" name = "experience" value = "<?php echo $disp['experience'];?> ">	<br><br> 
	Qualification <input type = "text" name = "qualification" value = "<?php echo $disp['qualification'];?> ">	<br><br>
	<input type = "submit" name = "form_update" id = "form_update"value = "Update details">
</form>	 
<?php 
if ( isset( $_POST['form_update'] ) ) {
		$con = mysqli_connect('localhost','root','','jobhunt');
	if(!$con)
	{
		echo "Can not connect to DB";
	}
	//$fname = $_POST["fname"];
	//echo $fname;
	//var_dump($user);
	if(isset($_POST['form_update']))
	{
		echo "hello";
		$query = "update seeker set fname = $_POST[fname] where sid = $_SESSION['id']";
	}
	//'$encr'
	if (!mysqli_query($con,$query))
	  {
	  die('Error: ' . mysqli_error($con));
	  }
	echo "Successfully updated";

	mysqli_close($con);
	}
?>

</body>
</html>