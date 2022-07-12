<%@page import="dto.MemberDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.LocationDao"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.MovieDetailDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
Object obj = session.getAttribute("login");
MemberDto mem = null;
if(obj == null){
	%>
	<script>
	alert('로그인 해 주십시오');
	location.href = "../member/login.jsp";
	</script>
	<%
}

mem = (MemberDto)obj;
%>

<%
LocationDao dao = LocationDao.getInstance();
String rowtitle = request.getParameter("rowtitle");
String img = request.getParameter("img");
List<String> region = dao.getRegionList();
List<String> theater = dao.getTheaterList("서울특별시");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/reservation.css">

<link rel="icon" href="<%=request.getContextPath()%>/favicon.png">
<title>예매하기</title>
</head>
<body>
	<div id="container">
		<div id="mainWrapper">
			<div id="mainBlock">
				<div id="mainLeft">
					<div id="mltop">
						<div id="title">영화 예매하기</div>
						<div style="border-top: 2px solid gray; margin: 10px 0;"></div>
					</div>
					<div class="date"></div>
					<div id="selectList">
						<div class="list-group">
							<h5>지역</h5>
							<div class="list">
								<%
								for (int i = 0; i < region.size(); i++) {
								%>
								<div
									class="list-group-item list-group-item-action list-group-item-light selectList"
									id="<%=region.get(i)%>"
									onclick="selectRegion('<%=region.get(i)%>')"><%=region.get(i)%></div>
								<%
								}
								%>
							</div>
						</div>
						<div class="list-group">
							<h5>상영관</h5>
							<div class="list" id="theaterlist">
								<div class="defaultTheater">지역을 선택해주세요</div>
							</div>
						</div>
						<div class="list-group">
							<h5>요일</h5>
							<% 
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
							Calendar c1 = Calendar.getInstance();
							String strToday = sdf.format(c1.getTime());
							%>
							<input type="date" id="selectDate" min=<%=strToday %>>
						</div>
					</div>
				</div>
				<div id="mainRight">
					<div id="poster">
						<img alt="" src="<%=img%>">
					</div>
					<div id="resvbtn">
						<input type="button" value="예매하기" onclick="reservationBtn()">
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		let nowRegion = -1;
		let nowTheater = -1;
		function selectRegion(region) {
			nowTheater = -1; // 선택 지역영화관 초기화
			// css 컬러 변경
			if (nowRegion != region) {
				if (nowRegion != -1) {
					document.getElementById(nowRegion).style.backgroundColor = '#fdfdfe';
					document.getElementById(nowRegion).style.color = '#818182';
				}
				document.getElementById(region).style.backgroundColor = 'rgb(245, 161, 66)';
				document.getElementById(region).style.color = 'rgb(255, 255, 255)';
				nowRegion = region
			}
			console.log(region)
			$.ajax({
				url : "../location?param=city&region=" + region,
				type : "get",
				datatype : "json",
				success : function(data) {
					let theater = data.theater
					$("#theaterlist").empty();
					for (let i = 0; i < theater.length; i++) {
						const element = document.createElement('div');
						element.classList.add('list-group-item',
								'list-group-item-action',
								'list-group-item-light', 'selectList');
						element.id = theater[i];
						element.onclick = function() {
							selectTheater(theater[i]);
						}
						element.innerHTML = theater[i];
						$('#theaterlist').append(element)
					}
				},
				error : function() {
					alert('error');
				}
			})
		}
		function selectTheater(seq) {
			if (nowTheater != seq) {
				if (nowTheater != -1) {
					document.getElementById(nowTheater).style.backgroundColor = '#fdfdfe';
					document.getElementById(nowTheater).style.color = '#818182';
				}
				document.getElementById(seq).style.backgroundColor = 'rgb(245, 161, 66)';
				document.getElementById(seq).style.color = 'rgb(255, 255, 255)';
				nowTheater = seq
			}
		}

		function reservationBtn() {
			let nowDate = document.getElementById('selectDate').value;
			location.href="../reservation?city=" + nowRegion + "&cityDetail=" + nowTheater + "&rowtitle=<%=rowtitle%>" + "&movieTime=" + nowDate;
		}
	</script>
</body>
</html>