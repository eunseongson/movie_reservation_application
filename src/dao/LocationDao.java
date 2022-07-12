package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class LocationDao {
	private static LocationDao dao = new LocationDao();

	private LocationDao() {
		DBConnection.initConnection();
	}

	public static LocationDao getInstance() {
		return dao;
	}

	// 크롤링 영화관 리스트 추가
	public boolean addRegion(String city, String city_detail) {

		String sql = " insert into location(city, city_detail) " + " values(?, ?) ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, city);
			psmt.setString(2, city_detail);

			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		return count > 0 ? true : false;
	}

	// 지역 받아오기
	public List<String> getRegionList() {
		String sql = " select distinct city " + "from location ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	// 영화관 받아오기
	public List<String> getTheaterList(String city) {
		String sql = " select city_detail " + "from location " + " where city = ? ";
		
		System.out.println(city + " : getTheaterList");
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, city);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	// 영화목록 받아오기
	public List<String> getTheaterMovie() {
		String sql = " select title from movie";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
	
	// 예매내역 추가
	public List<String> addReservation(String city, String city_detail, String title, String rdate, String id) {
		String sql = "  ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<String> list = new ArrayList<String>();

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
}
