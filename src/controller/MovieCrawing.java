package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.google.gson.Gson;

import dao.MovieDao;
import dto.MovieDto;

public class MovieCrawing {

	public static void getData() {
		MovieDetailCrawling detail=new MovieDetailCrawling();
		MovieDao dao=new MovieDao();
		Document doc;
		String gson="";
		try {
			//무비차트
			doc=Jsoup.connect("http://www.cgv.co.kr/movies/?lt=1&ft=0").get();
			
			//Elements ranks=doc.select(".rank");
			Elements imgs=doc.select(".thumb-image > img");
			Elements movieTitles=doc.select("div.box-contents strong.title");
			Elements movieRates=doc.select(".percent span");//영화 예매율
			Elements movieOpenDates=doc.select(".txt-info strong");
			Elements a=doc.select("div.box-contents  a:first-child");
			
			//한글,숫자,영문,띄어쓰기 빼고 모든 특수문자 제거
			String match = "[^\uAC00-\uD7A30-9a-zA-Z]";

			List<MovieDto>list=new ArrayList<>();
			for(int i=0;i<movieTitles.size();i++) {
				String img=imgs.get(i).attr("src");
				String movieTitle=movieTitles.get(i).text();
				
				String rowTitle=movieTitles.get(i).text();
				rowTitle = rowTitle.replaceAll(match, "").replaceAll("-", "").replaceAll(" ", "");
				
				Double movieRate=Double.parseDouble(movieRates.get(i).text().replace("%",""));
				String movieOpenDate[]=movieOpenDates.get(i).text().split(" ");
				String open=movieOpenDate[0].replace(".", "");
				MovieDto cgv=new MovieDto(movieTitle,rowTitle,movieRate,img,open);
				list.add(cgv);
			}
			//상영예정작
			doc=Jsoup.connect("http://www.cgv.co.kr/movies/pre-movies.aspx").get();
			Elements imgs2=doc.select(".thumb-image > img");
			Elements movieTitles2=doc.select("div.box-contents strong.title");
			Elements movieRates2=doc.select(".percent span");//영화 예매율
			Elements movieOpenDates2=doc.select(".txt-info strong");

			Elements a2=doc.select("div.box-contents a:first-child");

			for(int i=0;i<movieTitles.size();i++) {
				String img=imgs2.get(i).attr("src");
				String movieTitle=movieTitles2.get(i).text();
				
				String rowTitle=movieTitles2.get(i).text();
				rowTitle = rowTitle.replaceAll(match, "").replaceAll("-", "").replaceAll(" ", "");
				
				Double movieRate=Double.parseDouble(movieRates2.get(i).text().replace("%",""));
				String movieOpenDate[]=movieOpenDates2.get(i).text().split(" ");
				String open=movieOpenDate[0].replace(".", "");
				MovieDto cgv=new MovieDto(movieTitle,rowTitle,movieRate,img,open);
				list.add(cgv);
			}
			
			for(MovieDto d:list) {
				System.out.println(d.toString());
			}
			
			dao.insertData(list);
			for(Element e:a) {
				String url=e.attr("href");

				if(url.substring(0,7).equals("/ticket"))
					continue;
				detail.crawlingMovieDetail("http://www.cgv.co.kr"+url);
			
			}
			for(Element e: a2) {
				String url=e.attr("href");
				if(url.substring(0,7).equals("/ticket"))
					continue;
				detail.crawlingMovieDetail("http://www.cgv.co.kr"+url);
				
			}
			gson=new Gson().toJson(list);
		}catch(IOException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}