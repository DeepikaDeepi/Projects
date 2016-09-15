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
<title>ADMIN</title>
</head>
<body>
<div id="header">
Fresher Toolkit
<img src="HexLogo.jpg" height="100"  width="175">
 </div>
<div id="left">
<nav id="menu">

        <ul class="parent-menu">
        <li><a href="BatchGeneration.jsp">Batch Generation</a></li>
        <li><a href="GenerateSchedule.jsp">Schedule Generation</a></li>
        <li><a href="addtrainer.jsp">Add Trainer</a></li>
        <li><a href="TrainerAllocation.jsp">Trainer Allocation</a></li>
        <li><a href="ModifySchedule.jsp">Modify Schedule</a></li>
      	<li><a href="Save and Publish Scchedule.jsp">Save and Publish Schedule</a></li>
        <li><a href="UploadAssessment.jsp">Upload Assessment</a></li>
        <li><a href="adminlogout.jsp" onclick = "cl()"; >Logout</a></li>
	


        </ul>

    </nav>
</div>
</body>
</html>