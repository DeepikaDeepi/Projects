<% if(session.getAttribute("user") != null)
{
%>

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
	String userid=" ";
	String username=" ";
	String batchid1=" ";
	stat = con.prepareStatement("select * from fresher where fresherid=?");
	userid=(String)session.getAttribute("user");	
	stat.setString(1,userid);
	result = stat.executeQuery();
	int i=0;	
	if (result.next())
	{batchid1 = result.getString(6);
	username = result.getString(2);
	
	}

	stat = con.prepareStatement("select * from batch where batchid=?");
	stat.setString(1, batchid1);
	result = stat.executeQuery();
	result.next();
	
	
	
	
   %>
 <div id="form" >
   <center>
   <p style="font-family:arial;color:black;font-size:30px;">View Schedule</p>
 <form action="process.jsp" method="post">
   
 

    
       
 <p style="text-align:right;float:right;margin-top:10px;">Welcome <%= username%> </p>
 
 
Your BatchID is: <input type="text" readonly BORDER=5 name="batch" value=<%= batchid1 %> >
   <input type="submit" value="View">
   </form>
   <%
   stat =con.prepareStatement("select * from batch where batchid=? and publish=1");	
	
   stat.setString(1, batchid1);
	result = stat.executeQuery();						
   
  		if(result.next())
   {
  			
	if(request.getParameter("schedule")!=null)
	{
		i=0;
	%>
	    
	<center><script type="text/javascript">
	alert("Batch View successfully! ");
	</script>
	</center>
	 
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
   }
  		
  		else
  		{
  		
  			%>
  			<script type="text/javascript">
  			alert("Batch Not Yet Scheduled!!! ");
  			</script>
  			
  	<%	}
 		  		
%> <!-- end if loop -->
 
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