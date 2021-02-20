<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp"%>
<%@ page isErrorPage="true" %>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<%switch(response.getStatus()) {
	case 503:%>
	<div class="jumbotron">
		<h1 class="display-4">ERRORE 503</h1>
		<p class="lead">Devi effettuare il login per poter sfruttare questa funzionalità.</p>
		<hr class="my-4">
		<p>Puoi registrarti premendo l'apposito pulsante in alto a sinistra.</p>
	</div>
	<%break;
	default:
		break;
		} %>
</body>
</html>