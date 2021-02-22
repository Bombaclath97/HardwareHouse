package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.PreferitiBean;
import model.bean.User;
import model.dao.PreferitiDAO;

/**
 * Servlet implementation class AggiungiAiPreferitiServlet
 */
@WebServlet("/aggiungiAiPreferiti")
public class AggiungiAiPreferitiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiAiPreferitiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int codice = Integer.parseInt(request.getParameter("p"));
		User utente = (User) request.getSession().getAttribute("utente");
		PreferitiDAO.addToPreferiti(new PreferitiBean(utente.getEmail(), codice));
		request.setAttribute("done", true);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
