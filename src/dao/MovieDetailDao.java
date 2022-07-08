package dao;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MovieDetailDto;

public class MovieDetailDao {
	private static MovieDetailDao dao = new MovieDetailDao();
	
	private MovieDetailDao() {
		
	}
	
	public static MovieDetailDao getInstance() {
		return dao;
	}
	
	public boolean addMovieDetail(String title) {
		boolean result = false;
		String sql = "UPDATE MOVIE SET actor = ?, author = ?, genre = ?, age_limit = ?, country = ?, movie_description = ?, previous_expectations = ?, real_review = ?) "
				+ "WHERE title = " + title;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 addMovieDetail success");
			psmt = conn.prepareStatement(sql);
			
			//크롤링한 결과 주입
			//psmt.setString(1, "test");
			System.out.println("2/4 addMovieDetail success");
			count = psmt.executeUpdate();
			System.out.println("3/4 addMovieDetail success");
			if (count > 0) {
				result = true;
			}
			System.out.println("4/4 addMovieDetail success");
		} catch (SQLException e) {
			System.out.println("addMovieDetail fail");

			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return result;
	}
	
	public List<MovieDetailDto> getMovieDetail(String title) {
		List<MovieDetailDto> list = new ArrayList<MovieDetailDto>();

		String sql = "SELECT * FROM movie WHERE seq = (SELECT seq FROM movie WHERE title = ?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 getMovieDetail success");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "test");
			System.out.println("2/4 getMovieDetail success");
			rs = psmt.executeQuery();
			System.out.println("3/4 getMovieDetail success");
			while (rs.next()) {
				MovieDetailDto dto = new MovieDetailDto(rs.getString(2), 
														rs.getInt(3),
														rs.getString(4), 
														rs.getString(5), 
														rs.getInt(6),
														rs.getString(7), 
														rs.getString(8), 
														rs.getString(9), 
														rs.getString(10), 
														rs.getString(11),
														rs.getString(12),
														rs.getInt(13),
														rs.getInt(14)
														);
				list.add(dto);
			}

			System.out.println("4/4 getMovieDetail success");
		} catch (SQLException e) {
			System.out.println("getMovieDetail fail");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		return list;
	}
}
