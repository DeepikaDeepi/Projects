<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule</title>
</head>
<body>
<%@ page import="java.util.Date,java.text.SimpleDateFormat,BatchesGeneration.*" %>
<%
	String batchid = request.getParameter("batchid");
	String batchStartDate = request.getParameter("date"); 
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	Date batchBeginningDate = formatter.parse(batchStartDate);
	Cal schedule = new Cal();
	schedule.generateSchedule(batchid,batchBeginningDate);

%>
<%
	String[] sdate = schedule.getsdate(); 
	session.setAttribute("startdate", sdate);
	String[] edate = schedule.getedate();
	session.setAttribute("enddate", edate);
%>
		<jsp:forward page="ModifySchedule.jsp">
		<jsp:param value="" name="schedule"/>
		</jsp:forward>
</body>
</html>