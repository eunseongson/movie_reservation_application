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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/reservation.css">

<title>Insert title here</title>
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
								for (int i = 0; i < 20; i++) {
								%>
								<div
									class="list-group-item list-group-item-action list-group-item-light selectList"
									id="region<%=i%>" onclick="selectRegion(<%=i%>)">서울특별시</div>
								<%
								}
								%>
							</div>
						</div>
						<div class="list-group">
							<h5>상영관</h5>
							<div class="list">
								<%
								for (int i = 0; i < 20; i++) {
								%>
								<div
									class="list-group-item list-group-item-action list-group-item-light selectList"
									id="theater<%=i%>" onclick="selectTheater(<%=i%>)">용산</div>
								<%
								}
								%>
							</div>
						</div>
						<div class="list-group">
							<h5>요일</h5>
							<input type="date">
						</div>
					</div>
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

	<script type="text/javascript">
		let nowRegion = -1;
		let nowTheater = -1;
		function selectRegion(seq) {
			if(nowRegion != seq){
				if(nowRegion!=-1){
					document.getElementById("region"+nowRegion).style.backgroundColor = '#fdfdfe';
					document.getElementById("region"+nowRegion).style.color = '#818182';
				}
				document.getElementById("region"+seq).style.backgroundColor = 'rgb(245, 161, 66)';
				document.getElementById("region"+seq).style.color = 'rgb(255, 255, 255)';
				nowRegion = seq
			}
		}
		function selectTheater(seq) {
			if(nowTheater != seq){
				if(nowTheater!=-1){
					document.getElementById("theater"+nowTheater).style.backgroundColor = '#fdfdfe';
					document.getElementById("theater"+nowTheater).style.color = '#818182';
				}
				document.getElementById("theater"+seq).style.backgroundColor = 'rgb(245, 161, 66)';
				document.getElementById("theater"+seq).style.color = 'rgb(255, 255, 255)';
				nowRegion = seq
			}
			const element = document.getElementById("theater"+seq);
			element.style.backgroundColor = 'rgb(245, 161, 66)';
			element.style.color = 'rgb(255, 255, 255)';
			console.log(seq);
		}
		
		/* 			$.ajax({
		url : "downup?seq=" + seq,
		type: "get",
		datatype: "json",
		success : function(data){ // 갓솔지, 갓진광 ,갓지훈,은성!
			console.log(data.msg);
			$('#id'+seq).text(data.msg);
		},
		error: function(){
			alert('error');
		}
	}) */
	</script>
</body>
</html>