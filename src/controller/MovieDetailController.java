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
			String title = req.getParameter("title");
			//TODO +가 url에서 무시됨. 해결방안
			title = title.replace("%20", " ");
			MovieDetailDto dto = dao.getMovieDetail(title);
			req.setAttribute("title", dto.getTitle());
			req.setAttribute("reservation", dto.getReservation());
			req.setAttribute("img", dto.getImg());
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
