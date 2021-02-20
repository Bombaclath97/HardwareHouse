<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<%@ include file="head.jsp"%>
</head>
<body background="assets/media/BackgroundRegistrazione.jpg">

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
						<h5 class="card-title text-center">Registrazione</h5>
						<form action="registrazione" method="POST" class="form-signin">
							<div class="form-label-group">
								<input type="email" id="inputEmail" class="form-control"
									placeholder="Email address" name="email" required autofocus>
								<label for="inputEmail">Indirizzo e-mail</label>
							</div>
							<div class="form-label-group">
								<input type="text" id="inputEmail" class="form-control"
									placeholder="Nome" name="nome" required autofocus> <label
									for="inputEmail">Nome</label>
							</div>
							<div class="form-label-group">
								<input type="text" id="inputEmail" class="form-control"
									placeholder="Cognome" name="cognome" required autofocus>
								<label for="inputEmail">Cognome</label>
							</div>
							<div class="form-label-group">
								<input type="date" id="inputEmail" class="form-control"
									placeholder="datanascita" name="datanascita" required autofocus>
								<label for="inputEmail">Data di nascita</label>
							</div>
							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="Password" name="password" required> <label
									for="inputPassword">Password</label>
							</div>
							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="Password" name="password" required> <label
									for="inputPassword">Ripeti password</label>
							</div>


							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Registrati</button>
							<hr class="my-4">
							<h5 class="card-title text-center">Ritorna alla schermata di
								login</h5>
						</form>
						<a href="login.jsp"
							class="btn btn-lg btn-primary btn-block text-uppercase">Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>


</html>