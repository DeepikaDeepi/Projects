<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
      href="./css/design.css"
      type="text/css"/>
<title>Schedule</title>
</head>
<div id="header">
Hexaware Technologies
<img src="HexLogo.jpg" height="100"  width="175">
 </div>
 <style>
table,th,td
{
border:1px solid black;
border-collapse:collapse;
}
th,td
{
padding:10px;
}
</style>
 <body bgcolor="#c2c2c2">

   <div id="tab-container">
      <ul>
         <li><a href="BatchGeneration.jsp"><b>Batch<br> Generation</a></li>
         <li><a href="TrainerAllocation.jsp">Trainer<br>Allocation</a></li>
         <li><a href="ModifySchedule.jsp">Modify<br>Schedule</a></li>
         <li><a href="GenerateSchedule.jsp">Generate<br>Schedule</a></li>
         <li><a href="SaveAndPublish.jsp">Save<br> and Publish<br> Schedule</a></li>
         <li><a href="UploadAssessment.jsp">Upload<br> Assessment</a></li>
         <li><a href="AdminLogin.jsp">Logout</a></li>
      </ul>
   </div>

   <%@ page import="java.sql.*"%>
   <%
	Connection con;
	try
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch(Exception e)
	{
		System.out.println("Failed to load mySQL driver...");
		return;
	}
	PreparedStatement stat ;
	ResultSet result;
	String url = "jdbc:mysql://localhost/ftk?user=root";	
	con = DriverManager.getConnection(url);
	stat = con.prepareStatement("select COUNT(*) from batch  where startdate is not NULL and enddate is not NULL");
	result = stat.executeQuery();
	result.next();
	int count = result.getInt(1);
	String batchid[] = new String[count]; 		
	stat = con.prepareStatement("select batchid from batch where startdate is not NULL and enddate is not NULL");
	result = stat.executeQuery();
	int i=0;
	while(result.next())
	{
		batchid[i++] = result.getString(1);
	}
   %>
 <div id="form" >
   <center>
   <p style="font-family:arial;color:black;font-size:30px;">Modify Schedule</p>
 <form action="ModifyProcess.jsp" method="post">
  <select name = "batchid" required namestyle="width:150px;float:center">
  <%for(i=0; i<count; i++) 
  { 
  %>
  <option  value="<%=batchid[i]%>"><%= batchid[i] %></option>
  <% } 
 %>


   <input type="date" BORDER=5 name="date" value="Date" required>
   <input type="submit" value="Generate">
   </form>
   <%
	if(request.getParameter("schedule")!=null)
	{
		i=0;
	%>
	    
	<center><script type="text/javascript">
	alert("Batch Modified successfully! ");
	</script></center>
	  </select>
   <p style="font-family:arial;color:black;font-size:30px;">Display Schedule</p>
   <p style="font-family:arial;color:black;font-size:20px;">Phase 1</p>
   <p style="font-family:arial;color:black;font-size:20px;">Foundation Training</p>

   <table style="width:500px">
 <tr style="background-color:grey;">
   <th>CourseID</th>
   <th>Course Name</th>		
   <th>Category</th>
   <th>Start Date</th>
   <th>End Date</th>
 </tr>
    <%
    Statement stmt;
    String coursename,category;
    //sdate,edate;
    int courseid,cid;
    String sdate[] = (String[])session.getAttribute("startdate");
    String edate[] = (String[])session.getAttribute("enddate");
    stmt = con.createStatement();
    result = stmt.executeQuery("select courseid,coursename,category from course where phase=1");

	while(result.next())
	{
		courseid = result.getInt(1);
		coursename = result.getString(2);
		category = result.getString(3);

    %>
 	<tr>
   <td><%= courseid %></td>
   <td><%= coursename %></td>		
   <td><%= category %></td>
    <td><%= sdate[i] %></td>
    <td><%= edate[i++] %></td>
  

 </tr>
  <%
  }
  %> 
 
 </table>
 <p style="font-family:arial;color:black;font-size:20px;">Phase 2</p>
   <p style="font-family:arial;color:black;font-size:20px;">Technology Training</p>
   <table style="width:500px">
 <tr style="background-color:grey;">
   <th>CourseID</th>
   <th>Course Name</th>		
   <th>Start Date</th>
   <th>End Date</th>
 </tr>
 <%
 	result = stat.executeQuery(); 
 	result = stmt.executeQuery("select courseid,coursename from course where phase=2");
 	while(result.next())
	{
		courseid = result.getInt(1);
		coursename = result.getString(2);		
 %>
 <tr>
   <td><%= courseid %></td>
   <td><%= coursename %></td>
	<td><%= sdate[i] %></td>
	<td><%= edate[i++] %></td>

 </tr>
  <%
  } 
  %>
 </table>

   
   </center>
   </div>

 <div id="wrap">
 <div id="main" class="container clear-top">
 </div>
 </div>

  <div id="wrap">
 <div id="main" class="c
 ontainer clear-top">
 </div>
 </div>
	<% 
	} 
%> <!-- end if loop -->
 
<footer class="footer" text-align="center" style="background-color:#003058;font-weight:bold;
	font-size:30px;
	text-align:center;">
<a href = 'about.html'>About us |</a>	<a href = "contact.jsp">Contact us</a><br>
<br><br><label>©Hexaware Techonologies.All rights reserved.</label>
</footer>
</body>
</html>