package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ProdottoBean;
import model.bean.User;
import model.dao.AmministratoreDAO;
import model.dao.UserDAO;
import model.dao.UtentePrivatoDAO;
import util.PasswordEncrypter;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "login", description = "Servlet che si occupa della logica di login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession(true);
		
		//L'utente è gia registrato
		if(session.getAttribute("utente")!=null) {
			request.setAttribute("alreadySignedIn", true);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			return;
		}

		else {
			String email = (String) request.getParameter("email");
			String password = (String) request.getParameter("password");

			//Controllo se un utente ha messo email e password vuoti o falsi
			if(email != null) {
				if(email.length() < 8 || email.length() > 45) {
					request.setAttribute("datiErrati", true);
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
			}

			if(password != null) {
				if(password.length() < 8 || password.length() > 20) {
					request.setAttribute("datiErrati", true);
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
			}

			if (email.equals("") || password.equals("")) {
				request.setAttribute("datiErrati", true);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}

			//Controlliamo se la password è corretta. Se lo è, facciamo il login, creiamo il carrello ecc.
			else {
				String encryptedPassword = PasswordEncrypter.encryptor(password);
				if(!encryptedPassword.equals(UserDAO.getPasswordByEmail(email))) {
					request.setAttribute("datiErrati", true);
					request.getRequestDispatcher("login.jsp").forward(request, response);
					return;
				}
				//LOGIN: creo l'utente, il carrello e metto tutto in sessione.
				String tipo = UserDAO.getTipoByEmail(email);
				User utente = (tipo.equals("p")) ? UtentePrivatoDAO.getUtenteByEmail(email) :
					AmministratoreDAO.getAmministratoreByEmail(email);
				//session.setMaxInactiveInterval(300);
				switch(utente.getTipo()) {
				case "p":
					List<ProdottoBean> carrello = new ArrayList<ProdottoBean>();
					session.setAttribute("carrello", carrello);
					session.setAttribute("utente", utente);
					session.setAttribute("tipo", utente.getTipo());
					break;
				case "a":
					session.setAttribute("utente", utente);
					session.setAttribute("tipo", utente.getTipo());
					break;
				default: 
					break;
				}
				response.addCookie(new Cookie("", ""));
				response.setContentType("text/html");
				response.sendRedirect((utente.getTipo() == "p" ? "home.jsp" : "adminpanel/homeadmin.jsp"));
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
