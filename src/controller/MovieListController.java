package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dao.MovieListDao;
import dto.MovieDto;


@WebServlet("/Movielist")
public class MovieListController extends HttpServlet{
	MovieListDao dao = new MovieListDao();
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doProcess(req, resp);
   }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		
		String param = req.getParameter("param");
		
		if(param.equals("movielist")) {
			movieCommon(req, resp, 1);
			forward("movie/movielist.jsp",req,resp);
		}else if(param.equals("Schedule")) {
			movieCommon(req, resp, 2);
			forward("movie/ScheduleMovie.jsp",req,resp);
		}else if(param.equals("nowMovielist")) {
			movieCommon(req, resp, 3);
			forward("movie/movielist.jsp",req,resp);
		}else if(param.equals("sortMovielist")) {
			String division = (String) req.getParameter("division");
			int div = Integer.parseInt(division);
			movieCommon(req, resp, div);
			
			forward("movie/movielist.jsp",req,resp);
		}else if(param.equals("movieSe")) {
			String movieSearch = (String)req.getParameter("movieSearch");
		
			boolean check = dao.isExists(movieSearch);
			movieCommon(req, resp, 1);
			
			if(check) {
				MovieDto dto = dao.getObject(movieSearch);
				req.setAttribute("rowtitle", dto.getRowtitle());
				req.setAttribute("checking","success");
				System.out.println(dto.getRowtitle());
			}else {
				req.setAttribute("checking","fail");
			}
			
			forward("movie/movielist.jsp",req,resp);
		}
	}
	
	private void movieCommon(HttpServletRequest req, HttpServletResponse resp, int division) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 

        Calendar c1 = Calendar.getInstance();
        String today = sdf.format(c1.getTime());
        List<MovieDto> list = new ArrayList<>();
        
        //정렬처리
        if(req.getParameter("sort") != null) {
           String sort = (String) req.getParameter("sort");
           
         if(sort.equals("1")) {
             list = dao.getMovie(1);
         }else if(sort.equals("2")) {
             list = dao.getMovie(2);
         }else if(sort.equals("3")) {
             list = dao.getMovie(3);
         }
           req.setAttribute("sort",sort);
        }else {
        	list = dao.getMovie(1);
        	req.setAttribute("sort",1);
        }
      
        //영화 구분 처리
      if(division==1) {
         // 영화 전체
         req.setAttribute("movie",list);
         req.setAttribute("division",1);
      }else if(division==2) {
         // 상영 예정 영화
         List<MovieDto> uselist = new ArrayList<>();
             for(int i=0; i<list.size(); i++){
                if(Integer.parseInt(today) < Integer.parseInt(list.get(i).getRdate())){
                   uselist.add(list.get(i));
                }
             }
             req.setAttribute("movie",uselist);
             req.setAttribute("division",2);
      }else if(division==3) {
         // 현재 상영 영화
         List<MovieDto> uselist = new ArrayList<>();
             for(int i=0; i<list.size(); i++){
                if(Integer.parseInt(today) >= Integer.parseInt(list.get(i).getRdate())){
                   uselist.add(list.get(i));
                }
             }
             req.setAttribute("movie",uselist);
             req.setAttribute("division",3);
      }else {
         req.setAttribute("movie",list);
         req.setAttribute("division",1);
      }
   }

   private void forward(String arg, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      RequestDispatcher dispatch = req.getRequestDispatcher(arg);
      dispatch.forward(req, resp);
   }
}