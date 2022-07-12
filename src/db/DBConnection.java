package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static void initConnection() {		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			

		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		}		
	}
	
	public static Connection getConnection() {
		
		String url = "jdbc:mysql://localhost:3306/movie_reservation_db";
		String user = "root";
		String password = "1234";
		
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(url, user, password);
			
		} catch (SQLException e) {			 
			e.printStackTrace();
		}
		
		return conn;
	}
	
}





