package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.PreferitiBean;
import model.bean.ProdottoBean;
import model.bean.User;
import model.bean.UtentePrivatoBean;
import model.dao.PreferitiDAO;
import model.dao.ProdottoDAO;

/**
 * Servlet implementation class MostraPreferitiServlet
 */
@WebServlet("/mostrapreferiti")
public class MostraPreferitiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostraPreferitiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User up = (User) request.getSession().getAttribute("utente");
		List<PreferitiBean> listaPreferiti = PreferitiDAO.getAllPreferitiOfUtente(up.getEmail());
		List<ProdottoBean> preferiti = new ArrayList<ProdottoBean>();
		for(PreferitiBean preferito : listaPreferiti) {
			preferiti.add(ProdottoDAO.getProductByID(preferito.getId()));
		}
		request.setAttribute("preferiti", preferiti);
		request.getRequestDispatcher("preferiti.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
