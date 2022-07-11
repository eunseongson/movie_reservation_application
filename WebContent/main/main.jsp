<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<%
// 메인페이지라서 우측 상단에 회원가입, 로그인 버튼이 존재
// 로그인 되어있으면 로그인, 회원가입 버튼 숨김 + "..."님 마이페이지(링크)
// 로그인 되어있지 않으면 로그아웃, 
%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
#container{
	width: 1080px;
}
#movieChart_list{
	width: 100%;
}

.poster{
	width: 170.5px;
	margin: 0 20px;
}

</style>


<%
if(session.getAttribute("login") == null){
%>
<div align="right">

<a class="newp" id="login"
	href="<%=request.getContextPath() %>/member?param=login">로그인</a>
<a class="newp" id="regi"
	href="<%=request.getContextPath() %>/member?param=regi">회원가입</a>
<%
}else{
	
	MemberDto dto = (MemberDto)session.getAttribute("login");
%>
	<%=dto.getId() %>
	님의 <a class="newp" id="mypage"
		href="<%=request.getContextPath() %>/member/mypage.jsp">마이페이지</a> <a
		class="newp" id="logout"
		href="<%=request.getContextPath() %>/member?param=logout">로그아웃</a> <a
		class="newp" id="withdraw"
		href="<%=request.getContextPath() %>/member?param=withdraw">회원탈퇴</a>
</div>
<% 
}

</script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"../main?param=ajax",
		type:"get",
		datatype:'json',
		error:function(xhr,status,msg){
			alert(xhr+"상태값 :"+status+"http에러메세지: "+msg)
		},
		success:function(data){
		
			
			$("#movieChart_list").empty();
			for(let i=0;i<data.list.length;i++){
				
				$("#movieChart_list").append($("<div class='poster'>")
						.append($('<a >').attr('href','${pageContext.request.contextPath}/movieDetail?title='+data.list[i].title)
						.append($('<img>').css('width','170.4px').css('height','240px').attr('src',data.list[i].img)))
						.append($('<div>').append($('<strong>').text(data.list[i].title))
						.append($('<span>').text(data.list[i].reservation))));
					}	
				

			}
	})
	$('#mbtn1').click(function(){
		$.ajax({
			url:"../main?param=ajaxchart",
			type:"get",
			datatype:'json',
			error:function(xhr,status,msg){
				alert(xhr+"상태값 :"+status+"http에러메세지: "+msg)
			},
			success:function(data){
				$("#movieChart_list").empty();
				for(let i=0;i<data.list.length;i++){
					
				
				
					$("#movieChart_list").append($("<div class='poster'>")
							.append($('<a >').attr('href','${pageContext.request.contextPath}/movieDetail?title='+data.list[i].title)
							.append($('<img>').css('width','170.4px').css('height','240px').attr('src',data.list[i].img)))
							.append($('<div>').append($('<strong>').text(data.list[i].title))
							.append($('<span>').text(data.list[i].reservation))));
						
				}

				}
		})
	});
				
	$('#mbtn2').click(function(){
		$.ajax({
			url:"../main?param=ajaxmchart",
			type:"get",
			datatype:'json',
			error:function(xhr,status,msg){
				alert(xhr+"상태값 :"+status+"http에러메세지: "+msg)
			},
			success:function(data){
				$("#movieChart_list").empty();
				for(let i=0;i<data.list.length;i++){
					

				
					$("#movieChart_list").append($("<div class='poster'>")
							.append($('<a>').attr('href','/movieDetail?title='+data.list[i].title)
							.append($('<img>').css('width','170.4px').css('height','240px').attr('src',data.list[i].img)))
							.append($('<div>').append($('<strong>').text(data.list[i].title))
							.append($('<span>').text(data.list[i].reservation))));
						
				}
			}
		})
	});
	
});
</script>

<body>
<!-- HEADER -->
<jsp:include page="../main/header.jsp"></jsp:include>
<div align="center" style="margin-top:20px ;">
	<div class="nav" >
    	<div class="contents" style="display: flex">
        	
	    </div>
	</div>
	<div id="container">
		<div class="contents">
			<div class="video_wrap" >
				<video autoplay muted>
					<source src="https://adimg.cgv.co.kr/images/202206/Contorted/1080x608_contorted.mp4" type="video/mp4">
				</video>
			</div>
			
			<div style="margin-top: 10px">
				<div style="float:left;"><a href="#none" id="mbtn1" style="text-decoration: none;font-size: 26px;">무비차트</a>  <a href="#none" id="mbtn2" style="text-decoration: none;font-size: 26px;">| 상영예정작</a>
				</div>
				<div><a href="<%=request.getContextPath() %>/Movielist?param=movielist" >전체 보기</a></div>
				<br><br>
				<div id="movieChart_list" style="display: flex"></div>
			</div>
		</div>
	
	</div>
	
</div>
<div>
		 <!-- FOOTER -->
			<jsp:include page="../main/footer.jsp"></jsp:include>  
	</div>
</body>

