<!DOCTYPE html>
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
<html>
<?php
$user = $_POST['id'];
$pwd  = $_POST['password'];
$cry_pwd = sha1($pwd);
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
?>

<?php	for ($i=0; $i<$rowcount; $i++) :
$disp = $result->fetch_assoc();
?>
<form >
	First Name<input type = "text" value = "<?php echo $disp['fname'];?> " readonly>	<br><br> 
	Last Name <input type = "text" value = "<?php echo $disp['lname'];?> "readonly>	<br><br>
	Company <input type = "text" value = "<?php echo $disp['company'];?> "readonly>	<br><br>
	Contact number<input type = "text" value = "<?php echo $disp['contact'];?> "readonly>	<br><br>
	Email-id <input type = "text" value = "<?php echo $disp['email'];?> "readonly>	<br><br>
	Date of Birth <input type = "text" value = "<?php echo $disp['dob'];?> "readonly>	<br><br>
	Address<input type = "text" value = "<?php echo $disp['address'];?> "readonly>	<br><br> 
</form>	

	<?php endfor; ?>
</body>	
</html>