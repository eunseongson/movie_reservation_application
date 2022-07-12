package controller;


import javax.servlet.RequestDispatcher;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dao.MovieDetailDao;
import dao.MovieStillcutDao;
import dao.ReviewDao;
import dto.MovieDetailDto;
import dto.MovieDto;
import dto.ReviewDto;
import net.sf.json.JSONObject;

@WebServlet("/movieDetail")
public class MovieDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {

		// 테스트
//		crawlingMovieDetail("http://www.cgv.co.kr/movies/detail-view/?midx=85999", mdDao, msDao, rDao);
		try {
			
			MovieDetailDao dao = MovieDetailDao.getInstance();
			String rowTitle = req.getParameter("rowtitle");
			MovieDetailDto dto = dao.getMovieDetail(rowTitle);
			
			System.out.println(dto.getTitle());
			System.out.println(dto.getRowTitle());
			System.out.println(dto.getReservation());
			System.out.println(dto.getImg());
			System.out.println(dto.getBackgroundPoster());
			System.out.println(dto.getRdate());
			System.out.println(dto.getReadcount());
			System.out.println(dto.getActor());
			System.out.println(dto.getAuthor());
			System.out.println(dto.getGenre());
			System.out.println(dto.getAge_limit());
			System.out.println(dto.getRunning_time());
			System.out.println(dto.getCountry());
			System.out.println(dto.getMovie_description());
			System.out.println(dto.getMovie_description_title());
			System.out.println(dto.getPrevious_expectations());
			System.out.println(dto.getReal_review());
			System.out.println(dto.getStill_cut());
			System.out.println(dto.getReviews());
			
			req.setAttribute("title", dto.getTitle());
			req.setAttribute("rowtitle", dto.getRowTitle());
			req.setAttribute("reservation", dto.getReservation());
			req.setAttribute("img", dto.getImg());
			req.setAttribute("bPoster", dto.getBackgroundPoster());			
			req.setAttribute("rdate", dto.getRdate());
			req.setAttribute("readcount", dto.getReadcount());
			req.setAttribute("actor", dto.getActor());
			req.setAttribute("author", dto.getAuthor());
			req.setAttribute("genre", dto.getGenre());
			req.setAttribute("ageLimit", dto.getAge_limit());
			req.setAttribute("runningTime", dto.getRunning_time());
			req.setAttribute("country", dto.getCountry());
			req.setAttribute("movieDescription", dto.getMovie_description());
			req.setAttribute("movieDescriptionTitle", dto.getMovie_description_title());
			req.setAttribute("previousExpectations", dto.getPrevious_expectations());
			req.setAttribute("realReview", dto.getReal_review());
			req.setAttribute("stillCut", dto.getStill_cut());
			req.setAttribute("reviews", dto.getReviews());

			RequestDispatcher requestDispatcher = req.getRequestDispatcher("/movie/moviedetail.jsp");
			requestDispatcher.forward(req, resp);


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
