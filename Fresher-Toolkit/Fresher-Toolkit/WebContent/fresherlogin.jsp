<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hexaware Technologies</title> 
<link rel="stylesheet" href="./css/design.css" type = "text/css">
</head>
<body>
<div id="header">
Hexaware Technologies
<img src="HexLogo.jpg" height="100"  width="175">
 </div>
<div id="left">
<img src="trainee.png">
</div>
<div id="center" >
<div id = "login">
<center>
<form  action="login.jsp" method="post">
<label>Trainee Login</label>
<input type="text" name = "username" placeholder = "Username" required><br>
<input type="password" name = "password" placeholder = "Password" required><br>
<% if(request.getParameter("FailReason")!=null )
{
%>
	<font color="red"><%out.println(request.getParameter("FailReason") );%></font>
<%
}
%>
<input  type="submit" value = "Login">

</form>
</center>
</div>
</div>

<div id="right">
<p>Welcome trainees ! Login to your profile to view training schedules and trainer details.
Keep yourself updated with the latest updates in the training program.</p>
</div>


</body>
</html>