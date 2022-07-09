package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import net.sf.json.JSONObject;
@WebServlet("/main")
public class MovieController extends HttpServlet{
	MovieDao dao=new MovieDao();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
		
	
		
	}
	 public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		 MovieCrawing.getData();
		 String param = req.getParameter("param");
		 if(param.equals("start")) {
			 resp.setContentType("application/x-json; charset=utf-8");
			 resp.sendRedirect("./main/main.jsp?param");
		 }
		 else if(param.equals("ajax")) {
			 JSONObject obj=new JSONObject();
			 obj.put("list", dao.SelectTopFive());
			 resp.setContentType("application/x-json; charset=utf-8");
			 resp.getWriter().print(obj);
		 }
	 }

}
