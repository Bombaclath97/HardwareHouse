<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="head.jsp"%>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<div class="container">
		<%
			UtentePrivatoBean up = (UtentePrivatoBean) session.getAttribute("utente");
		%>
		<form action="coambioInformazioni" method="POST">
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