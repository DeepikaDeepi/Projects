<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%!java.util.Date udate; %>
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
	String batchid2 = request.getParameter("batchid");
	System.out.println("Hello");
	System.out.println("batch id is " + batchid2);
	stat =con.prepareStatement("select * from batch ");	
	//result = stat.executeQuery("select * from batch where batchid="+batchid2);
	//stat.setString(1, batchid2);
	result = stat.executeQuery();
if(result.next())
	{
		if (result.getString(1).equals(batchid2))
		{
		java.sql.Date date =  result.getDate(3);
       udate = new java.util.Date(date.getTime());
  System.out.println("dates are : " + date +"        "+ udate);
  }
		else{
		System.out.print("no match");	
		}
		
	}
		
	
	%>



<%@ page import="java.util.Date,java.text.SimpleDateFormat,BatchesGeneration.*" %>
<%

	String batchid = request.getParameter("batchid");

	
	Cal schedule = new Cal();
	schedule.generateSchedule(batchid,udate);

%>
<%
stat = con.prepareStatement("update batch set publish=1 where batchid=?");
stat.setString(1, batchid);
stat.executeUpdate();
	String[] sdate = schedule.getsdate(); 
	session.setAttribute("startdate", sdate);
	String[] edate = schedule.getedate();
	session.setAttribute("enddate", edate);
%>
		<jsp:forward page="SaveAndPublish.jsp">
		<jsp:param value="" name="schedule"/>
		</jsp:forward>

</body>
</html>