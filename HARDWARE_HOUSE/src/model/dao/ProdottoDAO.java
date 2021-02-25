package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection;
import model.bean.ProdottoBean;

public class ProdottoDAO {
	public static List<ProdottoBean> getResultList(String partial) {
		List<ProdottoBean> toReturn = new ArrayList<ProdottoBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM prodotto WHERE nome LIKE ? AND email_moderatore IS NOT NULL AND email_acquirente IS NULL;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,  "%" + partial + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				toReturn.add(new ProdottoBean(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
			return toReturn;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}
	
	public static List<ProdottoBean> getResultByCategory(String category) {
		List<ProdottoBean> toReturn = new ArrayList<ProdottoBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM prodotto WHERE categoria = ? AND email_moderatore IS NOT NULL AND email_acquirente IS NULL;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				toReturn.add(new ProdottoBean(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
			return toReturn;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}

	public static void saveProduct(String nome, String descrizione, String img_path, double prezzo, String categoria, String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "INSERT INTO prodotto(nome, descrizione, img_path, prezzo, categoria, email_venditore) values (?, ?, ?, ?, ?, ?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, nome);
			ps.setString(2, descrizione);
			ps.setString(3, img_path);
			ps.setDouble(4, prezzo);
			ps.setString(5, categoria);
			ps.setString(6, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		
	}

	public static ProdottoBean getProductByID(int codice) {
		ProdottoBean toReturn = null;
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM prodotto WHERE codice = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, codice);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				toReturn = new ProdottoBean(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}
			return toReturn;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}
	
	public static List<ProdottoBean> getAll() {
		List<ProdottoBean> toReturn = new ArrayList<ProdottoBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM prodotto;";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				toReturn.add(new ProdottoBean(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
			return toReturn;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}
	
	public static List<ProdottoBean> getProductsToApprove() {
		List<ProdottoBean> toReturn = new ArrayList<ProdottoBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM prodotto WHERE email_moderatore IS NULL;";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				toReturn.add(new ProdottoBean(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
			return toReturn;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}
	
	public static List<ProdottoBean> getProdottiInVendita() {
		List<ProdottoBean> toReturn = new ArrayList<ProdottoBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM prodotto WHERE email_moderatore IS NOT NULL AND email_acquirente IS NULL;";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				toReturn.add(new ProdottoBean(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
			return toReturn;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}

	public static void approve(int codice, String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE prodotto SET email_moderatore = ? WHERE codice = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setInt(2, codice);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}

	public static void reject(int codice) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "DELETE FROM prodotto WHERE codice = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, codice);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}

	public static void buy(ProdottoBean pb, String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE prodotto SET email_acquirente = ? WHERE codice = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setInt(2, pb.getCodice());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}
	
	public static List<ProdottoBean> getBoughtProducts() {
		List<ProdottoBean> toReturn = new ArrayList<ProdottoBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM prodotto WHERE email_moderatore IS NOT NULL AND email_acquirente IS NOT NULL;";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				toReturn.add(new ProdottoBean(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), 
						rs.getDouble(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9)));
			}
			return toReturn;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}

	public static void archiveOrder(int codice) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "DELETE FROM prodotto WHERE codice = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, codice);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}

	public static void deleteOrder(int codice) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE prodotto SET email_acquirente = NULL WHERE codice = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, codice);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}
}
