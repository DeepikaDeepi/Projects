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
	String batchid2=" ";
	batchid2 = request.getParameter("batch");
	System.out.println("batch id is " + batchid2);
	stat =con.prepareStatement("select * from batch where publish=1");	
	//result = stat.executeQuery("select * from batch where batchid="+batchid2);
	//stat.setString(1, batchid2);
	result = stat.executeQuery();

			
   		if(result.next())
		{
			if (result.getString(1).equals(batchid2))
			{
				java.sql.Date date =  result.getDate(3);
				System.out.println("The date is : " + date.toString());				
       			udate = new java.util.Date(date.getTime());
  				System.out.println("dates are : " + date +"        "+ udate);
  			}
			else
			{
				System.out.print("no match");	
			}
		
		}
	
	
	
		
	/*else{
		System.out.print("No records");
	}*/
	
	%>



<%@ page import="java.util.Date,java.text.SimpleDateFormat,BatchesGeneration.*" %>
<%

	String batchid = request.getParameter("batch");

	
	Cal schedule = new Cal();
	System.out.println("batchid is : " + batchid + "    " + udate);
	if(udate!=null)
	{
	schedule.generateSchedule(batchid,udate);
	String[] sdate = schedule.getsdate(); 
	session.setAttribute("startdate", sdate);
	String[] edate = schedule.getedate();
	session.setAttribute("enddate", edate);
	}
	else
	{		
		session.setAttribute("sess",1);				
		response.sendRedirect("schedule.jsp");
	}
	
	
%>

		<jsp:forward page="schedule.jsp">
		<jsp:param value="" name="schedule"/>
		</jsp:forward>
</body>
</html>