package control;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.bean.User;
import model.dao.ProdottoDAO;

/**
 * Servlet implementation class VenditaProdottiServlet
 */
@WebServlet(urlPatterns = {"/vendita"},
initParams = {@WebInitParam(name = "save-file", value = "assets/media/prodotti")})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
maxFileSize = 1024 * 1024 * 10)
public class VenditaProdottiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String SAVE_DIR = "";

	public void init() {
		SAVE_DIR = getServletConfig().getInitParameter("save-file");
	}
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VenditaProdottiServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User utente = (User) request.getSession().getAttribute("utente");
		String savePath = request.getServletContext().getRealPath("") + File.separator + SAVE_DIR;
		String nome, descrizione, categoria, img_path;
		double prezzo;
		nome = request.getParameter("nome");
		descrizione = request.getParameter("descrizione");
		categoria = request.getParameter("categoria");
		prezzo = Double.parseDouble(request.getParameter("prezzo"));
		img_path = request.getPart("img").getSubmittedFileName();
		Part img = request.getPart("img");
		img.write(savePath + File.separator + img_path);
		img_path = img_path.substring(0, img_path.length() - 4);
		ProdottoDAO.saveProduct(nome, descrizione, img_path, prezzo, categoria, utente.getEmail());
		request.setAttribute("venduto", "ok");
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
