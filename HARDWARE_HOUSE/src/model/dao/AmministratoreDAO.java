package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnection;
import model.bean.AmministratoreBean;

public class AmministratoreDAO {

	public static AmministratoreBean getAmministratoreByEmail(String email) {
		AmministratoreBean toReturn = null;
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM amministratore WHERE email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				toReturn = new AmministratoreBean(rs.getString(1));
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

	public static void createAmministratore(String email) {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "INSERT INTO amministratore VALUE(?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.releaseConnection(con);
		}
	}

}
