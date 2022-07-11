package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import dao.LocationDao;
import net.sf.json.JSONObject;

@WebServlet("/location")
public class LocationController extends HttpServlet {

	public void crawlingList() throws IOException {
		Document doc = Jsoup.connect("https://ko.wikipedia.org/wiki/%EB%A1%AF%EB%8D%B0%EC%8B%9C%EB%84%A4%EB%A7%88")
				.get();

		LocationDao dao = LocationDao.getInstance();
		// 요소
		Elements region = doc.select("tr td");

		List<String> regionList = new ArrayList<String>();
		List<String> theaterList = new ArrayList<String>();

		for (int i = 2; i < 47; i++) {
			if (i % 3 == 0)
				continue;
			if (i % 3 == 1) {
				region.get(i).text().replace("/", "");
				theaterList.add(region.get(i).text().replace(" ", ""));
			}
			if (i % 3 == 2) {
				regionList.add(region.get(i).text());
			}
		}

		StringTokenizer st;

		for (int i = 0; i < regionList.size(); i++) {
		
			st = new StringTokenizer(theaterList.get(i), "/");
			while (st.hasMoreTokens()) {
				dao.addRegion(regionList.get(i), st.nextToken());
			}
		
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		 // crawlingList(); // 지역, 영화관 정보 받아오기
		
		  String params = req.getParameter("param"); LocationDao ldao =
		  LocationDao.getInstance(); if(params.equals("city")) { String region =
		  req.getParameter("region");
		  
		  
		  List<String> theater = ldao.getTheaterList(region);
		  
		  JSONObject obj = new JSONObject(); obj.put("theater", theater);
		  
		  

		  resp.setContentType("application/x-json; charset=utf-8");
		  resp.getWriter().print(obj); }else if(params.equals("theater")) {
		  
		  }
		 
	}
}
