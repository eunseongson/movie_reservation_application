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
		MovieDao dao=new MovieDao();
		Document doc;
		String gson="";
		try {
			doc=Jsoup.connect("http://www.cgv.co.kr/movies/?lt=1&ft=0").get();
			
			//Elements ranks=doc.select(".rank");
			Elements imgs=doc.select(".thumb-image > img");
			Elements movieTitles=doc.select("div.box-contents strong.title");
			Elements movieRates=doc.select(".percent span");//영화 예매율
			Elements movieOpenDates=doc.select(".txt-info strong");
			Elements a=doc.select("div.box-contents a");
			for(Element e:a) {
				String aa=e.attr("href");
				System.out.println(aa);
			}
		
			List<MovieDto>list=new ArrayList<>();
			for(int i=0;i<movieTitles.size();i++) {
				String img=imgs.get(i).attr("src");
				String movieTitle=movieTitles.get(i).text();
				Double movieRate=Double.parseDouble(movieRates.get(i).text().replace("%",""));
				String movieOpenDate[]=movieOpenDates.get(i).text().split(" ");
				String open=movieOpenDate[0].replace(".", "");
				MovieDto cgv=new MovieDto(movieTitle,movieRate,img,open);
				list.add(cgv);
			}
			for(MovieDto d:list) {
				System.out.println(d.toString());
			}
			dao.insertData(list);
			gson=new Gson().toJson(list);
		}catch(IOException e) {
			e.printStackTrace();
		}
	
	}

	
}
