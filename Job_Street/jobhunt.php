<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href = "dbdes.css">
<title>Online Job Hunt</title>
</head>
<body>
<?php
$con = mysqli_connect('localhost','root','','jobhunt');
if(!$con)
{
echo "Failed to connect";
}
?>
<div class ="topic">
<center>
<img src="job.jpg" width="110" height="100" />
Online Job Hunt
</center>
</div>
<ul>
<li><a href = "jobhunt.php">Home</a></li>
<li><a href = "seeker.php">Job Seeker</a></li>
<li><a href = "employer.php">Employer</a></li>
</ul>

<div class = "content">
Welcome to Online Job Portal !<br>
Submit your resumes !<br>
And search for a wide range of jobs from employers <br>
</div>
<!--
<form action=" " method = "post">
input
</form>  -->
</body>
</html>
