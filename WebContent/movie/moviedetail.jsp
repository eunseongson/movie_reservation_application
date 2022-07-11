<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MovieDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String title = (String) request.getAttribute("title");
String reservation = (String) request.getAttribute("reservation");
String img = (String) request.getAttribute("img");
String rdate = (String) request.getAttribute("rdate");
String readcount = (String) request.getAttribute("readcount");
String actor = (String) request.getAttribute("actor");
String author = (String) request.getAttribute("author");
String genre = (String) request.getAttribute("genre");
String ageLimit = (String) request.getAttribute("ageLimit");
String runningTime = (String) request.getAttribute("runningTime");
String country = (String) request.getAttribute("country");
String movieDescription = (String) request.getAttribute("movieDescription");
String movieDescriptionTitle = (String) request.getAttribute("movieDescriptionTitles");
String previousExpectations = (String) request.getAttribute("previousExpectations");
String realReview = (String) request.getAttribute("realReview");
List<String> stillCut = (List<String>) request.getAttribute("stillCut");
List<ReviewDto> reviews = (List<ReviewDto>) request.getAttribute("reviews");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/swipe.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/moviedetail.css">
<script src="https://kit.fontawesome.com/079869d0a6.js"
	crossorigin="anonymous"></script>
<link rel="icon" href="./favicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"
	integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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
						<div id="title"><%=title%></div>
						<div id="regipercent">
							<i class="fa-solid fa-egg"></i>예매율
							<%=reservation%>%
						</div>
						<div style="border-top: 2px solid #fff; margin: 10px 10px;"></div>
						<div id="detailList">
							<table>
								<tr>
									<td><i class="fa-solid fa-user-check icons"></i></td>
									<td>감독 : <%=author%></td>
								</tr>
								<tr>
									<td><i class="fa-solid fa-user-group icons"></i></td>
									<td>배우 : <%=actor%></td>
								</tr>
								<tr>
									<td><i class="fa-solid fa-chart-pie icons"></i></td>
									<td>장르 :
							<%=genre%></td>
								</tr>
								<tr>
									<td><i class="fa-solid fa-bookmark icons"></i></td>
									<td>기본 : <%=ageLimit%>, 119분, <%=country%></td>
								</tr>
								<tr>
									<td><i class="fa-regular fa-calendar-check icons"></i></td>
									<td>개봉 : <%=rdate%></td>
								</tr>
							</table>
						<%-- 	<i class="fa-solid fa-user-check icons"></i> 감독 :
							<%=author%><br> <i class="fa-solid fa-user-group icons"></i>
							배우 :
							<%=actor%><br> <i class="fa-solid fa-chart-pie icons"></i>
							장르 :
							<%=genre%>
							<br> <i class="fa-solid fa-bookmark icons"></i> 기본 :
							<%=ageLimit%>, 119분,
							<%=country%>
							<br> <i class="fa-regular fa-calendar-check icons"></i> 개봉 :
							<%=rdate%> --%>
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
		<div id="contentWrapper">
			<div id="contentBlock">
				<div class="title">"신을 죽이는 자, 신이 상대한다!"</div>
				<div id="content">
					<%=movieDescription%>
				</div>
				<div id="graphWrapper">
					<div id="lGraph">성별 예매 분포</div>
					<div id="rGraph">연령별 예매 분포</div>
				</div>
			</div>

			<div
				style="border-top: 2px solid #454545; margin-top: 100px; margin-bottom: 80px"></div>
		</div>

		<section class="notice">
			스틸컷
			<div class="promotion">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<%
						for (int i = 0; i < stillCut.size(); i++) {
						%>
						<div class="swiper-slide">
							<img id="slideimg" src="<%=stillCut.get(i)%>" alt="no_image">
						</div>
						<%
						}
						%>
					</div>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-prev">
					<div class="material-icons">arrow_back</div>
				</div>
				<div class="swiper-next">
					<div class="material-icons">arrow_forward</div>
				</div>
			</div>
		</section>

		<div id="reviewWrapper">
			<div style="border-top: 2px solid #454545; margin-bottom: 100px;"></div>
			<div class="title">
				<i class="fa-regular fa-face-smile"></i>실시간 후기
			</div>
			<table id="table">
				<%
				for (int i = 0; i < reviews.size(); i += 2) {
				%>
				<tr>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img
									alt="${pageContext.request.contextPath}/img/default_profile.gif"
									src="${pageContext.request.contextPath}/img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id">dmstjd3256</div>
										<div>2022.07.28</div>
									</div>
									<br>
									<%=reviews.get(i).getContent()%>
								</div>
							</div>
						</div>
					</td>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img
									alt="${pageContext.request.contextPath}/img/default_profile.gif"
									src="${pageContext.request.contextPath}/img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id"><%=reviews.get(i).getTitle()%></div>
										<div><%=reviews.get(i).getWdate()%></div>
									</div>
									<br>
									<%=reviews.get(i).getContent()%>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<%
				}
				%>
			</table>
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