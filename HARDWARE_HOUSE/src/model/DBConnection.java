package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.TimeZone;

public class DBConnection {
	private static List<Connection> freeDbConnections;

	static {
		freeDbConnections = new LinkedList<Connection>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
	}

	private static Connection createConnection() throws SQLException {
		Connection newConnection = null;
		String ip = "localhost";
		String port = "3306";
		String db = "hardwarehouse";
		String username = "root";
		String password = "password";

		newConnection = DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ port+ "/"+ db + 
				"?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=" + 
				TimeZone.getDefault().getID(), username, password);
		newConnection.setAutoCommit(true);
		return newConnection;
	}

	public static synchronized Connection getConnection() throws SQLException {
		Connection con;

		if(!freeDbConnections.isEmpty()) {
			con = freeDbConnections.remove(0);

			try {
				if (con.isClosed())
					con = getConnection();
			} catch (SQLException e) {
				con.close();
				con = getConnection();
			}
		} else {
			con = createConnection();
		}
		
		return con;
	}
	
	public static synchronized void releaseConnection(Connection connection) {
		if(connection != null) 
			freeDbConnections.add(connection);
	}
}
