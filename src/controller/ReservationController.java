package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import dto.MemberDto;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		ReservationDao dao = ReservationDao.getInstance();
		
		String city = req.getParameter("city");
		String cityDetail = req.getParameter("cityDetail");
		String rowtitle = req.getParameter("rowtitle");
		String movieTime = req.getParameter("movieTime");
		
		HttpSession session = req.getSession();
		MemberDto dto =(MemberDto)session.getAttribute("login");
		String userId = dto.getId();
		int result = dao.reservationStart(city, cityDetail, rowtitle, userId, movieTime);
		
		resp.sendRedirect("./movieDetail?rowtitle=" + URLEncoder.encode(rowtitle) + "&result=" + result);
	}
}
