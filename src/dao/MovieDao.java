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

public class MovieDao {
	static Connection conn=null;
	static PreparedStatement psmt=null;
	static ResultSet rs=null;
	private static MovieDao dao=new MovieDao();
	
	public MovieDao() {
		DBConnection.initConnection();
	}
	
	public MovieDao getInstance() {
		return dao;
	}
	
	public void insertData(List<MovieDto> list) {
		String sql=" INSERT INTO MOVIE(title,rowtitle,reservation,img,rdate,readcount) "
				+ " values(?,?,?,?,?,0) on duplicate key update reservation = ? ";
	
		Connection conn=null;
		PreparedStatement psmt=null;

		
		try {
			conn=DBConnection.getConnection();
			for(MovieDto d:list) {
				
				psmt=conn.prepareStatement(sql);
				psmt.setString(1, d.getTitle());
				psmt.setString(2, d.getRowtitle());
				psmt.setDouble(3, d.getReservation());
				psmt.setString(4, d.getImg());
				psmt.setString(5, d.getRdate());
				psmt.setDouble(6, d.getReservation());
				psmt.executeUpdate();
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, null);
		}
	}
	
	public List<MovieDto> SelectTopFive(){
		String sql=" select * from movie order by reservation desc limit 5";
		List<MovieDto>list=new ArrayList<>();
		try {
			conn=DBConnection.getConnection();
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
		
			while(rs.next()) {
				MovieDto dto=new MovieDto(rs.getString(2), rs.getString(3),rs.getDouble(4),rs.getString(5),rs.getString(6));
				list.add(dto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	public List<MovieDto> SelectFutureTopFive(){
		String sql=" select * from movie where rdate>now() order by reservation desc limit 5";
		List<MovieDto>list=new ArrayList<>();
		try {
			conn=DBConnection.getConnection();
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
		
			while(rs.next()) {
				MovieDto dto=new MovieDto(rs.getString(2),rs.getString(3),rs.getDouble(4),rs.getString(5),rs.getString(6));
				list.add(dto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
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
