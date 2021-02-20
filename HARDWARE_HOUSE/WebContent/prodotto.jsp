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
	<%ProdottoBean pb = (ProdottoBean) request.getAttribute("prodotto"); %>

	<div class="container">
		<div class="row">
			<div class="col">
				<figure class="figure">
					<img src="assets/media/prodotti/<%=pb.getImg_path() %>.jpg"
						class="figure-img img-fluid rounded" alt="Image.">
					<figcaption class="figure-caption text-left"></figcaption>
				</figure>
			</div>
			<div class="col">
				<h2><%=pb.getNome() %></h2>

				<hr class="my-4">

				<h4><%=pb.getDescrizione() %></h4>
				<br>

				<table class="table">
					<tbody>
						<tr>
							<th scope="row">Categoria</th>
							<td><%=pb.getCategoria() %></td>
						</tr>
						<tr>
							<th scope="row">Venditore</th>
							<td><%=pb.getVenditore() %></td>
						</tr>
					</tbody>
				</table>
				<a href="aggiungiAlCarrello?codiceArticolo=<%=pb.getCodice() %>"
					class="btn btn-primary"> <svg width="1em" height="1em"
						viewBox="0 0 16 16" class="bi bi-cart-plus-fill"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
 						<path fill-rule="evenodd"
							d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zM4 14a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm7 0a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z" />
						</svg>
				</a>

				<hr class="my-4">

				<h3>
					&euro;<%=pb.getPrezzo() %></h3>

			</div>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>