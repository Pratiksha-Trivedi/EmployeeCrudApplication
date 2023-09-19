<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="entity.Employee"%>
<%@ page import="service.EmployeeService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);
  Employee employee=(Employee)session.getAttribute("employee");
  if(employee==null){
	response.sendRedirect("Login.jsp");}%>
<body>
	<div>



		<%
		List<Employee> list = (List<Employee>) session.getAttribute("employeeList");
		int lastEmployeeId = 0; // Default value if the list is empty
		if (list != null && !list.isEmpty()) {
			Employee lastEmployee = list.get(list.size() - 1);
			lastEmployeeId = lastEmployee.getId();
		}
		%>
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>User Name</th>
					<th>Admin</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Employee e : list) {
				%>
				<tr class="info">
					<td><%=e.getId()%></td>
					<td><%=e.getFirstName()%></td>
					<td><%=e.getLastName()%></td>
					<td><%=e.getUserName()%></td>
					<td><%=e.isAdmin()%></td>
			</tbody>
			<%
			}
			%>
		</table>
	</div>
</body>
</html>