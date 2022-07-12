package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.MovieDetailDto;
import dto.MovieDto;
import dto.ReviewDto;

public class MovieDetailDao {
	private static MovieDetailDao dao = new MovieDetailDao();

	private MovieDetailDao() {
		DBConnection.initConnection();
	}

	public static MovieDetailDao getInstance() {
		return dao;
	}

	public boolean addMovieDetail(List<String> update_detail) {

		boolean result = false;
		String sql = "UPDATE MOVIE SET actor = ?, author = ?, genre = ?, "
				+ "age_limit = ?, running_time = ?, country = ?, "
				+ "movie_description_title = ?, movie_description = ?, "
				+ "previous_expectations = ?, real_review = ? "
				+ "WHERE title = ?";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();

			psmt = conn.prepareStatement(sql);

			for (int i = 0; i < update_detail.size() - 3; i++) {
				psmt.setString(i + 1, update_detail.get(i));
			}
			psmt.setInt(9, Integer.parseInt(update_detail.get(8)));
			psmt.setInt(10, Integer.parseInt(update_detail.get(9)));
			psmt.setString(11, update_detail.get(10));

			count = psmt.executeUpdate();

			if (count > 0) {
				result = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}

		return result;
	}

	public MovieDetailDto getMovieDetail(String rowTitle) {
		MovieDetailDto dto = null;

		String sql = "SELECT * FROM movie WHERE rowtitle like '%" + rowTitle + "%'";
		String sql1 = "SELECT * FROM review WHERE movie_seq = (SELECT seq FROM movie WHERE rowtitle = ?)";
		String sql2 = "SELECT movie_still_img FROM movie_stillcut WHERE movie_seq = (SELECT seq FROM movie WHERE rowtitle = ?)";
		System.out.println(sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		PreparedStatement psmt1 = null;
		ResultSet rs1 = null;
		PreparedStatement psmt2 = null;
		ResultSet rs2 = null;

		List<String> movie_still_img = new ArrayList<String>();
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();

		try {
			// review 받아오기
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, rowTitle);
			rs = psmt.executeQuery();
			while (rs.next()) {
				ReviewDto review = new ReviewDto(rs.getString(3), rs.getString(4), rs.getString(5));
				reviews.add(review);
			}

			// movie_still_img 받아오기
			psmt1 = conn.prepareStatement(sql2);
			psmt1.setString(1, rowTitle);
			rs1 = psmt1.executeQuery();
			while (rs1.next()) {
				String imgurl = rs1.getString(1);
				movie_still_img.add(imgurl);
			}

			// moviedetail 불러오기
			psmt2 = conn.prepareStatement(sql);
			// psmt2.setString(1, rowTitle);
			rs2 = psmt2.executeQuery();
			if (rs2.next()) {
				dto = new MovieDetailDto(rs2.getString(2), rs2.getString(3), rs2.getString(4), rs2.getString(5),
						rs2.getString(18), rs2.getString(6), rs2.getString(7), rs2.getString(8), rs2.getString(9),
						rs2.getString(10), rs2.getString(11), rs2.getString(12), rs2.getString(13), rs2.getString(14),
						rs2.getString(15), rs2.getString(16), rs2.getString(17), movie_still_img, reviews);
			}
		} catch (SQLException e) {
			System.out.println("getMovieDetail fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
			DBClose.close(null, psmt1, rs1);
			DBClose.close(null, psmt2, rs2);
		}
		return dto;
	}
}
