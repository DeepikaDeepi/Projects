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
<title>Fresher</title>
</head>
<body>
<div id="header">
Hexaware Technologies
<img src="HexLogo.jpg" height="100"  width="175">
 </div>
<%@ page import="java.sql.*" %>
<%! String name; %>
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
	PreparedStatement stat = con.prepareStatement("select name from admin where adminid=?");
	stat.setString(1, username);
	
	ResultSet res=stat.executeQuery();
	if (res.next())
	{
		name = res.getString(1);
	}
%>
<div id="content">
   <div id="tab-container">
      <ul>
         <li><a href="BatchGeneration.jsp">Batch Generation</a></li>
         <li><a href="addtrainee.jsp">Add Trainees</a></li>
         <li><a href="addtrainer.jsp">Add Trainers</a></li>
         <li><a href="TrainerAllocation.jsp">Trainer Allocation</a></li>
         <li><a href="ModifySchedule.jsp">Modify Schedule</a></li>
         <li><a href="Save and Publish Scchedule.jsp">Save and Publish Schedule</a></li>
         <li><a href="UploadAssessment.jsp">Upload Assessment</a></li>
         <li><a href="adminlogout.jsp" onclick = "cl()"; >Logout</a></li>
      </ul>
   </div>
</div>
</body>
</html>