package control;

import java.io.IOException;
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
 * Servlet implementation class RendiModServlet
 */
@WebServlet("/adminpanel/rendiMod")
public class RendiModServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RendiModServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtentePrivatoBean up = UtentePrivatoDAO.getUtenteByEmail(request.getParameter("u"));
		UserDAO.makeAdmin(up);
		request.setAttribute("done", true);
		request.getRequestDispatcher("clientiadmin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
