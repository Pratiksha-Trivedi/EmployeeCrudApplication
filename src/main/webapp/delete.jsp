<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entity.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Delete Employee</title>
</head>
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setDateHeader("Expires", 0);
  Employee employee=(Employee)session.getAttribute("employee");
  if(employee==null){
	response.sendRedirect("Login.jsp");}%>
<body>
<div class="container">


  <form action =Detilas method = "post">
    <div class="input-group">
      <input id="id" type="number" class="form-control" name="id" placeholder="Enter id" required>
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
    </div>
      <input  type="submit" class="form-control" name="details" value = "Delete">
       </form>
</div>

</body>
</html>