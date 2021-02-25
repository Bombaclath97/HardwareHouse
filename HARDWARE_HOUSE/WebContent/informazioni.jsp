<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%
	if (request.getAttribute("errorePassword") != null && !request.getAttribute("errorePassword").equals("")) {
%>
<script>
	$(document).ready(function() {
		$("#modalErrore").modal('show');
	});
</script>
<%
	}
%>
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
<%@ include file="head.jsp"%>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<!-- modal Venduto -->
	<div class="modal" id="modalErrore" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Errore!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Le password inserite non coincidono! Riprova un'altra volta.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Chiudi</button>
				</div>
			</div>
		</div>
	</div>

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
	<div class="container">
		<%
			UtentePrivatoBean up = (UtentePrivatoBean) session.getAttribute("utente");
		%>
		<form action="cambiaInformazioni" method="POST">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Nome</label> <input type="email"
						class="form-control" id="inputNome4"
						placeholder="<%=up.getNome()%>" readonly>
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Cognome</label> <input type="password"
						class="form-control" id="inputCognome4"
						placeholder="<%=up.getCognome()%>" readonly>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Email</label> <input type="email"
						class="form-control" id="inputEmail4" name="email"
						placeholder="<%=up.getEmail()%>" readonly>
				</div>
				<div class="form-group col-md-6">
					<label for="inputEmail4">Data di nascita</label> <input type="date"
						id="inputEmail4" class="form-control"
						placeholder="<%=up.getCompleanno()%>" name="datanascita" autofocus>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputPassword4">Password</label> <input type="password"
						class="form-control" id="inputPassword4" name="password">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Conferma Password</label> <input
						type="password" class="form-control" id="inputPassword4"
						name="confermapassword">
				</div>
			</div>
			<button id="submit" data-toggle="modal" data-target="#modal"
				class="btn btn-primary">Salva modifiche</button>
		</form>
	</div>

	<div class="footer" id="paginapiccola">
		<p class="saluti">
			Progetto di <br> Emanuele Bombardelli <br> Gianluca
			Verlingieri <br>
		</p>
	</div>
</body>
</html>