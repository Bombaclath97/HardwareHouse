package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProdottoBean;
import model.dao.ProdottoDAO;

/**
 * Servlet implementation class RicercaAJAX
 */
@WebServlet(urlPatterns = { "/ricercaajax" }, asyncSupported = true)
public class RicercaAJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RicercaAJAX() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		List<ProdottoBean> results = ProdottoDAO.getResultList(request.getParameter("q"));
		if(!results.isEmpty()) {
			pw.write("<ul>");
			for(ProdottoBean result : results) {
				pw.write("<li> <a href=\"mostra?articolo=" + result.getCodice() + "\"> " + result.getNome() + "</a> </li>");
			}
			pw.write("</ul>");
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
