package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReservationDao;
import dto.MemberDto;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReservationDao dao = ReservationDao.getInstance();
		
		String city = req.getParameter("city");
		String cityDetail = req.getParameter("citydetail");
		String title = req.getParameter("title");
		String movieTime = req.getParameter("movieTime");
		//연결 안되어 있으니 임의값 넣기
		//MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
		//String userId = dto.getId();
		String userId = "test";
		
		boolean result = dao.reservationStart(city, cityDetail, title, userId, movieTime);
	}
}
