<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="entity.Employee"%>
<%@ page import="service.EmployeeService"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

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

		<%!Employee employee;
	EmployeeService employeeService = new EmployeeService();%>
		<%
		employee = (Employee) session.getAttribute("employee");
		%>
		<%
		List<Employee> list = (	List<Employee>) session.getAttribute("employeeList");
		int lastEmployeeId = 0; // Default value if the list is empty
		if (list != null && !list.isEmpty()) {
			Employee lastEmployee = list.get(list.size() - 1);
			lastEmployeeId = lastEmployee.getId();
			lastEmployeeId ++;
		
		%>
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>User Name</th>
					<th>Admin</th>
					<th>Password</th>
				</tr>
			</thead>
			<tbody> 	
				<%
					for (Employee e:list) {
				%>
				<tr class="info">
					<td><%=e.getId()%></td>
					<td><%=e.getFirstName()%></td>
					<td><%=e.getLastName()%></td>
					<td><%=e.getUserName()%></td>
					<td><%=e.isAdmin()%></td>
					<td><%=e.getPassword()%></td>
					<td><button type="button" class="btn btn-primary" style="background-color: red;">
							<a href="Detilas?details=Delete&id=<%=e.getId()%>">Delete</a>
						</button>
						<div class="container">		
						</td>
						<td><button type="button" class="btn btn-primary" style="background-color: red;">
							<a href="editemp.jsp?details=Edit&id=<%=e.getId()%>">Update</a>
						</button>
				
					<%
					}
					%>
					<%}
					%>
				
				<tr>
					<td><button type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#staticBackdrop1">AddEmployee</button>
						<!-- Modal -->
						<div class="modal fade" id="staticBackdrop1" data-backdrop="static"
							data-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">Add
											Employee</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<form action="Detilas" method="post" name="formAction">
											<div class="card "></div>
											<div class="card-body">
												<h5 class="card-title"></h5>
												<p class="card-text"></p>
												<table class="table">
													<tbody>
														<tr>
															<th scope="row">EmployeeId</th>
															<td><input type="number" name="id" value=<%=lastEmployeeId%>
																readonly="readonly" placeholder="Enter the id"></td>
														</tr>
														<tr>
															<th scope="row">First Name</th>
															<td><input class="form-control" type="text"
																name="firstname" placeholder="FIrst Name"></td>
														</tr>
														<tr>
															<th scope="row">Last Name</th>
															<td><input class="form-control" type="text"
																name="lastname" placeholder="Lasr Name"></td>
														</tr>
														<tr>
															<th scope="row">User Name</th>
															<td><input class="form-control" type="text"
																name="username" placeholder="Lasr Name"></td>
														</tr>
														<tr>
															<th scope="row">Password</th>
															<td><input class="form-control" type="text"
																name="password" placeholder="password"></td>
														</tr>
														<tr>
															<th scope="row">IsAdmin</th>
															<td><input type="radio" id="isAdminYes"
																name="isAdmin" value="yes"> <label
																for="isAdminYes">Yes</label> <input type="radio"
																id="isAdminNo" name="isAdmin" value="no"> <label
																for="isAdminNo">No</label>
																<input type="hidden" name="details" value="Add">
													</tbody>
												</table>
											</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>

	<button type="submit" class="btn btn-primary">Add</button>
									</div>

									</div>

								</div>
							</div>
						</div>
						</div></td>
						<td><button type="button" class="btn btn-primary" style="background-color: red;">
							<a href="Detilas?details=Logout">Logout</a>
						</button>
						<div class="container">		
						</td>
				</tr>




			</tbody>
		</table>
	</div>
</body>
					