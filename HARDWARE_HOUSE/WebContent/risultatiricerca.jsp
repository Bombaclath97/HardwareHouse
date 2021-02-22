<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@ include file="head.jsp"%>
<script>
	$(document).ready(function() {
		$('input[type=radio][name=flexRadioDefault]').change(function() {
			$.ajax({
				type : "GET",
				url : "filterresultsajax?category=" + this.value,
				success : function(response) {
					$('#resultlist').html(response);
				},
				error : function(xhr, ajaxOptions, thrownError) {
					alert(xhr.responseText);
				}
			})
		})
	})
</script>
</head>
<body>

	<%@ include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-3">
				<h5>Categoria</h5>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" value="All" id="flexRadioDefault6" checked>
					<label class="form-check-label" for="flexRadioDefault6">
						Tutte le categorie </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" value="CPU" id="flexRadioDefault1">
					<label class="form-check-label" for="flexRadioDefault1">
						CPU </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" value="Scheda Madre"
						id="flexRadioDefault2"> <label class="form-check-label"
						for="flexRadioDefault2"> Scheda madre </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" value="Scheda video"
						id="flexRadioDefault3"> <label class="form-check-label"
						for="flexRadioDefault3"> Scheda video </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" value="Alimentatore"
						id="flexRadioDefault4"> <label class="form-check-label"
						for="flexRadioDefault4"> Alimentatore </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio"
						name="flexRadioDefault" value="RAM" id="flexRadioDefault5">
					<label class="form-check-label" for="flexRadioDefault5">
						RAM </label>
				</div>
			</div>

			
			<div class="col-8" id="resultlist"><h5>Hai cercato: <%=request.getParameter("query") %></h5>
				<%
					List<ProdottoBean> risultati = (List<ProdottoBean>) request.getSession().getAttribute("results");
				for (ProdottoBean pb : risultati) {
				%>
				<div class="card mb-3" style="max-width: 700px;">
					<div class="row no-gutters">
						<div class="col-md-4">
							<img src="assets/media/prodotti/<%=pb.getImg_path()%>.jpg"
								class="card-img" alt=<%=pb.getImg_path()%>>
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title"><%=pb.getNome()%></h5>
								<p class="card-text"><%=pb.getDescrizione()%></p>
								<a href="mostra?articolo=<%=pb.getCodice()%>"
									class="btn btn-primary">Vai al prodotto</a>

							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>

		</div>
	</div>



	<%@ include file="footer.jsp"%>

</body>
</html>