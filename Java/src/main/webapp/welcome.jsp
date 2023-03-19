
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<style type="text/css">
table, th, td {
  border:1px solid black;
  border-collapse: collapse;
  font-size: small;
  font-weight: bold;
  padding-left: 5px;
  padding-right: 5px;
}

th {
   text-align: left;
   background-color: #4848cc;
   color: white;
   vertical-align:bottom;
   height: 25px;
}

.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
  color: blue;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: #555;
  color: #fff;
  text-align: center;
  padding: 5px 0;
  border-radius: 6px;

  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  margin-left: -60px;

  opacity: 0;
  transition: opacity 0.3s;
}

.tooltip .tooltiptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  opacity: 1;
}
</style>
<body>
<%@page import="java.util.ArrayList"%>
<%@page import="com.servlet.Test.Student"%>
<%@page import="java.util.Iterator"%> 

<% ArrayList<Student> studentList = (ArrayList) request.getAttribute("stdList"); %> 
<% ArrayList<String> department = (ArrayList) request.getAttribute("department"); %> 
<% ArrayList<Integer> count = (ArrayList) request.getAttribute("count"); %> 
<% ArrayList<String> pass = (ArrayList) request.getAttribute("pass"); %> 

<div>
<table style="width:40%">
Welcome <%= request.getAttribute("userId") %>

<tr><th>Department</th><th>Student Id</th><th>Mark</th><th>Pass %</th></tr>
<%

if(request.getAttribute("stdList") != null)  
{
	boolean firstRow = true;
	
	for (int i = 0 ; i < department.size() ; i++) {
		firstRow = true;
		for (int j = 0 ; j < studentList.size() ; j++) {
			if (department.get(i).equals(studentList.get(j).getDepartment())) {
				if (firstRow) { 
				%>
					<tr><td rowspan="<%=count.get(i)%>" style="text-align: center; width: 35%" ><%=studentList.get(j).getDepartment()%></td>
		                <td style="width: 35%" ><div class="tooltip" ><%=studentList.get(j).getStudentID()%>
                                <span class="tooltiptext"><%=studentList.get(j).getStudentName()%></span>
                            </div></td>
		                <td style="text-align: right; width: 15%"><%=studentList.get(j).getMark()%></td>
		                <td rowspan="<%=count.get(i)%>" style="text-align: center; width: 15%"><%=pass.get(i)%></td>
	                </tr> 
					<%
					firstRow = false;
				} else { %>
					<tr><td  style="width: 35%" ><div class="tooltip"><%=studentList.get(j).getStudentID()%>
                                <span class="tooltiptext"><%=studentList.get(j).getStudentName()%></span>
                        </div></td>
		                <td style="text-align: right ; width: 15%"><%=studentList.get(j).getMark()%></td>
	                </tr>
				<% 
				}
			}
		}
	}
	
}
%>
</table>
</div>
</body>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>

</script>
</html>


