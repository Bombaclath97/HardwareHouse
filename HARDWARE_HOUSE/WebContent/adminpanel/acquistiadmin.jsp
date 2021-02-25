<%@page import="java.util.List"%>
<%@page import="model.bean.ProdottoBean"%>
<%@page import="model.dao.ProdottoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp"%>
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
<title>Acquisti</title>
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
		<li class="nav-item"><a class="nav-link" href="clientiadmin.jsp">Clienti</a></li>
		<li class="nav-item"><a class="nav-link" href="annunciadmin.jsp">Annunci</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="acquistiadmin.jsp">Acquisti</a></li>
		<li class="nav-item"><a class="nav-link" href="../logout">Logout</a></li>
	</ul>

	<%
		List<ProdottoBean> annunci = ProdottoDAO.getBoughtProducts();
	if (annunci.isEmpty()) {
	%>
	<h1>Non ci sono ordini completati ancora non trattati!</h1>
	<%
		} else {
	for (ProdottoBean p : annunci) {
	%>
	<div class="container">
		<div class="card mb-3" style="max-width: 700px;">
			<div class="row no-gutters">
				<div class="col-md-4">
					<img src="../assets/media/prodotti/<%=p.getImg_path()%>.jpg"
						class="card-img" alt="<%=p.getImg_path()%>">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title"><%=p.getNome()%></h5>
						<p class="card-text"><%=p.getDescrizione()%><br>Articolo
							venduto da:
							<%=p.getVenditore()%>
							<br> Articolo acquistato da:
							<%=p.getAcquirente()%></p>
						<a href="archiveOrder?p=<%=p.getCodice()%>"
							class="btn btn-primary">Archivia ordine</a> <a
							href="deleteOrder?p=<%=p.getCodice()%>" class="btn btn-danger">Annulla
							ordine</a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	}
	%>


</body>
</html>