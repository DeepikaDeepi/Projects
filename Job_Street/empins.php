<?php
$con = mysqli_connect('localhost','root','','jobhunt');
if(!$con)
{
echo "Can not connect to DB";
}
//var_dump($_POST['em']);

    $con = mysqli_connect('localhost','root','','jobhunt');

if(isset($_POST))
{
$query = "INSERT INTO employer(eid,fname,lname,company,contact,email,dob,address,country,password)
VALUES
('$_POST[id]','$_POST[fname]','$_POST[lname]','$_POST[company]','$_POST[contact]','$_POST[email]','$_POST[dob]','$_POST[address]','$_POST[country]',sha1($_POST[password]));
}
//'$encr'
if (!mysqli_query($con,$query))
  {
  die('Error: ' . mysqli_error($con));
  }
echo "1 record added";

mysqli_close($con);
?>
