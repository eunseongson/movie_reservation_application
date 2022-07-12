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
#container {
	width: 1080px;
}

#movieChart_list {
	width: 100%;
}

.poster {
	width: 170.5px;
	margin: 0 20px;
}
</style>

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
						.append($('<a >').attr('href','${pageContext.request.contextPath}/movieDetail?rowtitle='+data.list[i].rowtitle)
						.append($('<img>').css('width','170.4px').css('height','240px').attr('src',data.list[i].img)))
						.append($('<div>')
						.append($('<span>').text("평점: "+data.list[i].reservation+"%").css('color','#fff')).append($('<br>')).append($('<strong>').text(data.list[i].title).css('color','#fff'))));
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
							.append($('<a >').attr('href','${pageContext.request.contextPath}/movieDetail?rowtitle='+data.list[i].rowtitle)
							.append($('<img>').css('width','170.4px').css('height','240px').attr('src',data.list[i].img)))
							.append($('<div>')
							.append($('<span>').text("평점: "+data.list[i].reservation+"%").css('color','#fff')).append($('<br>')).append($('<strong>').text(data.list[i].title).css('color','#fff'))));
						
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
							.append($('<a>').attr('href','${pageContext.request.contextPath}/movieDetail?rowtitle='+data.list[i].rowtitle)
							.append($('<img>').css('width','170.4px').css('height','240px').attr('src',data.list[i].img)))
							.append($('<div>')
							.append($('<span>').text("평점: "+data.list[i].reservation+"%").css('color','#fff')).append($('<br>')).append($('<strong>').text(data.list[i].title).css('color','#fff'))));
				}
			}
		})
	});
});

</script>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BIT BOX KOREA</title>

<link rel="icon" href="<%=request.getContextPath()%>/favicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/main.css">
</head>

<body
	style="background-image: url('../images/background.png'); background-size: cover;">

	<!-- HEADER -->
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div align="center" style="margin-top: 20px;">
		<div class="nav">
			<div class="contents" style="display: flex"></div>
		</div>
		<div id="container">
			<div class="contents">
				<div class="video_wrap">
					<video autoplay muted>
						<source
							src="https://adimg.cgv.co.kr/images/202206/Contorted/1080x608_contorted.mp4"
							type="video/mp4">
					</video>
				</div>

				<div style="margin-top: 10px">
					<div style="float: left;">
						<span class="mfchart" href="#none" id="mbtn1"
							style="text-decoration: none; font-size: 26px; color: red; cursor: pointer"
							onclick="movieChart()">무비차트</span> <span
							style="font-size: 26px; color: #fff">|</span> <span
							class="mfchart" href="#none" id="mbtn2"
							style="text-decoration: none; font-size: 26px; color: #fff; cursor: pointer"
							onclick="movieSoon()">상영예정작</span>
					</div>
					<div>
						<a id="btn_allView_Movie" class="btn_allView"
							href="<%=request.getContextPath()%>/Movielist?param=movielist">전체
							보기</a>
					</div>
					<br> <br>
					<div id="movieChart_list" style="display: flex"></div>
				</div>
			</div>

		</div>

	</div>
	<div>
		<!-- FOOTER -->
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		function movieChart() {
			document.getElementById('mbtn1').style.color = '#ff4f42';
			document.getElementById('mbtn2').style.color = 'white';
		}
		function movieSoon() {
			document.getElementById('mbtn2').style.color = '#ff4f42';
			document.getElementById('mbtn1').style.color = 'white';
		}
	</script>
</body>