<%@page import="dto.MemberDto"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MovieDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int result = 0;
System.out.println("result 결과는 " + request.getParameter("result"));
if(request.getParameter("result") != null) {
	result = Integer.parseInt(request.getParameter("result"));
}
String title = (String) request.getAttribute("title");
String rowtitle = (String) request.getAttribute("rowtitle");
String reservation = (String) request.getAttribute("reservation");
String img = (String) request.getAttribute("img");
String bPoster = (String) request.getAttribute("bPoster");
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Carousel -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="icon" href="<%=request.getContextPath()%>/favicon.png">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/079869d0a6.js"
	crossorigin="anonymous"></script>
<!-- Carousel -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/moviedetail.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">


<title>영화 상세보기</title>
</head>
<body>

	<jsp:include page="../main/header.jsp"></jsp:include>
	<div id="imageWrapper" style="background-image: url(<%=bPoster%>); background-repeat: no-repeat; background-size:cover;"></div>
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
									<td>장르 : <%=genre%></td>
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
						</div>
					</div>
					<div id="mlbottom"></div>
				</div>
				<div id="mainRight">
					<div id="poster">
						<img alt="" src="<%=img%>">
					</div>
					<div id="resvbtn">
						<input type="button" onclick="moveReservation('<%=rowtitle %>', '<%=img %>')" value="예매하기">
					</div>
				</div>
			</div>
		</div>
		<div id="contentWrapper">
			<div id="contentBlock">
				<div class="title"><%=title %></div>
				<div id="content">
					<%=movieDescription%>
				</div>
			</div>
			<div
				style="border-top: 2px solid #454545; margin-top: 100px; margin-bottom: 40px"></div>
		</div>

		<div id="slider">
			<div id="stillCut" class="carousel slide" data-ride="carousel">

				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<%
					for (int i = 1; i < stillCut.size(); i++) {
					%>
					<li data-target="#demo" data-slide-to="<%=i%>"></li>
					<%
					}
					%>
				</ul>
				
				<%
				if(stillCut.size() != 0) {
					%>
					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=stillCut.get(0)%>" alt="Chicago">
						</div>
					<%
				}
				%>

					<%
					for (int i = 1; i < stillCut.size(); i++) {
					%>
					<div class="carousel-item">
						<img src="<%=stillCut.get(i)%>" alt="Chicago">
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"></jsp:include>
	
	<script type="text/javascript">
		function moveReservation(rowtitle, img){
			location.href = "./movie/reservation.jsp?rowtitle=" + rowtitle + "&img=" + img + "";
		}
	</script>
	<%
	if(result == 1) {
	%>
		<script type="text/javascript">
		alert('예약 완료!');
		</script>		
	<%
	}else if(result == -1) {
	%>
		<script type="text/javascript">
		alert('예약 실패');
		</script>
	<%
	}
	%>
</body>
</html>