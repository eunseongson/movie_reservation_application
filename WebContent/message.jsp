<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String msg = request.getParameter("msg");
%>    

<%
// GET 방식인데 doProcess라서 뭘로 보내든 상관없음
if(msg.equals("regiOK")){
	%>
	<script type="text/javascript">
	alert("회원가입 되었습니다");
//	location.href = "./member?param=login";
	location.href = "./main/main.jsp";
	</script>
	<%
}else if(msg.equals("regiNO")){
	%>
	<script type="text/javascript">
	alert("가입되지 않았습니다. 다시 작성해 주십시오");
	location.href = "./member?param=regi";
	</script>
	<%
}else if(msg.equals("loginOK")){
	%>
	<script type="text/javascript">
	
	location.href = "./main/main.jsp";
	</script>
	<%
}else if(msg.equals("loginNO")){
	%>
	<script type="text/javascript">
	alert("로그인 실패했습니다.");
	location.href = "./member?param=login";
	</script>
	<%
}else if(msg.equals("logout")){
	%>
	<script type="text/javascript">
	alert("로그아웃되었습니다.");
	location.href = "./main/main.jsp";
	</script>
	<%
}else if(msg.equals("withdrawOK")){
	String withdrawId = request.getParameter("withdrawId");
	%>
	<script type="text/javascript">
	alert(withdrawId + "회원님 탈퇴 되었습니다.");
	location.href = "./main/main.jsp";
	</script>
	<%
}else if(msg.equals("withdrawNO")){
	%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않아 회원탈퇴에 실패하였습니다");
	location.href = "./member?param=withdraw";
	</script>
	<%
}else if(msg.equals("findidOK")){
	String id = ((MemberDto)session.getAttribute("isUser")).getId();
	%>
	<script type="text/javascript">
	alert("아이디를 찾았습니다. id값은 " + id + " 입니다");
	location.href = "./member?param=login";
	</script>
	<%
}else if(msg.equals("findidNO")){
	%>
	<script type="text/javascript">
	alert("회원정보가 존재하지 않습니다.");
	location.href = "./member/findid.jsp";
	</script>
	<%
}else if(msg.equals("findpwOK")){
	String id = ((MemberDto)session.getAttribute("isUser")).getId();
	String pwd = ((MemberDto)session.getAttribute("isUser")).getPwd();
	%>
	<script type="text/javascript">
	alert("비밀번호를 찾았습니다." + id + "님의 비밀번호는 " + pwd + " 입니다");
	location.href = "./member?param=login";
	</script>
	<%
}else if(msg.equals("findpwNO")){
	%>
	<script type="text/javascript">
	alert("회원정보가 존재하지 않습니다.");
	location.href = "./member/findpw.jsp";
	</script>
	<%
}
%>



