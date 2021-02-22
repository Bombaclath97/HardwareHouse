<%@page import="java.time.format.FormatStyle"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.bean.UtentePrivatoBean"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.UtentePrivatoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clienti</title>
<%@ include file="head.jsp"%>
</head>
<body>

	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="homeadmin.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link active" href="clientiadmin.jsp">Clienti</a></li>
		<li class="nav-item"><a class="nav-link" href="annunciadmin.jsp">Annunci</a></li>
		<li class="nav-item"><a class="nav-link" href="annunciadmin.jsp">Acquisti</a></li>
		<li class="nav-item"><a class="nav-link" href="../logout">Logout</a></li>
	</ul>
	<%List<UtentePrivatoBean> listaUtenti = UtentePrivatoDAO.getAllUser(); %>

	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Email</th>
					<th scope="col">Nome</th>
					<th scope="col">Cognome</th>
					<th scope="col">Data di Nascita</th>
				</tr>
			</thead>
			<tbody>
				<%for(UtentePrivatoBean up : listaUtenti) {%>
				<tr>
					<th scope="row"><%=up.getEmail() %></th>
					<td><%=up.getNome() %></td>
					<td><%=up.getCognome() %></td>
					<td><%=up.getCompleanno().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM)) %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>


</body>
</html>