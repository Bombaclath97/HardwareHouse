<%@page import="java.util.List"%>
<%@page import="model.bean.ProdottoBean"%>
<%@page import="model.dao.ProdottoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Annunci</title>
<%@ include file="head.jsp"%>
</head>
<body>

	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="homeadmin.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="clientiadmin.jsp">Clienti</a></li>
		<li class="nav-item"><a class="nav-link active" href="annunciadmin.jsp">Annunci</a></li>
		<li class="nav-item"><a class="nav-link" href="acquistiadmin.jsp">Acquisti</a></li>
		<li class="nav-item"><a class="nav-link" href="../logout">Logout</a></li>
	</ul>

	<%
		List<ProdottoBean> annunci = ProdottoDAO.getProductsToApprove();
	for (ProdottoBean p : annunci) {
	%>
	<div class="container">
		<div class="card mb-3" style="max-width: 700px;">
			<div class="row no-gutters">
				<div class="col-md-4">
					<img src="../assets/media/prodotti/<%=p.getImg_path()%>.jpg" class="card-img"
						alt="<%=p.getImg_path()%>">
				</div>
				<div class="col-md-8">
					<div class="card-body">
						<h5 class="card-title"><%=p.getNome()%></h5>
						<p class="card-text"><%=p.getDescrizione()%><br>Articolo venduto da: <%=p.getVenditore() %></p>
						<a href="approveProduct?p=<%=p.getCodice() %>" class="btn btn-primary"> <svg width="1em"
								height="1em" viewBox="0 0 16 16" class="bi bi-check-circle-fill"
								fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  							<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
							</svg>
						</a> <a href="rejectProduct?p=<%=p.getCodice() %>" class="btn btn-danger"> <svg width="1em"
								height="1em" viewBox="0 0 16 16" class="bi bi-dash-circle-fill"
								fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  						<path fill-rule="evenodd"
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h7a.5.5 0 0 0 0-1h-7z" />
						</svg>
						</a>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>


</body>
</html>