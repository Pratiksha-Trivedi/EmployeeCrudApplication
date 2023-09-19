<%@page import="entity.Employee"%>
<%@page import="service.EmployeeService"%>	
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);
  Employee employee1=(Employee)session.getAttribute("employee");
  if(employee1==null){
	response.sendRedirect("Login.jsp");}%>
<%
int id = Integer.parseInt((String) request.getParameter("id"));
EmployeeService employeeService = new EmployeeService();
Employee employee=employeeService.getEmpById(id);
 if(employee!=null){%>
<body>

	<form action="Detilas"method=post>
	<table class="table">
		<thead>
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>User Name</th>
				<th>Password</th>
			</tr>
		</thead>
		<tbody> <form action ="Detilas" method = "post" name="formAction">
    <div class="input-group">
   
			<tr class="info">
				<td>   <input id="id" type="number" name="id" class="form-control" readonly="readonly" value=<%=employee.getId()%>></td>
				<td><input  type="text" class="form-control" name="firstname" value=<%=employee.getFirstName()%>></td>
				<td><input  type="text" class="form-control" name="lastname" value=<%=employee.getLastName()%>></td>
				<td><input  type="text" class="form-control" name="username" value=<%=employee.getUserName()%>></td>
                <td><input  type="text" class="form-control" name="password" value=<%=employee.getPassword()%>></td>
				<td><button type="hidden"  name="details" value="Edit Details" class="btn btn-primary" style="background-color: red;">
							<input type ="submit" name="details" value="Edit Details">
						</button></td>
	
			<tr>
		</tbody>
	</table><%} %>
	
	



	</tbody>
	</table>
	</form>

</body>
</html>