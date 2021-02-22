package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.DBConnection;
import model.bean.PreferitiBean;

public class PreferitiDAO {

	public static List<PreferitiBean> getAllPreferitiOfUtente(String email) {
		List<PreferitiBean> toReturn = new ArrayList<PreferitiBean>();
		Connection con = null;
		try {
			con = DBConnection.getConnection();
			String query = "SELECT * FROM preferiti WHERE email_utente = ?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1,  email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				toReturn.add(new PreferitiBean(rs.getString(1), rs.getInt(2)));
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
