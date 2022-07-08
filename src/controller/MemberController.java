package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import dao.MemberDao;
import dto.MemberDto;
import net.sf.json.JSONObject;

@WebServlet("/member")
public class MemberController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String param = req.getParameter("param");

		if (param.equals("login")) { // member?param=login
			resp.sendRedirect("member/login.jsp");
		} else if (param.equals("regi")) {
			resp.sendRedirect("member/regi.jsp");
		} else if (param.equals("logout")) {
			String msg = "logout";
			req.getSession().invalidate();
			resp.sendRedirect("message.jsp?msg=" + msg);

		} else if (param.equals("withdraw")) {
			resp.sendRedirect("member/withdraw.jsp");
		} else if (param.equals("idcheck")) {
			String id = req.getParameter("id");
			System.out.println("id:" + id);

			MemberDao dao = MemberDao.getInstance();
			boolean b = dao.getId(id);

			String str = "NO";
			if (b == false) {
				str = "YES";
			}

			// 보내는 JSONObject : regi.jsp 에서 받는 Json
			JSONObject obj = new JSONObject();
			obj.put("msg", str); // 짐싸!

			resp.setContentType("application/x-json; charset=utf-8");
			resp.getWriter().print(obj);
		} else if (param.equals("regiAf")) {

			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");

			MemberDao dao = MemberDao.getInstance();
			boolean b = dao.addMember(new MemberDto(id, pwd, name, email, phone, 0));

			String msg = "regiOK";
			if (!b) {
				msg = "regiNO";
			}
			System.out.println(msg);
			resp.sendRedirect("message.jsp?msg=" + msg);
		} else if (param.equals("loginAf")) {

			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");

			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = dao.login(new MemberDto(id, pwd, null, null, null, 0));

			String msg = "";

			if (dto != null) { // 로그인 성공
				req.getSession().setAttribute("login", dto);
				msg = "loginOK";
				// System.out.println(req.getSession().getId());
				// resp.sendRedirect("index.jsp");
			} else { // 그런 회원 없음
				msg = "loginNO";

			}
			resp.sendRedirect("message.jsp?msg=" + msg);

		} else if (param.equals("withdrawAf")) {
			String msg = "withdrawOK";
			req.getSession().invalidate();

			// 진짜 탈퇴할꺼면 비번 누르고 탈퇴 승인
			String pwd = req.getParameter("pwd");

			MemberDao dao = MemberDao.getInstance();
			Boolean isTrue = dao.withdraw(new MemberDto(null, pwd, null, null, null, 0)); // 비번 일치 여부 check

			if (!isTrue) { // 회원탈퇴 실패
				msg = "withdrawNO";
			}

			resp.sendRedirect("message.jsp?msg=" + msg);
			
		} else if (param.equals("mypage")) {
			String id = req.getParameter("id");

			resp.sendRedirect("member/mypage.jsp?id=" + id);
		}

	}
}
