package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MovieDto;

public class MovieListDao {
	static Connection conn=null;
	static PreparedStatement psmt=null;
	static ResultSet rs=null;
	private static MovieListDao dao = new MovieListDao();
	
	public MovieListDao () {
		DBConnection.initConnection();
	}
	
	public MovieListDao getInstance() {
		return dao;
	}
	
	public List<MovieDto> getMovie(int division) {
		
		String sql = " select title, rowtitle, reservation, img, rdate "
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
			
				
			psmt = conn.prepareStatement(sql);
		
			
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				MovieDto dto = new MovieDto(rs.getString(1),
										rs.getString(2),
										rs.getDouble(3), 
										rs.getString(4), 
										rs.getString(5));
				
				list.add(dto);
			}
		
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
	
	public boolean isExists(String movieSearch) {
		
		String sql = " select count(*) "
				   + " from movie where rowtitle like '%" + movieSearch + "%' limit 1 " ;
				   
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
	
				
			psmt = conn.prepareStatement(sql);
			
			
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				count = Integer.parseInt(rs.getString(1));
			}
			
		
			
		} catch (SQLException e) {
			System.out.println("getMovie fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return count>0?true:false;
	}
	
	public MovieDto getObject(String movieSearch) {
		
		String sql = " select title, rowtitle, reservation, img, rdate "
				   + " from movie where rowtitle like '%" + movieSearch + "%' limit 1 " ;
				   
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		MovieDto dto = null;
		
		try {
			conn = DBConnection.getConnection();
	
				
			psmt = conn.prepareStatement(sql);
		
			
			rs = psmt.executeQuery();
		
			
			if(rs.next()) {
				dto = new MovieDto(rs.getString(1),
										rs.getString(2),
										rs.getDouble(3), 
										rs.getString(4), 
										rs.getString(5));
			}
			
		
			
		} catch (SQLException e) {
			System.out.println("getMovie fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return dto;
	}
}
