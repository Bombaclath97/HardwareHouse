package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection;
import model.bean.UtentePrivatoBean;

public class UtentePrivatoDAO {
	public static UtentePrivatoBean getUtenteByEmail(String email) {
		UtentePrivatoBean toReturn = null;
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM privato WHERE email=?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				toReturn = new UtentePrivatoBean(rs.getString(1), rs.getString(3), 
						rs.getString(4), rs.getDate(2).toLocalDate());
			}
			else
				return null;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;		
	}

	public static void updateNome(String nome, String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE privato SET nome=? WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, nome);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}		
	}

	public static void updateCognome(String cognome, String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE privato SET cognome=? WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, cognome);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}		
	}

	public static void updateCompleanno(LocalDate compleanno, String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE privato SET data_nascita=? WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setDate(1, Date.valueOf(compleanno));
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}		
	}

	public static void createUtentePrivato(UtentePrivatoBean utente, String password) {
		UserDAO.createUtente(utente, password);
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "INSERT INTO privato VALUES (?, ?, ?, ?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, utente.getEmail());
			ps.setDate(2, Date.valueOf(utente.getCompleanno()));
			ps.setString(3, utente.getNome());
			ps.setString(4, utente.getCognome());
			int i = ps.executeUpdate();
			if (i != 0)
				System.out.println("Done!");
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		
	}
	public static List<UtentePrivatoBean> getAllUser() {
		List<UtentePrivatoBean> toReturn = new ArrayList<UtentePrivatoBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM privato;";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				 UtentePrivatoBean toAdd = new UtentePrivatoBean(rs.getString(1), rs.getString(3), rs.getString(4), 
						 LocalDate.parse(rs.getDate(2).toString()));
				 toReturn.add(toAdd);
			}
			return toReturn;
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
		return toReturn;
	}
}
