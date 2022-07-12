package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import db.DBClose;
import db.DBConnection;


public class ReservationDao{
	private static ReservationDao dao = new ReservationDao();

	private ReservationDao() {
		DBConnection.initConnection();
	}

	public static ReservationDao getInstance() {
		return dao;
	}

	public int reservationStart(String city, String cityDetail, String rowtitle, String userId, String movieTime) {
		try {
		int movieSeq = getMovieSeq(rowtitle);
	
		int locationSeq = getLocationSeq(city, cityDetail);
	
		int reservationSeq = addReservation(movieSeq, movieTime);
		
		System.out.println(userId + " :reservationStart");
		addUserReservationLocation(reservationSeq, locationSeq, userId);
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
		return 1;
	}
	
	//예약하기위한 함수
	public int addReservation(int movieSeq, String movieTime) {
		String sql = "INSERT INTO reservation(movie_seq, wdate, rdate) VALUES(" + movieSeq + ", now(), '" + movieTime + "')";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		long count = 0;
		int reservationSeq = -1;
		try {
			conn = DBConnection.getConnection();
	
			psmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		
			count = psmt.executeUpdate();
			
			ResultSet rs = psmt.getGeneratedKeys();
			if (count > 0) {
				if(rs.next()) {
					reservationSeq = rs.getInt(1);
		
				}
			}
	
		} catch (SQLException e) {
			System.out.println("addReservation fail");

			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return reservationSeq;
	}
	
	public boolean addUserReservationLocation(int reservationSeq, int locationSeq, String userId) {
		boolean result = false;
		
		String sql = "INSERT INTO user_reservation_location(user_id, reservation_seq, location_seq) VALUES(?, ?, ?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		System.out.println(userId + " :addUserReservationLocation");
		try {
			conn = DBConnection.getConnection();
	
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, userId);
			psmt.setInt(2, reservationSeq);
			psmt.setInt(3, locationSeq);
		
			count = psmt.executeUpdate();
		
			if (count > 0) {
				result = true;
			}
		
		} catch (SQLException e) {
			System.out.println("addUserReservationLocation fail");

			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return result;
	}
	
	
	
	public int getLocationSeq(String city, String cityDetail) {
		int result = -1;
		String sql = "SELECT seq FROM location WHERE city = ? AND city_detail = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			// review 받아오기
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, city);
			psmt.setString(2, cityDetail);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getLocationSeq fail");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return result;
	}
	
	//위치seq가지고 그 영화의 영화시간 갖고오기 위한 함수
	public String getMovieTime(int locationSeq, int movieSeq) {
		String result = "";
		
		String sql =  "SELECT movie_time FROM location_movie WHERE location_seq = ? AND movie_seq = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			// review 받아오기
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, locationSeq);
			psmt.setInt(2, movieSeq);
			rs = psmt.executeQuery();	
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("getMovieTime fail");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		
		return result;
	}
	
	//movie_seq갖고오기 위한 함수
	public int getMovieSeq(String rowtitle) {
		int result = -1;
		String sql = "SELECT seq FROM movie WHERE rowtitle like '%"+ rowtitle +"%'";// city = ? AND
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			// review 받아오기
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("getLocationSeq fail");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return result;
	}
	
	public int getReservationSeq() {
		return -1;
	}
}
