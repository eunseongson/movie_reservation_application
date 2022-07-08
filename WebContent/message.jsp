<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String msg = request.getParameter("msg");
%>    

<%
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
	alert("로그인 되었습니다.");
	location.href = "./main/main.jsp";		// GET 방식인데 doProcess라서 뭘로 보내든 상관없음
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
	%>
	<script type="text/javascript">
	alert("회원탈퇴 되었습니다.");
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
}
%>



