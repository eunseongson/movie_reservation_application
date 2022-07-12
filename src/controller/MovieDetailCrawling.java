package controller;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dao.MovieDetailDao;
import dao.MovieStillcutDao;
import dao.ReviewDao;
import dto.ReviewDto;

public class MovieDetailCrawling {
	public void crawlingMovieDetail(String url) throws Exception {
	
		MovieDetailDao mdDao = MovieDetailDao.getInstance();
		MovieStillcutDao msDao = MovieStillcutDao.getInstance();
		ReviewDao rDao = ReviewDao.getInstance();
		Document doc = Jsoup.connect(url).get();
		String movie = "없음", author = "없음", actor = "없음", genre = "없음", age_limit = "없음", running_time = "없음",
				country = "없음", movie_description = "없음", movie_descriptionTitle = "없음", previous_expectations = "0",
				real_review = "0";
		List<String> update_detail = new ArrayList<String>();
		List<String> still_cut = new ArrayList<String>();
		List<ReviewDto> review_content = new ArrayList<ReviewDto>();

		// 감독, 배우
		String AA = "div.spec dl dd a";
		Elements AAs = doc.select(AA);
		
		if(!AAs.isEmpty()) {
			author = AAs.get(0).text() + "";
		}else {
			author = "없음";
		}
	
		actor = "없음";
		int index = -1;
		for (Element e : AAs) {
			index++;
			if (index == 0)
				continue;
			actor = "";
			actor += AAs.get(index).text() + ", ";
		}
		if(!actor.equals("없음")) {
			actor = actor.substring(0, actor.lastIndexOf(", "));
		}
		update_detail.add(actor);
		update_detail.add(author);

		// 장르,
		String genreDir = "div.spec dl dt";
		Elements genres = doc.select(genreDir);
		Element gen = genres.get(2);
		if(!genres.isEmpty()) {
			genre = gen.text().replace("장르 : ", "");	
		}
		update_detail.add(genre);

		// 나이제한, 상영시간, 나라
		String specDir = "div.spec dl dd.on";
		Elements specs = doc.select(specDir);
		if(!specs.isEmpty()) {
			Element spec = specs.get(1);
			String[] results = spec.text().split(", ");
			
			if(results.length == 1) {
				age_limit = "없음";
				running_time = "없음";
				country = "없음";
			}else if(results.length == 2){
				country = "없음";
			}else {
				age_limit = results[0];
				running_time = results[1];
				country = results[2];	
			}
		}else {
			age_limit = "없음";
			running_time = "없음";
			country = "없음";
		}
		
		update_detail.add(age_limit);
		update_detail.add(running_time);
		update_detail.add(country);

		// 영화 설명 제목
		String movieDescriptionTitle = "div.sect-story-movie strong";
		Elements movieDescriptionTitles = doc.select(movieDescriptionTitle);
		if(!movieDescriptionTitles.isEmpty()) {
			movie_descriptionTitle = movieDescriptionTitles.get(0).text();
		}
			update_detail.add(movie_descriptionTitle);

		// 영화 설명
		String movieDescription = "div.sect-story-movie";
		Elements movieDescriptions = doc.select(movieDescription);
		for (int i = 0; i < movieDescriptions.size(); i++) {
			movie_description = movieDescriptions.get(i).html();
			movie_description = movie_description.replace(movie_descriptionTitle, "").trim();
			update_detail.add(movie_description);
		}


		// 사전기대지수
		String before = "div.rating div.box span.percent";
		Elements befores = doc.select(before);

		for (int i = 0; i < befores.size(); i++) {
			before = befores.get(i).text().replace("%", "");
			if(before.equals("?")) {
				before = "0";
			}else {
				previous_expectations = before;	
			}
			update_detail.add(previous_expectations);
		}

		// 실관람지수
		String real = "div.item-rating div.box_golden span.percent";
		Elements reals = doc.select(real);
		
		for (int i = 0; i < reals.size(); i++) {
			real = reals.get(i).text().replace("%", "");
			if(real.equals("?")) {
				real = "0";
			}else {
				real_review = real;	
			}
			update_detail.add(real_review);
		}

		// 제목
		String tit = "div.title strong";
		Elements tt = doc.select(tit);
		if(!tt.isEmpty()) {
			movie = tt.get(0).text();
		}
		
		update_detail.add(movie);

		// 스틸컷
		String img = "div.item-wrap div.item img";
		Elements imgs = doc.select(img);
		for (int i = 0; i < imgs.size(); i++) {
			String srcs = imgs.get(i).attr("data-src");
			still_cut.add(srcs);
		}

		mdDao.addMovieDetail(update_detail);
		msDao.addMovieStillCut(still_cut, movie);
		//rDao.addReview(title);
	}
}
