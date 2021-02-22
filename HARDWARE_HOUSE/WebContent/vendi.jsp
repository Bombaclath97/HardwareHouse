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

		<blockquote class="blockquote text-center">
			<p class="mb-0">VENDI</p>
			<footer class="blockquote-footer"> Metti in vendita i tuoi
				prodotti </footer>
		</blockquote>

		<br> <br>

		<form action="vendita" method="POST" enctype="multipart/form-data">
			<div class="form-group row">
				<label for="exampleFormControlFile1">Scegli l'immagine del
					prodotto (formato accettato: .jpg)</label> <input type="file" accept=".jpg"
					class="form-control-file" id="exampleFormControlFile1" name="img">
			</div>
			<div class="form-group row">
				<label for="exampleFormControlInput1">Titolo Inserzione</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					placeholder="Titolo qui..." name="nome">
			</div>
			<div class="form-group row">
				<label for="exampleFormControlTextarea1">Descrizione
					prodotto (max. 256 caratteri)</label>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" placeholder="Descrizione qui..." name="descrizione"></textarea>
			</div>
			<div class="form-group row">
				<label for="exampleFormControlSelect1">Categoria</label> <select
					class="form-control" id="exampleFormControlSelect1"
					name="categoria">
					<option>CPU</option>
					<option>RAM</option>
					<option>Scheda video</option>
					<option>Alimentatore</option>
					<option>Scheda madre</option>
				</select>
			</div>
			<div class="form-group row">
				<label for="exampleFormControlInput1">Prezzo</label> <input
					type="text" class="form-control" id="exampleFormControlInput1"
					placeholder="Prezzo qui..." name="prezzo">
			</div>
			<button type="submit" class="btn btn-primary">Vendi</button>
		</form>
	</div>

	<div class="footer">
		<p class="saluti">
			Progetto di <br> Emanuele Bombardelli <br> Gianluca
			Verlingieri <br>
		</p>
	</div>

</body>
</html>