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
<title>Fresher</title>
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="themes/1/js-image-slider.js" type="text/javascript"></script>
    <link href="css/design.css" rel="stylesheet" type="text/css" />

</head>
<body bgcolor="#c2c2c2">
<div id="header">

Freshers-Toolkit
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
	PreparedStatement stat = con.prepareStatement("select name from fresher where fresherid=?");
	stat.setString(1, username);	
	ResultSet res=stat.executeQuery();
	if (res.next())
	{
		name = res.getString(1);
	}
%>
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
<div id="center">
 <p style="text-align:right">Welcome <%= name%> </p>           
                <left><img width="500" src="image-slider-1.jpg" alt="" /></left>       
</div>
    <div id="right">
       <div id="side_column">
    
    
        <div class="section_w350">
            <div class="news_box">                            <h3 style="text-align:center">Latest News</h3>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
             <h4 style="text-align:left"><a href"#">Company News</a></h4>
              <p style="text-align:left">dgadfhzdfhfjzgjzggnvcn<br>
      	        gngcngzdhfdhdfhdfhdfjdjgd</p>
                
                <div class="cleaner_h10"></div>
                
                <h4 style="text-align:left"><a href="#">Fresher News</a></h4>
              <p style="text-align:left	">rhfhfhfhfgnrwkgrwkrjrwtp<br>
              orjtporjtprjtnvifgifgngf</p>
                
               </div>
        </div>
    
    </div>
</div>

   
   <div id="wrap">
<div id="main" class="container clear-top">

</div>
</div>
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