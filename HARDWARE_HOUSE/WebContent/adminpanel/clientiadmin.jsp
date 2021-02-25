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
<%
	if (request.getAttribute("done") != null && !request.getAttribute("done").equals("")) {
%>
<script>
	$(document).ready(function() {
		$("#modalFatto").modal('show');
	});
</script>
<%
	}
%>
<meta charset="ISO-8859-1">
<title>Clienti</title>
<%@ include file="head.jsp"%>
</head>
<body>
	<!-- modal Venduto -->
	<div class="modal" id="modalFatto" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Successo!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>L'operazione è andata a buon fine!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link" href="homeadmin.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="clientiadmin.jsp">Clienti</a></li>
		<li class="nav-item"><a class="nav-link" href="annunciadmin.jsp">Annunci</a></li>
		<li class="nav-item"><a class="nav-link" href="acquistiadmin.jsp">Acquisti</a></li>
		<li class="nav-item"><a class="nav-link" href="../logout">Logout</a></li>
	</ul>
	<%
		List<UtentePrivatoBean> listaUtenti = UtentePrivatoDAO.getAllUser();
	%>

	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Email</th>
					<th scope="col">Nome</th>
					<th scope="col">Cognome</th>
					<th scope="col">Data di Nascita</th>
					<th scope="col">Rendi mod</th>
					<th scope="col">Banna utente</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (UtentePrivatoBean up : listaUtenti) {
				%>
				<tr>
					<th scope="row"><%=up.getEmail()%></th>
					<td><%=up.getNome()%></td>
					<td><%=up.getCognome()%></td>
					<td><%=up.getCompleanno().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM))%></td>
					<td><a href="rendiMod?u=<%=up.getEmail()%>"
						class="btn btn-primary"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-arrow-up-square"
								viewBox="0 0 16 16">
  <path fill-rule="evenodd"
									d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm8.5 9.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
</svg>
					</a></td>
					<td><a href="ban?u=<%=up.getEmail()%>" class="btn btn-danger">
							<svg width="1em" height="1em" viewBox="0 0 16 16"
								class="bi bi-dash-circle-fill" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z" />
						</svg>
					</a></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>


</body>
</html>