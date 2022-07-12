package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

		if (param.equals("login")) {
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
			} else { 			// 로그인 실패
				msg = "loginNO";

			}
			resp.sendRedirect("message.jsp?msg=" + msg);

		} else if (param.equals("withdrawAf")) {
			
			String msg = "withdrawNO";
			MemberDto dto = (MemberDto)req.getSession().getAttribute("login");
			String withdrawId = dto.getId();
			
		

			// 진짜 탈퇴할꺼면 비번 누르고 탈퇴 승인
			String pwd = req.getParameter("pwd");

			MemberDao dao = MemberDao.getInstance();
			Boolean isTrue = dao.withdraw(new MemberDto(withdrawId, pwd, null, null, null, 0)); // 비번 일치 여부 check

			JSONObject obj = new JSONObject();
			
		
			if (isTrue) { // 회원탈퇴 성공
				msg = "withdrawOK";
				req.getSession().invalidate();
				obj.put("id", withdrawId);
			}

			obj.put("msg", msg); // 짐싸!
			
			// resp 는 withdraw.jsp Ajax 로 전송
			resp.setContentType("application/x-json; charset=utf-8");
			resp.getWriter().print(obj);
			

			// resp.sendRedirect("message.jsp?msg=" + msg);

			
		} else if (param.equals("mypage")) {
			resp.sendRedirect("member/mypage.jsp");
			
		} else if (param.equals("mypageInfo")) {
			resp.sendRedirect("member/mypageInfo.jsp");
			
		} else if (param.equals("mypageReserve")) {
			resp.sendRedirect("member/mypageReserve.jsp");
			
		}
		else if(param.equals("findidAf")) {
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");

			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = dao.findid(new MemberDto(null, null, name, email, null, 0));

			//String msg = "";
			String str = "";

			if (dto != null) { // 회원 id 있음
				// url (get) 으로 안넘기고 post 로 param 여러개 넘기는 방법은 이거 또는 flashAttribute 뿐
				// resp.getSession().setAttribute("isUser", dto);
				// msg = "findidOK";
				
				str = "YES";
			} else { 			// 회원 id 없음
				// msg = "findidNO";
				str = "NO";
			}
			// resp.sendRedirect("message.jsp?msg=" + msg);
			

			// 보내는 JSONObject : findid.jsp 에서 받는 Json
			JSONObject obj = new JSONObject();
			obj.put("msg", str); // 짐싸!
			obj.put("name", name);
			if(dto != null) {
				obj.put("id", dto.getId());
			}

			resp.setContentType("application/x-json; charset=utf-8");
			resp.getWriter().print(obj);

			
		} else if(param.equals("findpwAf")) {
			String msg = "findpwOK";

			String id = req.getParameter("id");
			String email = req.getParameter("email");
			String pw = "";
			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = dao.findpw(new MemberDto(id, null, null, email, null, 0));
			
			//String msg = "";
			String str = "";

			if (dto != null) { // 회원 있음
				str = "YES";
			} else { 			// 회원 없음
				str = "NO";
			}
			
			// 보내는 JSONObject : findpw.jsp 에서 받는 Json
			JSONObject obj = new JSONObject();
			obj.put("msg", str); // 짐싸!
			if(dto != null) {
				obj.put("id", dto.getId());
				obj.put("pwd", dto.getPwd());
			}

			resp.setContentType("application/x-json; charset=utf-8");
			resp.getWriter().print(obj);

		}
	}
}
