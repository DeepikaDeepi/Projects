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
<title>Modify</title>

<script type="text/javascript">
function clearform()
{
	document.getElementById("can").reset();
	}
</script>
</head>
<body>

<body bgcolor="#c2c2c2">
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

   <%@ page import="java.sql.*" %>
<%! String address,qualification,mailid,pwd,phone;	%>
<%
	String username = (String)session.getAttribute("user");
	Connection con;
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("Sucess loading");
	}
	catch(Exception e)
	{
		System.out.println("Failed to load mySQL driver...");
		return;
	}
	 
	String url = "jdbc:mysql://localhost/ftk?user=root";		
	con = DriverManager.getConnection(url);
	PreparedStatement stat = con.prepareStatement("select * from fresher where fresherid=?");
	stat.setString(1, username);
	
	ResultSet res=stat.executeQuery();
	if (res.next())
	{
		phone = res.getString(4);
		address = res.getString(5);
		qualification = res.getString(7);
		pwd = res.getString(8);
		mailid = res.getString(9);		
	}
%>
   <div id="center">
      <center><form name="myform" id="can" action="update.jsp" method="post">      
      		<label>Phone</label><input type="text" name = "ph" value="<%= phone %>" ><br><br>
      		<label>Address</label><input type="textarea" name = "ad" value="<%= address %>" ><br><br>
      		<label>Qualification</label><input type="text" name = "qu" value="<%= qualification %>" ><br><br>
      		<label>Password</label><input type="password" name = "pwd" value="<%= pwd %>" ><br><br>
      		<label>MailID</label><input type="text" name = "mid" value="<%= mailid %>" ><br><br>
      		<input type="submit" value="SAVE"><input type="button" onclick="clearform()" value ="CANCEL">      
      </form></center>
   </div>

 <div id="wrap">
<div id="main" class="container clear-top">
</div>
</div>
<footer class="footer" text-align="center" style="width:100%;background-color:#003058;font-weight:bold;
	font-size:30px;
	text-align:center;">
<a href = 'about.html'>About us |</a>	<a href = "contact.jsp">Contact us</a><br>
<br><br><label>©Hexaware Techonologies. All rights reserved.</label>
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