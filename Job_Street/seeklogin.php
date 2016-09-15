<?php
session_start();
$user = $_POST['id'];
$pwd  = $_POST['password'];
$cry_pwd = sha1($pwd);
var_dump($user);
	$con =  new mysqli('localhost','root','','jobhunt');
	if(!$con)
	{
	echo "Can not connect to DB";
	}
	$query = "SELECT * FROM seeker where sid  = '$user' and password = '$cry_pwd'";
	$result = $con->query($query);
	//var_dump($result);
	$rowcount = $result->num_rows;
	$_SESSION['user'] = $_POST['id'];
	$_SESSION['password'] = $_POST['password'];
	if(isset($_SESSION['user'])) 
	{
	header("Location:index.php");
	}
?>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "dbdes.css">
<title>Online Job Hunt</title>
<style>
input
{
font-size:20px;
}
</style>
</head>
<body>
<div class ="topic">
<center>
Online Job Hunt<br>
Welcome to your page !
</center>
</div>
<div class = "content">
<a href ="update_seeker.php">Update</a>
</div>
<!--

<?php	for ($i=0; $i<$rowcount; $i++) :
$disp = $result->fetch_assoc();
?>
<form>
Update details !
	First Name<input type = "text" name = "fname" value = "<?php echo $disp['fname'];?> " >	<br><br> 
	Last Name <input type = "text" name = "lname" value = "<?php echo $disp['lname'];?> ">	<br><br>
	Contact number<input type = "text" value = "<?php echo $disp['contact'];?> ">	<br><br>
	Email-id <input type = "text" value = "<?php echo $disp['lname'];?> ">	<br><br>
	Date of Birth <input type = "text" value = "<?php echo $disp['dob'];?> ">	<br><br>
	Gender <input type = "text" value = "<?php echo $disp['gender'];?> ">	<br><br>
		Address<input type = "text" value = "<?php echo $disp['address'];?> ">	<br><br> 
	Religion <input type = "text" value = "<?php echo $disp['religion'];?> ">	<br><br>
	Experience<input type = "text" value = "<?php echo $disp['experience'];?> ">	<br><br> 
	Qualification <input type = "text" value = "<?php echo $disp['qualification'];?> ">	<br><br>

</form>	

	<?php endfor; ?> -->
</body>	
</html>