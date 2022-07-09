package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MovieDto;

public class MovieDao {
	private static MovieDao dao=new MovieDao();
	public MovieDao() {
		DBConnection.initConnection();
	}
	public MovieDao getInstance() {
		return dao;
	}
	public void insertData(List<MovieDto> list) {
		String sql=" INSERT INTO MOVIE(title,reservation,img,rdate,readcount)"
				+ " select ?, ?, ?, ?, 0 "
				+" from dual"
				+ "where NOT EXISTS ( SELECT title,reservation,img,rdate,readcount from MOVIE where title = ? )";
		
		Connection conn=null;
		PreparedStatement psmt=null;
		
		try {
			conn=DBConnection.getConnection();
			for(MovieDto d:list) {
				
				psmt=conn.prepareStatement(sql);
				psmt.setString(1,d.getTitle());
				psmt.setDouble(2, d.getReservation());
				psmt.setString(3, d.getImg());
				psmt.setString(4, d.getRdate());
				psmt.setString(5, d.getTitle());
				psmt.executeUpdate();
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, null);
		}
		
	}
}
