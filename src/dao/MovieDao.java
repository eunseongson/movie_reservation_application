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
		String sql=" INSERT INTO MOVIE(title,reservation,img,rdate,readcount) "
				+ " values(?,?,?,?,0) on duplicate key update reservation = ? ";
		
	
		
		try {
			conn=DBConnection.getConnection();
			for(MovieDto d:list) {
				
				psmt=conn.prepareStatement(sql);
				psmt.setString(1,d.getTitle());
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
	
	public List<MovieDto> SelectTopFive(){
		String sql=" select * from movie order by reservation desc limit 5";
		List<MovieDto>list=new ArrayList<>();
		try {
			conn=DBConnection.getConnection();
			psmt=conn.prepareStatement(sql);
			rs=psmt.executeQuery();
		
			while(rs.next()) {
				MovieDto dto=new MovieDto(rs.getString(2),rs.getDouble(3),rs.getString(4),rs.getString(5));
				list.add(dto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
}
