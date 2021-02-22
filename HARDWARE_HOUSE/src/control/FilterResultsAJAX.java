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

/**
 * Servlet implementation class FilterResultsAJAX
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/filterresultsajax" })
public class FilterResultsAJAX extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FilterResultsAJAX() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String categoria = request.getParameter("category");
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		List<ProdottoBean> results = (List<ProdottoBean>) request.getSession().getAttribute("results");
		if(!categoria.equals("All")) {
			for(ProdottoBean pb : results) {
				if(pb.getCategoria().equalsIgnoreCase(categoria)) {
					pw.append("<div class=\"card mb-3\" style=\"max-width: 700px;\">"
							+ "<div class=\"row no-gutters\">"
							+ "<div class=\"col-md-4\">"
							+ "<img src=\"assets/media/prodotti/" + pb.getImg_path() + ".jpg\"class=\"card-img\" alt=" + pb.getImg_path() + ">"
							+ "</div>"
							+ "<div class=\"col-md-8\"><div class=\"card-body\">"
							+ "<h5 class=\"card-title\">"
							+ pb.getNome()
							+ "</h5>"
							+ "<p class=\"card-text\">"
							+ pb.getDescrizione()
							+ "</p>"
							+ "<a href=\"mostra?articolo=" + pb.getCodice() + "\"	class=\"btn btn-primary\">Vai al prodotto</a>"
							+ "</div>"
							+ "</div>"
							+ "</div>"
							+ "</div>");
				}
			} 
		} else {
			for(ProdottoBean pb : results) {
				pw.append("<div class=\"card mb-3\" style=\"max-width: 700px;\">"
						+ "<div class=\"row no-gutters\">"
						+ "<div class=\"col-md-4\">"
						+ "<img src=\"assets/media/prodotti/" + pb.getImg_path() + ".jpg\"class=\"card-img\" alt=" + pb.getImg_path() + ">"
						+ "</div>"
						+ "<div class=\"col-md-8\"><div class=\"card-body\">"
						+ "<h5 class=\"card-title\">"
						+ pb.getNome()
						+ "</h5>"
						+ "<p class=\"card-text\">"
						+ pb.getDescrizione()
						+ "</p>"
						+ "<a href=\"mostra?articolo=" + pb.getCodice() + "\"	class=\"btn btn-primary\">Vai al prodotto</a>"
						+ "</div>"
						+ "</div>"
						+ "</div>"
						+ "</div>");
			} 
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
