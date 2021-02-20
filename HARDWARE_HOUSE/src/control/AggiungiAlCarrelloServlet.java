package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProdottoBean;
import model.dao.ProdottoDAO;

/**
 * Servlet implementation class AggiungiAlCarrelloServlet
 */
@WebServlet("/aggiungiAlCarrello")
public class AggiungiAlCarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiAlCarrelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("utente") == null) {
			response.sendError(503);
			return;
		}
		int codice = Integer.parseInt(request.getParameter("codiceArticolo"));
		List<ProdottoBean> carrello = (List<ProdottoBean>) request.getSession().getAttribute("carrello");
		for(ProdottoBean pb : carrello) {
			if(pb.getCodice() == codice) {
				response.sendRedirect("home.jsp");
				return;
			}
		}
		ProdottoBean pb = ProdottoDAO.getProductByID(codice);
		carrello.add(pb);
		request.getSession().setAttribute("carrello", carrello);
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
