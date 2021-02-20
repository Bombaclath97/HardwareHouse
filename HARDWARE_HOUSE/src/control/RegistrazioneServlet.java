package control;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProdottoBean;
import model.bean.UtentePrivatoBean;
import model.dao.UtentePrivatoDAO;

/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet(description = "Servlet che si occupa della registrazione", urlPatterns = { "/registrazione" })
public class RegistrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegistrazioneServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email, nome, cognome, password;
		LocalDate compleanno;

		email = request.getParameter("email");
		nome = request.getParameter("nome");
		cognome = request.getParameter("cognome");
		password = request.getParameter("password");

		compleanno = LocalDate.parse(request.getParameter("datanascita"));

		UtentePrivatoBean utente = new UtentePrivatoBean(email, nome, cognome, compleanno);
		UtentePrivatoDAO.createUtentePrivato(utente, password);

		List<ProdottoBean> carrello = new ArrayList<ProdottoBean>();
		request.getSession().setAttribute("carrello", carrello);
		request.getSession().setAttribute("utente", utente);
		request.getSession().setAttribute("tipo", utente.getTipo());

		response.sendRedirect("home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
