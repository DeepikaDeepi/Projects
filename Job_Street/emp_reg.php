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
<ul>
<li><a href = "jobhunt.php">Home</a></li>
<li><a href = "seeker.php">Job Seeker</a></li>
<li><a href = "employer.php">Employer</a></li>
</ul>
<form action = "">
<div class="reg"><br>
<br>All fields (*) are mandatory
<br>
User Id *<input type = "text" name = "id"><br><br>
Password *<input type = "password" name = "pwd"><br><br>
Confirm Password *<input type = "password" name = "cpwd"><br><br>
First Name *<input type = "text" name = "fname"><br><br>
Last Name *<input type = "text" name = "lname"><br><br>
Company Name *<input type = "text" name = "company"><br><br>
Date of Birth *<input type = "date" name = "dob"><br><br>
Contact *<input type = "number" name = "contact"><br><br>
E-mail *<input type = "email" name = "email"><br><br>
<span><u>Sectors</u><br>
<input type="checkbox" name="sector" value="Aeronautics">Aeronautics<br>
<input type="checkbox" name="sector" value="Automobile">Automobile<br>
<input type="checkbox" name="sector" value="IT">Information & Technology<br>
<input type="checkbox" name="sector" value="Commerce">Commerce<br>
<input type="checkbox" name="sector" value="Engineering">Engineering<br>
<input type="checkbox" name="sector" value="Textile">Textile<br><br></span>
<span><u>Jobs Offered</u><br>
<input type="checkbox" name="job" value="Software Engineer">Software Engineer<br>
<input type="checkbox" name="job" value="Mechanic">Mechanic<br>
<input type="checkbox" name="job" value="System Analyst">System Analyst<br>
<input type="checkbox" name="job" value="Hardware Engineer">Hardware Engineer<br>
<input type="checkbox" name="job" value="Manager">Manager<br>
<input type="checkbox" name="job" value="Sales representative">Sales representative<br></span>
Address *<textarea cols="40" rows="5" name = "address">
Enter your address
</textarea><br><br>
Country *<input type = "text" name = "country"><br><br>
<!--Hint question *<input type = "text" name = "qhint"><br><br>
Hint answer *<input type = "text" name = "ahint"><br><br>  -->
<input type="reset" value="Clear" >
<input type = "submit" value = "Submit">

</div>
</form>
<div class="content">

<div>
</body>
</html>