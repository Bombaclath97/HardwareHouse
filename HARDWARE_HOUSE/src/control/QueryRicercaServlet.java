package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProdottoBean;
import model.dao.ProdottoDAO;

/**
 * Servlet implementation class QueryRicercaServlet
 */
@WebServlet("/query")
public class QueryRicercaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryRicercaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProdottoBean> risultati = new ArrayList<ProdottoBean>();
		if(request.getParameter("query") != null) {
			String query = request.getParameter("query");
			risultati = ProdottoDAO.getResultList(query);
		} else if(request.getParameter("categoria") != null){
			switch(request.getParameter("categoria")) {
			case "schedevideo": risultati = ProdottoDAO.getResultByCategory("Scheda video");
				break;
			case "processori": risultati = ProdottoDAO.getResultByCategory("CPU");
				break;
			default:
				break;
			}
		} else {
			risultati = ProdottoDAO.getProdottiInVendita();
		}
		request.getSession().setAttribute("results", risultati);
		request.getRequestDispatcher("risultatiricerca.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
