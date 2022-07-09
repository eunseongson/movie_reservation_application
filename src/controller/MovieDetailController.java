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
	public void crawlingMovieDetail(String url, MovieDetailDao mdDao, MovieStillcutDao msDao, ReviewDao rDao) throws Exception {
		Document doc = Jsoup.connect(url).get();
		String movie = null, author = null, actor = null, genre = null, age_limit = null, running_time = null,
				country = null, movie_description = null, movie_descriptionTitle = null, previous_expectations = null,
				real_review = null;
		List<String> update_detail = new ArrayList<String>();
		List<String> still_cut = new ArrayList<String>();
		List<ReviewDto> review_content = new ArrayList<ReviewDto>();

		// 감독, 배우
		String AA = "div.spec dl dd a";
		Elements AAs = doc.select(AA);
		author = AAs.get(0).text();
		actor = "";
		int index = -1;
		for (Element e : AAs) {
			index++;
			if (index == 0)
				continue;
			actor += AAs.get(index).text() + ", ";
		}
		actor = actor.substring(0, actor.lastIndexOf(", "));
		update_detail.add(actor);

		// 장르,
		String genreDir = "div.spec dl dt";
		Elements genres = doc.select(genreDir);
		Element gen = genres.get(2);
		String modiGenre = gen.text().replace("장르 : ", "");
		genre = modiGenre;
		update_detail.add(modiGenre);

		// 나이제한, 상영시간, 나라
		String specDir = "div.spec dl dd.on";
		Elements specs = doc.select(specDir);
		Element spec = specs.get(1);
		String[] results = spec.text().split(", ");
		age_limit = results[0];
		running_time = results[1];
		country = results[2];
		update_detail.add(age_limit);
		update_detail.add(running_time);
		update_detail.add(country);

		// 영화 설명 제목
		String movieDescriptionTitle = "div.sect-story-movie strong";
		Elements movieDescriptionTitles = doc.select(movieDescriptionTitle);
		String title = "";
		for (int i = 0; i < movieDescriptionTitles.size(); i++) {
			title = movieDescriptionTitles.get(i).text();
			movie_descriptionTitle = title;
			update_detail.add(title);
		}

		// 영화 설명
		String movieDescription = "div.sect-story-movie";
		Elements movieDescriptions = doc.select(movieDescription);
		for (int i = 0; i < movieDescriptions.size(); i++) {
			String description = movieDescriptions.get(i).html();
			description = description.replace(title, "").trim();
			movie_description = description;
			update_detail.add(description);
		}

		// 대기

//		String sexDistribution = "div.chart";
//		Elements sexs = doc.select(sexDistribution);
//		Elements sex = doc.select("script");
//		System.out.println(sex.toString());

		// Elements sexValues =
		// sexs.select("span.jqplot-donut-series.jqplot-data-label");
//		Elements sexValues = doc.select("span.jqplot-donut-series");
//		System.out.println(sexs.toString());
//		for(int i=0;i<sexValues.size();i++) {
//			System.out.println("들어옴");
//			String sex = sexValues.get(i).text();
//			System.out.println(sex);
//		}

		// 대기
//		String ageDistribution = "span.jqplot-series-0";
//		Elements ages = doc.select(ageDistribution);
//		System.out.println(ages.toString());
//		for(int i=0;i<ages.size();i++) {
//			System.out.println("들어옴");
//			String age = ages.get(i).text();
//			System.out.println(age);
//		}

		// 사전기대지수
		String before = "div.rating div.box span.percent";
		Elements befores = doc.select(before);

		for (int i = 0; i < befores.size(); i++) {
			before = befores.get(i).text().replace("%", "");
			previous_expectations = before;
			update_detail.add(before);
		}

		// 실관람지수
		String real = "div.item-rating div.box_golden span.percent";
		Elements reals = doc.select(real);

		for (int i = 0; i < reals.size(); i++) {
			real = reals.get(i).text().replace("%", "");
			real_review = real;
			update_detail.add(real);
		}

		// 제목
		String tit = "div.title strong";
		Elements tt = doc.select(tit);
		update_detail.add(tt.get(0).text());

		// 스틸컷
		String img = "div.item-wrap div.item img";
		Elements imgs = doc.select(img);
		for (int i = 0; i < imgs.size(); i++) {
			String srcs = imgs.get(i).attr("data-src");
			still_cut.add(srcs);
		}
		
		//리뷰내용
		//String reviewTit = "div.box-contents ul.writerinfo li.writer-name";// a.commentMore
		String reviewCon = "div.box-comment";// p
		Elements reviews = doc.select(reviewCon);
		System.out.println("review 내용 : " + reviews.toString());
		
//		String reviewTit = "li.writer-name a.commentMore";
//		String reviewCon = "div.box-comment";
//		String reviewDate = "li.writer-etc span.day";
//		String[] reviewDir = {reviewTit, reviewCon, reviewDate}; 
//		for(int i=0;i<reviewDir.length;i++) {
//			Elements reviews = doc.select(reviewDir[i]);
//			System.out.println("reviews 길이 - " + reviews.size());
//			if(reviews.size()!=0)
//			System.out.println("reviews 내용 - " + reviews.get(0).text());
//			for (int j = 0; j < reviews.size(); j++) {
//				String sReview = reviews.get(0).text();
//				System.out.println("review 내용 : " + sReview);
//			}
//		}


		mdDao.addMovieDetail(update_detail);
		msDao.addMovieStillCut(still_cut, tt.get(0).text());
		//rDao.addReview(title);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
		MovieDetailDao mdDao = MovieDetailDao.getInstance();
		MovieStillcutDao msDao = MovieStillcutDao.getInstance();
		ReviewDao rDao = ReviewDao.getInstance();
		// 테스트
//		crawlingMovieDetail("http://www.cgv.co.kr/movies/detail-view/?midx=85999", mdDao, msDao, rDao);
		try {

			MovieDetailDao dao = MovieDetailDao.getInstance();
			String title = req.getParameter("title");
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
