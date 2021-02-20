package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnection;
import model.bean.UtentePrivatoBean;
import util.PasswordEncrypter;

public class UserDAO {

	public static String getPasswordByEmail(String email) {
		String toReturn = "";
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT utente.password FROM utente WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			if(rs.next()) 
				toReturn = rs.getString(1);
			else
				return null;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}		
		return toReturn;
	}

	public static String getTipoByEmail(String email) {
		String toReturn = "";
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT utente.tipo FROM utente WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			if(rs.next()) 
				toReturn = rs.getString(1);
			else
				return null;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}		
		return toReturn;
	}


	public static void setPasswordOfUser(String email, String password) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE utente SET password=? WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, password);
			ps.setString(2, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}

	public static void createUtente(UtentePrivatoBean utente, String password) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "INSERT INTO utente VALUES (?, ?, 'p');";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, utente.getEmail());
			ps.setString(2, PasswordEncrypter.encryptor(password));
			ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}

	public static void updatePassword(String password, String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "UPDATE utente SET password=? WHERE email=?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, PasswordEncrypter.encryptor(password));
			ps.setString(2, email);
			ps.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}
}
