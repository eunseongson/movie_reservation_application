<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MovieDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/reservation.css">

<!-- SWIPER -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<h1>${dto.getTitle()}</h1>

	<div id="container">
		<div id="mainWrapper">
			<div id="mainBlock">
				<div id="mainLeft">
					<div id="mltop">
						<div id="title"></div>
						<div style="border-top: 2px solid #fff; margin: 10px 10px;"></div>
						<div id="regipercent">
						</div>
					</div>
					<div id="mlbottom"></div>
				</div>
				<div id="mainRight">
					<div id="poster"></div>
					<div id="resvbtn">
						<input type="button" value="예매하기">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- swipe-script -->
	<script type="text/javascript">
		// new Swiper(선택자, 옵션)
		new Swiper('.promotion .swiper-container', {
			slidesPerView : 3,
			spaceBetween : 10,
			centeredSlides : true,
			loop : true,
			autoplay : {
				delay : 3000,
			},
			pagination : {
				el : '.promotion .swiper-pagination', // 페이지 번호 요소 선택자
				clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부
			},
			navigation : {
				prevEl : '.promotion .swiper-prev',
				nextEl : '.promotion .swiper-next',
			},
		})
	</script>
</body>
</html>