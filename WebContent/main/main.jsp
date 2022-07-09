<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<%
// 메인페이지라서 우측 상단에 회원가입, 로그인 버튼이 존재
// 로그인 되어있으면 로그인, 회원가입 버튼 숨김 + "..."님 마이페이지(링크)
// 로그인 되어있지 않으면 로그아웃, 
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
.newp {
	float: right;
	margin: auto;
	padding: 10px;
}


</style>


<%-- <%
if(session.getAttribute("login") == null){
%>
<a class = "newp" id = "login" href="<%=request.getContextPath() %>/member?param=login">로그인</a>
<a  class = "newp" id = "regi" href="<%=request.getContextPath() %>/member?param=regi">회원가입</a>
<%
}else{
	
	MemberDto dto = (MemberDto)session.getAttribute("login");
%>
<%=dto.getId() %> 님의
<a  class = "newp" id = "mypage" href="<%=request.getContextPath() %>/member/mypage.jsp">마이페이지</a>
<a  class = "newp" id = "logout" href="<%=request.getContextPath() %>/member?param=logout">로그아웃</a>
<a  class = "newp" id = "withdraw" href="<%=request.getContextPath() %>/member?param=withdraw">회원탈퇴</a>
<% 
}
%> --%>

<script type="text/javascript">
$(function(){
	$('#mbtn1').click(function(){
		$.ajax({
			url:"../main?param=ajax",
			type:"get",
			datatype:'json',
			error:function(xhr,status,msg){
				alert(xhr+"상태값 :"+status+"http에러메세지: "+msg)
			},
			success:function(data){
				alert(data.list[0].title);
				console.log(data.list.length);
				
			for(let i=0;i<data.list.length;i++){
					/*
					$("<div>")
					.append((('<img>').attr('src',list[i].img))
					.appendTo('#movieChart_list');
					*/
					
					$("#movieChart_list").append($("<div>")
							.append($('<img>').attr('src',data.list[i].img)));
				}
	
				
			}
		})
	});
});
</script>

<body>
<div>
	<div class="contents">
		<video autoplay muted>
			<source src="https://adimg.cgv.co.kr/images/202206/Contorted/1080x608_contorted.mp4" type="video/mp4">
		</video>
		
	</div>
</div>
<div>
	<div><button id="mbtn1">무비차트</button> | <button id="mbtn2" onclick="mfchartbtn()">상영예정작</button></div>
	<div id="movieChart_list" style="display:block;">
		
	</div>
</div>
</body>
