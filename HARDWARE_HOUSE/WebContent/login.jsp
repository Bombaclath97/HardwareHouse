<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@ include file="head.jsp"%>
<%
	if (request.getAttribute("datiErrati") != null && !request.getAttribute("datiErrati").equals("")) {
%>
<script>
	$(document).ready(function() {
		$("#modalErrore").modal('show');
	});
</script>
<%
	}
%>
</head>
<body background="assets/media/BackgroundLogin.jpg">

	<!-- modal Dati Errati -->
	<div class="modal" id="modalErrore" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Dati non corretti!</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>La mail o la password inserita non sono valide. Riprova.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Ho capito!</button>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<a type="Submit" class="btn btn-secondary" href="home.jsp"> <svg
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-arrow-left-square"
								viewBox="0 0 16 16">
								<path fill-rule="evenodd"
									d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"></path>
							</svg>
						</a>
						<h5 class="card-title text-center">Login</h5>
						<span class="visually-hidden"></span>
						<form action="login" method="POST" class="form-signin">
							<div class="form-label-group">
								<input type="email" id="inputEmail" class="form-control"
									placeholder="Email address" name="email" required autofocus>
								<label for="inputEmail">Indirizzo e-mail</label>
							</div>
							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="Password" name="password" required> <label
									for="inputPassword">Password</label>
							</div>

							<div class="custom-control custom-checkbox mb-3">
								<input type="checkbox" class="custom-control-input"
									id="customCheck1" name="ricorda"> <label
									class="custom-control-label" for="customCheck1">Rimani
									registrato</label>
							</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Login</button>
							<hr class="my-4">
							<h5 class="card-title text-center">Non hai un account?
								Creane uno!</h5>
						</form>
						<a class="btn btn-lg btn-primary btn-block text-uppercase"
							href="registrazione.jsp">Registrati</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>