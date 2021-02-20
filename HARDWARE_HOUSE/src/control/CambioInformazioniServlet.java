package control;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bean.UtentePrivatoBean;
import model.dao.UserDAO;
import model.dao.UtentePrivatoDAO;

/**
 * Servlet implementation class CambioInformazioniServlet
 */
@WebServlet("/cambiaInformazioni")
public class CambioInformazioniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CambioInformazioniServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password, confermaPassword;
		password = request.getParameter("password") != null ? request.getParameter("password") : "";
		confermaPassword = request.getParameter("confermapassword") != null ? request.getParameter("confermapassword") : "";
		LocalDate dataNascita = !request.getParameter("datanascita").equals("") ? LocalDate.parse(request.getParameter("datanascita")) : null;
		User utente = (User) request.getSession().getAttribute("utente");
		if(!password.equals("")) {
			if(!password.equals(confermaPassword)) {
				throw new IllegalArgumentException("Le password non coincidono");
			}
			else {
				UserDAO.updatePassword(password, utente.getEmail());
			}
		}
		if(dataNascita != null) {
			UtentePrivatoBean up = UtentePrivatoDAO.getUtenteByEmail(utente.getEmail());
			up.setCompleanno(dataNascita);
			request.getSession().setAttribute("utente", up);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}