package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProdottoBean;

/**
 * Servlet implementation class RimuoviDalCarrelloServlet
 */
@WebServlet("/rimuovi")
public class RimuoviDalCarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RimuoviDalCarrelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProdottoBean> carrello = (List<ProdottoBean>) request.getSession().getAttribute("carrello");
		int codice = Integer.parseInt(request.getParameter("articolo"));
		for(ProdottoBean pb : carrello) {
			if(pb.getCodice() == codice) {
				carrello.remove(pb);
				break;
			}
		}
		request.getSession().setAttribute("carrello", carrello);
		response.sendRedirect("carrello.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
