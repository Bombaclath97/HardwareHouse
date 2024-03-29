<%@page import="model.dao.AmministratoreDAO"%>
<%@page import="model.bean.AmministratoreBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@ include file="head.jsp"%>
</head>
<body>
	<%AmministratoreBean ab = (AmministratoreBean) request.getSession().getAttribute("utente"); %>
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active"
			href="homeadmin.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="clientiadmin.jsp">Clienti</a></li>
		<li class="nav-item"><a class="nav-link" href="annunciadmin.jsp">Annunci</a></li>
		<li class="nav-item"><a class="nav-link" href="acquistiadmin.jsp">Acquisti</a></li>
		<li class="nav-item"><a class="nav-link" href="../logout">Logout</a></li>
	</ul>
	<div class="container">
		<div class="jumbotron jumbotron-fluid">
			<h1 class="display-4">Benvenuto, <%=ab.getEmail() %></h1>
			<h3 class="display-4">Numeri di servizio</h3>
			<p class="lead">Emanuele Bombardelli: 380 2882133</p>
			<p class="lead">Gianluca Verlingieri: 338 5729345</p>
			<p class="lead">E-mail di servizio: assistenza@hardwarehouse.it</p>
		</div>
	</div>

</body>
</html>