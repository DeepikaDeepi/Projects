<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
      href="./css/design.css"
      type="text/css"/>
<title>Modify</title>
</head>
<body>
<div id="header">
Hexaware Technologies
<img src="HexLogo.jpg" height="100"  width="175">
 </div>
 <%@ page import="java.sql.*" %>
 <%! String address,qualification,mailid,pwd; 
	int phone;	%>
<%
String username = (String)session.getAttribute("user");
String phone=request.getParameter("ph");
String address=request.getParameter("ad");
String qualification=request.getParameter("qu");
String password=request.getParameter("pwd");
String mailid=request.getParameter("mid");
Connection con;
String url = "jdbc:mysql://localhost/ftk?user=root";		
con = DriverManager.getConnection(url);
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
PreparedStatement stm=con.prepareStatement("update fresher set phone=?,address=?,qualification=?,password=?,mailid=? where fresherid=?");
stm.setString(1,phone);
stm.setString(2,address);
stm.setString(3,qualification);
stm.setString(4,password);
stm.setString(5,mailid);
stm.setString(6,username);
int r=stm.executeUpdate();
if (r==1)
{
	%><script type="text/javascript">
	alert("Updated Successfully!!!");</script><%	
	response.sendRedirect("ModifyProfile.jsp");
}
%>

</body>
</html>