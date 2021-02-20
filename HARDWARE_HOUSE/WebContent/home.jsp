<%@page import="model.dao.ProdottoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp"%>
<%if(request.getAttribute("venduto") != null && !request.getAttribute("venduto").equals("")) {%>
<script>
$(document).ready(function(){
    $("#modalVenduto").modal('show');
}); 
</script>
<%} %>
<%if(request.getAttribute("alreadySignedIn") != null && !request.getAttribute("alreadySignedIn").equals("")) {%>
<script>
$(document).ready(function(){
    $("#modalLoggato").modal('show');
}); 
</script>
<%} %>
<%if(request.getAttribute("acquisto") != null) {%>
<script>
$(document).ready(function(){
    $("#modalAcquisto").modal('show');
}); 
</script>
<%} %>
</head>
<body>
	<!-- modal Venduto -->
	<div class="modal" id="modalVenduto" tabindex="-1" role="dialog">
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
					<p>Il prodotto è stato passato ai nostri moderatori per
						approvazione. A breve la tua inserzione apparirà sul sito!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Ho capito!</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal Loggato -->
	<div class="modal" id="modalLoggato" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Utente già registrato</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Hai già effettuato il login, non puoi effettuarne altri
						finché non effettui il logout!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Ho capito!</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal Acquisto -->
	<div class="modal" id="modalAcquisto" tabindex="-1" role="dialog">
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
					<p>Hai completato il tuo acquisto, ti ringraziamo di aver comprato da Hardware House!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Magnifico!</button>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="navbar.jsp"%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="assets/media/BannerSlider1.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="assets/media/BannerSlider2.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="assets/media/BannerSlider3.jpg"
					alt="Third slide">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<blockquote class="blockquote text-center">
		<p class="mb-0">SCHEDE VIDEO</p>
		<footer class="blockquote-footer">Le migliori <cite title="Visualizza tutte le schede video"><a href="query?categoria=schedevideo"> schede video </a></cite></footer>
	</blockquote>


	<div class="container">
		<div class="row">
			<%
				List<ProdottoBean> schedeVideo = ProdottoDAO.getResultByCategory("Scheda video");
			for (int i = 0; i < 3 && i < schedeVideo.size(); i++) {
				ProdottoBean pb = schedeVideo.get(i);
			%>
			<div class="col-sm">
				<div class="card" style="width: 18rem;">
					<img src="assets/media/prodotti/<%=pb.getImg_path()%>.jpg"
						class="card-img-top" alt="<%=pb.getImg_path()%>">
					<div class="card-body">
						<h5 class="card-title"><%=pb.getNome()%></h5>
						<p class="card-text"><%=pb.getDescrizione()%></p>
						<a href="mostra?articolo=<%=pb.getCodice() %>"
							class="btn btn-primary">Vai al prodotto</a>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<blockquote class="blockquote text-center">
		<p class="mb-0">PROCESSORI</p>
		<footer class="blockquote-footer">I migliori <cite title="Visualizza tutte le schede video"><a href="query?categoria=processori">  processori </a></cite></footer>
	</blockquote>



	<div class="container">
		<div class="row">
			<%
				List<ProdottoBean> processori = ProdottoDAO.getResultByCategory("CPU");
			for (int i = 0; i < 3 && i < processori.size(); i++) {
				ProdottoBean pb = processori.get(i);
			%>
			<div class="col-sm">
				<div class="card" style="width: 18rem;">
					<img src="assets/media/prodotti/<%=pb.getImg_path()%>.jpg"
						class="card-img-top" alt="<%=pb.getImg_path()%>">
					<div class="card-body">
						<h5 class="card-title"><%=pb.getNome()%></h5>
						<p class="card-text"><%=pb.getDescrizione()%></p>
						<!-- 60 caratteri -->
						<a href="mostra?articolo=<%=pb.getCodice() %>"
							class="btn btn-primary">Vai al prodotto</a>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>