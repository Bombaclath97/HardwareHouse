package control;

import java.io.IOException;
import java.util.List;

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
		User utente = request.getSession().getAttribute("utente") != null ?  (User) request.getSession().getAttribute("utente") : null;
		if(utente != null) {
			List<PreferitiBean> preferiti = PreferitiDAO.getAllPreferitiOfUtente(utente.getEmail());
			int i = 0;
			for(PreferitiBean pb : preferiti) {
				i++;
				if(pb.getId() == codice) {
					break;
				}
			}
			if(i == preferiti.size() - 1 || preferiti.isEmpty()) {
				PreferitiDAO.addToPreferiti(new PreferitiBean(utente.getEmail(), codice));
				request.setAttribute("done", true);
			}
			else {
				request.setAttribute("alreadyInFav", true);
			}
		}
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
