package controller;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.jupiter.api.Test;

import dao.MovieDetailDao;
import dao.ReservationDao;
import db.DBClose;
import db.DBConnection;

class MovieDetailControllerTest {

//	@Before
//	void before() throws IOException {
//		
//	}
	
//	@Test
//	void test() throws IOException {
//		Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/detail-view/?midx=82120").get();
//		
//		String find = "div.cgvwrap div.container div.contents div.wrap-movie-detail";
//		String getDetail = "div.box-contents div.spec dd";
//		Elements test = doc.select(getDetail);// + getDetail);
//		String actor = test.get(2).text();
//		String[] actors = actor.split(",");
//		
//		actors[0].replace("<", "");
//		actors[actors.length - 1].replace(">", "");
//		
//		for (int i=0;i<actors.length;i++) {
//			actors[i] = actors[i].trim();
//		}
//		
//		assertEquals(actors[0], "톰 크루즈");
//	}
//	
//	@Test
//	void test() throws IOException {
//		MovieDetailDao dao = MovieDetailDao.getInstance();
//		dao.getMovieDetail(null);
//	}
	
//	@Test
//	void test() throws IOException {
//		MovieDetailDao dao = MovieDetailDao.getInstance();
//		Document doc = Jsoup.connect("http://www.cgv.co.kr/movies/detail-view/?midx=82120").get();
//		
////		String find = "div.cgvwrap div.container div.contents div.wrap-movie-detail ";
//		String movieDescription = "div.sect-story-movie ";
//		Elements test = doc.select(movieDescription);
//		assertEquals(test.get(0).text(), "");
//		
//		//String movieDescriptionTitle = "div.sect-story-movie strong";
//		//assertEquals(test.get(0).text(), "");
////		String img = "div.item-wrap div.item img";
////		
////		Elements test = doc.select(img);
////		assertEquals(test.attr("data-src"), "");
//		
//	}
	
	@Test
	void test() throws IOException {
		ReservationDao dao = ReservationDao.getInstance();
		
//		String movieTime = dao.getMovieTime(1, 1);
//		assertEquals(movieTime, "2022-07-10 07:30:00");
//		int movieSeq = dao.getMovieSeq("탑건-매버릭");
//		assertEquals(movieSeq, 5);
//		int locationSeq = dao.getLocationSeq("서울", "강동");
//		assertEquals(locationSeq, 3);
//		boolean reservationResult = dao.addReservation(4, "2022-07-10 07:30:00");
//		assertEquals(reservationResult, true);
//		boolean userReservationLocationResult = dao.addUserReservationLocation(1, 1, "test");
//		assertEquals(userReservationLocationResult, true);
		String sql =  "INSERT INTO location_movie(location_seq, movie_seq, movie_time) VALUES(?, ?, '2022-07-10 07:30:00')";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			// review 받아오기
			conn = DBConnection.getConnection();
			for (int i = 1; i <= 24; i++) {
				for (int j = 5; j <= 22; j++) {
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, i);
					psmt.setInt(2, j);
					psmt.executeUpdate();
					System.out.println(i + " " + j + "성공");
					psmt.clearParameters();
				}
			}
		} catch (SQLException e) {
			System.out.println("getMovieTime fail");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
	}
}
