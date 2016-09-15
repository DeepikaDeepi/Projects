<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
      href="./css/design.css"
      type="text/css"/>
<title>Batch Generation</title>
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
<div id="center">          
     <div id="form" >
     <form style="border:1px solid black;">    
      		<%@ page import="BatchesGeneration.*"%>      		
      		<%! int i; %>
			<%
			String n = request.getParameter("noOfTrainee");
			int not = Integer.parseInt(n);
			System.out.println(not);
			Batch b = new Batch(not);
			int nob = b.calcBatches();
			//worksheet w = new worksheet(121);
			//w.get();
			%><br>
			<% out.print("Number of batches are : "+nob); 				
			String batchID[] = new String[nob];
			batchID = b.generateBatchID();
						
			for(i=0;i<nob;i++)
			out.println("<br>"+batchID[i]);		
			%>
		</form>
			</div> 			 		      
</div>
</body>
</html>
