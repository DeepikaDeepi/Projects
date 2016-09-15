<%if(session.getAttribute("user") != null)
{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

function disableBackButton()
 {
  //location.href("logout.html");

 }
if(window.history.forward(1) != null)
         window.history.forward(1);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
      href="./css/design.css"
      type="text/css"/>
<title>Performance</title>
</head>
<body>
<div id="header">
Hexaware Technologies
<img src="HexLogo.jpg" height="100"  width="175">
 </div>
<div id="left">
<nav id="menu">

        <ul class="parent-menu">

            <li><a>Profile</a>

                <ul>

                    <li><a href="ViewProfile.jsp">View Profile</a></li>

                    <li><a href="ModifyProfile.jsp">Modify Profile</a></li>

                </ul>

            </li>

            <li><a href="schedule.jsp">Schedule</a>
			</li>

            <li><a href="performance.jsp">Performance</a>

   </li>

            <li><a href="logout.jsp">Logout</a>

            </li>

        </ul>

    </nav>
</div>
<div id="wrap">
<div id="main" class="container clear-top">

</div>
</div>
<footer class="footer" text-align="center" style="background-color:#003058;font-weight:bold;
	font-size:30px;
	text-align:center;">
<a href = 'about.html'>About us |</a>	<a href = "contact.jsp">Contact us</a><br>
<br><br><label>©Hexaware Techonologies.All rights reserved.</label>
</footer>
</body>
</html>
<%
}
	else
	{
		response.sendRedirect("fresherlogin.jsp");
	}
%>