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
	<%
		List<ProdottoBean> carrello = (List<ProdottoBean>) request.getSession().getAttribute("carrello");
	%>
	<div class="container">
		<div class="row">

			<div class="col-8">
				<%
					for (ProdottoBean pb : carrello) {
				%>
				<div class="card mb-3" style="max-width: 700px;">
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="assets/media/prodotti/<%=pb.getImg_path()%>.jpg"
								class="card-img" alt="<%=pb.getNome()%>">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title"><%=pb.getNome()%></h5>
								<p class="card-text"><%=pb.getDescrizione()%></p>
								<a href="mostra?articolo=<%=pb.getCodice()%>"
									class="btn btn-primary">Vai al prodotto</a> <a
									href="rimuovi?articolo=<%=pb.getCodice()%>"
									class="btn btn-primary">Rimuovi</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
					double totale = 0d;
				%>
			</div>

			<div class="col-md-4 order-md-2 mb-4">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-muted">Il tuo carrello:</span> <span
						class="badge badge-secondary badge-pill"><%=carrello.size()%></span>
				</h4>
				<ul class="list-group mb-3">
					<%
						for (ProdottoBean pb : carrello) {
					%>
					<li
						class="list-group-item d-flex justify-content-between lh-condensed">
						<div>
							<h6 class="my-0"><%=pb.getNome()%></h6>
						</div> <span class="text-muted">&euro;<%=pb.getPrezzo()%></span>
					</li>
					<%
						totale += pb.getPrezzo();
						}
					%>
					<li class="list-group-item d-flex justify-content-between"><span>Totale</span>
						<strong>&euro;<%=totale%></strong></li>
				</ul>
				<%
					if (!carrello.isEmpty()) {
				%>
				<a href="completaAcquisto" class="btn btn-primary">Procedi
					all'acquisto</a>
				<%
					}
				%>
			</div>
		</div>
	</div>


	<div class="footer" id="paginapiccola">
		<p class="saluti">
			Progetto di <br> Emanuele Bombardelli <br> Gianluca
			Verlingieri <br>
		</p>
	</div>

</body>
</html>