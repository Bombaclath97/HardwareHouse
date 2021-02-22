<%@page import="java.util.List"%>
<%@page import="model.bean.ProdottoBean"%>
<%@page import="model.dao.ProdottoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Acquisti</title>
<%@ include file="head.jsp"%>
</head>
<body>

	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="homeadmin.jsp">Home</a></li>
		<li class="nav-item"><a class="nav-link" href="clientiadmin.jsp">Clienti</a></li>
		<li class="nav-item"><a class="nav-link" href="annunciadmin.jsp">Annunci</a></li>
		<li class="nav-item"><a class="nav-link active" href="annunciadmin.jsp">Acquisti</a></li>
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
						<a href="../approveProduct?p=<%=p.getCodice() %>" class="btn btn-primary">Archivia ordine</a>
						<a href="../rejectProduct?p=<%=p.getCodice() %>" class="btn btn-danger">Annulla ordine</a>

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