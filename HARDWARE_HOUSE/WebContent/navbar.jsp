<%@page import="model.bean.ProdottoBean"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.UtentePrivatoDAO"%>
<%@page import="model.bean.UtentePrivatoBean"%>
<%@page import="model.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script>
	function showResult(str) {
		if (str.length == 0) {
			document.getElementById("risultati").innerHTML = "";
			document.getElementById("risultati").style.border = "0px";
			return;
		}
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("risultati").innerHTML = this.responseText;
				document.getElementById("risultati").style.border = "1px solid #A5ACB2";
			}
		}
		xmlhttp.open("GET", "ricercaajax?q=" + str, true);
		xmlhttp.send();
	}
</script>
</head>
<body>

	<%
		User user = session.getAttribute("utente") != null ? (User) session.getAttribute("utente") : null;
	%>

	<nav id="navbar" class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="home.jsp">HardwareHouse</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a>
				</li>
				<%
					if (user != null) {
						List<ProdottoBean> carrello = (List<ProdottoBean>) session.getAttribute("carrello");
						UtentePrivatoBean up = UtentePrivatoDAO.getUtenteByEmail(user.getEmail());
						String nomeUtente = "" + up.getNome() + " " + up.getCognome();
				%>
				<li class="nav-item"><a class="nav-link" href="carrello.jsp">Carrello
						(<%=carrello.size()%>)
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <%=nomeUtente%>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="vendi.jsp">Metti in vendita</a> <a
							class="dropdown-item" href="mostrapreferiti">Lista preferiti</a>
						<a class="dropdown-item" href="informazioni.jsp">Cambia
							informazioni</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="logout">Logout</a>
					</div></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
				</li>
				<%
					}
				%>
			</ul>
			<form action="query" method="POST" class="form-inline my-2 my-lg-0">
				<input id="searchBar" class="form-control mr-sm-2" name="query"
					type="search" placeholder="Cerca qui.." aria-label="Search"
					onkeyup="showResult(this.value)">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Cerca</button>
			</form>
		</div>
	</nav>
	<div id="risultati"></div>


</body>
</html>