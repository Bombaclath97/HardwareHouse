package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProdottoBean;
import model.bean.User;
import model.dao.ProdottoDAO;

/**
 * Servlet implementation class CompletaAcquistoServlet
 */
@WebServlet("/completaAcquisto")
public class CompletaAcquistoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompletaAcquistoServlet() {
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<ProdottoBean> carrello = (List<ProdottoBean>) request.getSession().getAttribute("carrello");
    	User utente = (User) request.getSession().getAttribute("utente");
    	for(ProdottoBean pb : carrello) {
    		ProdottoDAO.buy(pb, utente.getEmail());
    	}
    	request.getSession().setAttribute("carrello", new ArrayList<ProdottoBean>());
    	request.getRequestDispatcher("home.jsp?acquisto=true").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
