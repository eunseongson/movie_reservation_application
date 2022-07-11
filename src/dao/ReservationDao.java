package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;
import dto.ReviewDto;



//insert 이후에 executeUpdate 사용.
public class ReservationDao {
	private static ReservationDao dao = new ReservationDao();

	private ReservationDao() {
		DBConnection.initConnection();
	}

	public static ReservationDao getInstance() {
		return dao;
	}
	
	//예약하기위한 함수
	public boolean addReservation(String city, String cityDetail, String title, String date) {
		boolean result = false;
		
		int locationSeq = getLocationSeq(city, cityDetail);
		int movieSeq = getMovieSeq(title);
		String movieTime = getMovieTime(locationSeq, movieSeq);
		
		String sql = "INSERT INTO reservation(movie_seq, wdate, rdate) VALUES(?, now(), ?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 addReservation success");
			psmt = conn.prepareStatement(sql);

			psmt.setInt(1, movieSeq);
			psmt.setString(2, movieTime);
			
			// 크롤링한 결과 주입
			// psmt.setString(1, "test");

			System.out.println("2/4 addReservation success");
			count = psmt.executeUpdate();
			System.out.println("3/4 addReservation success");
			if (count > 0) {
				result = true;
			}
			System.out.println("4/4 addReservation success");
		} catch (SQLException e) {
			System.out.println("addReservation fail");

			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		//user_reservation_location user_id, reservation_seq, location_seq(city, citydetail로 갖고오기)
		//location_movie의 값을 갖고와서   location_seq, movie_seq, movie_time의 movie_time빼와서 위의 rdate로 넣기
		boolean res1 = addUserReservation(user_id, reservation_seq, locationSeq);

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
		return result!=-1?result:null;
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
	public int getMovieSeq(String title) {
		int result = -1;
		String sql = "SELECT seq FROM movie WHERE city = ? AND title = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			// review 받아오기
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
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
		return result!=-1?result:null;
	}
}
