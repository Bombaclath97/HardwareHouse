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
		ProdottoBean pb = (ProdottoBean) request.getAttribute("prodotto");
	%>

	<div class="container">
		<div class="row">
			<div class="col">
				<figure class="figure">
					<img src="assets/media/prodotti/<%=pb.getImg_path()%>.jpg"
						class="figure-img img-fluid rounded" alt="Image.">
					<figcaption class="figure-caption text-left"></figcaption>
				</figure>
			</div>
			<div class="col">
				<h2><%=pb.getNome()%></h2>

				<hr class="my-4">

				<h4><%=pb.getDescrizione()%></h4>
				<br>

				<table class="table">
					<tbody>
						<tr>
							<th scope="row">Categoria</th>
							<td><%=pb.getCategoria()%></td>
						</tr>
						<tr>
							<th scope="row">Venditore</th>
							<td><%=pb.getVenditore()%></td>
						</tr>
					</tbody>
				</table>
				<a href="aggiungiAlCarrello?codiceArticolo=<%=pb.getCodice()%>"
					class="btn btn-primary"> <svg width="1em" height="1em"
						viewBox="0 0 16 16" class="bi bi-cart-plus-fill"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 						<path fill-rule="evenodd"
							d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z" />
						</svg>
				</a>
				<%
					if (request.getSession().getAttribute("utente") != null) {
				%>
				<a href="aggiungiAiPreferiti?p=<%=pb.getCodice()%>"
					class="btn btn-primary"><svg width="1em" height="1em"
						viewBox="0 0 16 16" class="bi bi-bookmark-star-fill"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
							d="M4 0a2 2 0 0 0-2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4zm4.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.178.178 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.178.178 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.178.178 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.178.178 0 0 1-.134-.098L8.16 4.1z" />
</svg></a>
				<%
					}
				%>
				<hr class="my-4">

				<h3>
					&euro;<%=pb.getPrezzo()%></h3>

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