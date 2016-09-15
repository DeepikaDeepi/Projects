<%@ page import="java.sql.*" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	System.out.println(username);
	session.setAttribute("user",username);
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
	 
	String url = "jdbc:mysql://localhost/ftk?user=root";		
	con = DriverManager.getConnection(url);
	PreparedStatement stat = con.prepareStatement("select *from fresher where fresherid=? and password=?");
	stat.setString(1, username);
	stat.setString(2,password);
	ResultSet res = stat.executeQuery();

	if (res.next())
	{
		System.out.println("Success");%>
		<jsp:forward page="fresher-home.jsp"/>
	<%}
	else
	{
		%>
		<jsp:forward page="fresherlogin.jsp">
		<jsp:param name = "FailReason" value="Wrong Password !"/>
		</jsp:forward>
		<%
	}

%>
	