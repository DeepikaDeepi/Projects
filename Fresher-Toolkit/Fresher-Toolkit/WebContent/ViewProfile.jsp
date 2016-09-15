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
<title>View</title>
</head>
<div id="header">
Hexaware Technologies
<img src="HexLogo.jpg" height="100"  width="175">
 </div>
 <div id="left">
<nav id="menu">

        <ul class="parent-menu">

            <li><a href="#">Profile</a>

                <ul>

                    <li><a href="ViewProfile.jsp">View Profile</a></li>

                    <li><a href="ModifyProfile.jsp">Mofify Profile</a></li>

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
<div id="center">
   <%@ page import="java.sql.*" %>
<%! String name,address,qualification,mailid,place,doj; 
	int phone,batchid;	%>
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
		name=res.getString(2);
		phone = res.getInt(4);
		address = res.getString(5);
		batchid=res.getInt(6);
		qualification = res.getString(7);
		mailid = res.getString(9);
		doj= res.getString(10);
		place=res.getString(11);
				
	}
%>

      <form name="myform" id="can" action="update.jsp" method="post">
      <center>
      
      	<label>Name</label><input type="text" name = "nam" value="<%= name %>" readonly><br><br>
      	<label>Phone</label><input type="text" name = "ph" value="<%= phone %>" readonly><br><br>
      	<label>Address</label><input type="text" name = "ad" value="<%= address %>" readonly><br><br>
      	<label>Batchid</label><input type="text" name = "bid" value="<%= batchid %>" readonly><br><br>
      	<label>Qualification</label><input type="text" name = "qu" value="<%= qualification %>" readonly><br><br>
      	<label>MailID</label><input type="text" name = "mid" value="<%= mailid %>" readonly><br><br>
      	<label>DOJ</label><input type="text" name = "dj" value="<%= doj %>" readonly><br><br>
      	<label>Place</label><input type="text" name = "pla" value="<%= place %>" readonly><br><br>
      	</center>
      </form>


</div>
</body>
</html>
<%
}
	else
	{
		response.sendRedirect("fresherlogin.jsp");
	}
%>