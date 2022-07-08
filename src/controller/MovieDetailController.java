package controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import dao.MovieDetailDao;
import net.sf.json.JSONObject;

@WebServlet("/movieDetail")
public class MovieDetailController extends HttpServlet {
	public JSONObject getMovieDetail() {
		JSONObject result = new JSONObject();
		//result.put(result, result)
		
		
		return result;
	}
	
	public void crawlingMovieDetail(String url) throws Exception {
		Document doc = Jsoup.connect(url).get();
		
		String find = "div.cgvwrap div.container div.contents div.wrap-movie-detail ";
		String getDetail = "div.sect-base-movie div.box-contents div.spec ";
		
		Elements test = doc.select(find + getDetail);
		
		for(int i=0;i<test.size();i++) {
			System.out.println(test.text());
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			MovieDetailDao dao = MovieDetailDao.getInstance();
			//crawlingMovieDetail("http://www.cgv.co.kr/movies/detail-view/?midx=82120");
			//test 더미데이터
			dao.getMovieDetail("test");
			//moviedetail.jsp
			resp.sendRedirect("moviedetail.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
