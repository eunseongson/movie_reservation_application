package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class MovieStillcutDao {
	private static MovieStillcutDao dao = new MovieStillcutDao();
	
	private MovieStillcutDao() {
		DBConnection.initConnection();
	}
	
	public static MovieStillcutDao getInstance() {
		return dao;
	}
	
	public boolean addMovieStillCut(List<String> list, String title) {
		String sql = "INSERT INTO movie_stillcut(movie_seq, movie_still_img) VALUES (?, ?)";
		int seq = getMovieSeq(title);
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			
			for(int i=0;i<list.size();i++) {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, seq);	
				psmt.setString(2, list.get(i));
				count += psmt.executeUpdate();
				psmt.clearParameters();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}

		return count > 0 ? true : false;
	}
	
	public int getMovieSeq(String title) {
		String sql = "SELECT seq FROM movie WHERE title = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		int result = -1;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbslist success");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, title);
			System.out.println("2/4 getBbslist success");
			rs = psmt.executeQuery();
			System.out.println("3/4 getBbslist success");
			if (rs.next()) {
				result = rs.getInt(1);
			}
			System.out.println("4/4 getBbslist success");
		} catch (SQLException e) {
			System.out.println("getBbslist fail");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return result;
	}
}
