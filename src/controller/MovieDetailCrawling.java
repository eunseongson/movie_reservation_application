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
				country = "없음", movie_description = "없음", movie_descriptionTitle = "없음", previous_expectations = "없음",
				real_review = "없음";
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
		String modiGenre = "없음";
		if(!genres.isEmpty()) {
			modiGenre = gen.text().replace("장르 : ", "");	
		}
		genre = modiGenre;
		
		update_detail.add(modiGenre);

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
		String title = "";
		//for (int i = 0; i < movieDescriptionTitles.size(); i++) {
		if(!movieDescriptionTitles.isEmpty()) {
			title = movieDescriptionTitles.get(0).text();
			movie_descriptionTitle = title;			
		}
			update_detail.add(title);
		//}

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
			if(before.equals("?")) {
				before = "0";
			}else {
				previous_expectations = before;	
			}
			update_detail.add(before);
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
			update_detail.add(real);
		}

		// 제목
		String tit = "div.title strong";
		Elements tt = doc.select(tit);
		String movieTitle = "없음";
		if(!tt.isEmpty()) {
			movieTitle = tt.get(0).text();
		}
		
		update_detail.add(movieTitle);

		// 스틸컷
		String img = "div.item-wrap div.item img";
		Elements imgs = doc.select(img);
		for (int i = 0; i < imgs.size(); i++) {
			String srcs = imgs.get(i).attr("data-src");
			still_cut.add(srcs);
		}
		
		//리뷰내용
		//String reviewTit = "div.box-contents ul.writerinfo li.writer-name";// a.commentMore
//		String reviewCon = "div.box-comment";// p
//		Elements reviews = doc.select(reviewCon);
//		System.out.println("review 내용 : " + reviews.toString());
		
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
		msDao.addMovieStillCut(still_cut, movieTitle);
		//rDao.addReview(title);
	}
}
