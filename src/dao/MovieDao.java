package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
		String sql=" INSERT INTO MOVIE(title,reservation,img,rdate,readcount) "
	            + " values(?,?,?,?,0) on duplicate key update reservation = ? ";

		Connection conn=null;
		PreparedStatement psmt=null;
		
		try {
			conn=DBConnection.getConnection();
			for(MovieDto d:list) {
				
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, d.getTitle());
				psmt.setDouble(2, d.getReservation());
				psmt.setString(3, d.getImg());
				psmt.setString(4, d.getRdate());
				psmt.setDouble(5, d.getReservation());
				psmt.executeUpdate();
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, null);
		}
		
	}
	
	public List<MovieDto> getMovie(int division) {
		
		String sql = " select title, reservation, img, rdate "
				   + " from movie ";
		String order = "";
		if(division == 1) {
			order = " order by reservation desc ";
		}else if(division == 3) {
			order = " order by rdate asc ";
		}else {
			order = " order by title asc ";
		}
		
		sql += order;
				   
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<MovieDto> list = new ArrayList<MovieDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getMovie success");
				
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getMovie success");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getMovie success");
			
			while(rs.next()) {
				MovieDto dto = new MovieDto(rs.getString(1), 
										rs.getDouble(2), 
										rs.getString(3), 
										rs.getString(4));
				
				list.add(dto);
			}
			System.out.println("4/4 getBbslist success");
			
		} catch (SQLException e) {
			System.out.println("getMovie fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
}
