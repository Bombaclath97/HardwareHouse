<%@page import="model.bean.PreferitiBean"%>
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
		<div class="row">
			<div class="col-8">
				<%
					List<ProdottoBean> preferiti = (List<ProdottoBean>) request.getAttribute("preferiti");
				if (!preferiti.isEmpty()) {
					for (ProdottoBean pb : preferiti) {
				%>
				<div class="card mb-3" style="max-width: 700px;">
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="assets/media/prodotti/<%=pb.getImg_path()%>.jpg"
								class="card-img" alt="<%=pb.getImg_path()%>">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title"><%=pb.getNome()%></h5>
								<p class="card-text"><%=pb.getDescrizione()%></p>
								<a href="mostra?articolo=<%=pb.getCodice()%>"
									class="btn btn-primary">Vai al prodotto</a> <a href="aggiungiAlCarrello?codiceArticolo=<%=pb.getCodice()%>"
									class="btn btn-primary"> <svg width="1em" height="1em"
										viewBox="0 0 16 16" class="bi bi-cart-plus-fill"
										fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
											d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z" />
</svg>
								</a>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				} else {
				%>
				<h5>Non hai ancora aggiunto nessun prodotto alla tua lista
					preferiti!</h5>
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