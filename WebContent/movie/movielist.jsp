<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="dto.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
List<MovieDto> list = (List) request.getAttribute("movie");
String division = String.valueOf(request.getAttribute("division"));
String sort = String.valueOf(request.getAttribute("sort"));
String checking = String.valueOf(request.getAttribute("checking"));
String rowtitle = String.valueOf(request.getAttribute("rowtitle"));

if (checking.equals("fail")) {
%>
<script>
	alert("해당 영화가 없습니다.");
</script>
<%
}else if(checking.equals("success")){
%>
<script>
location.href = "movieDetail?rowtitle="+ "<%=rowtitle %>";
</script>
<%	
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="wScheduleidth=device-width, initial-scale=1.0">
<title>무비 차트</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="icon" href="<%=request.getContextPath() %>/favicon.png">

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/movielist.css?ver=0">

</head>
<body
	style="background-image: url('<%=request.getContextPath()%>/images/background.png');">
	<!-- HEADER -->
	<jsp:include page="../main/header.jsp"></jsp:include>

	<!-- CONTENT -->
	<div class="content">
        <!-- Heading Map Multi -->
        <div class="tit-heading-wrap">
            <div class="tit-movielist-header" style="color:white; font-weight:bold;">무비차트</div>
           
            <div class="submenu">
				<a href="Movielist?param=movielist">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        무비차트
			    </a>
			    <a href="Movielist?param=Schedule">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        상영예정작
			    </a>
            </div>
        </div>
         <br><hr style="border: double 7px black; color:white;"><br>
        
        <!-- Sorting -->
        <div class="sect-sorting" style="padding : 20px;">
            <div class="nowshow">
            	<%
            	if(division.equals("1")){
            	%>
            		<input type="checkbox" id="chk_nowshow"  title="선택되지 않음" onclick='is_checked()' />
            	<%
            	}else{
            	%>
            		<input type="checkbox" id="chk_nowshow"  title="현재 선택됨" onclick='is_checked()' checked/>
            	<%
            	}
            	%>
                <label for="chk_nowshow" style="color:white;">현재 상영작만 보기</label>                
            </div>
            <div class="movielist-sort">
            	<%
            		if(sort.equals("1")){
         		%>
           			<select id="order_type" name="order-type">
    		            <option title="현재 선택됨" selected value="1">예매율순</option>
    	                <option value="2">제목순</option>
    	                <option value="3">개봉일순</option>
    	            </select>
    	        <%		
            	}else if (sort.equals("2")) {
				%>
				<select id="order_type" name="order-type">
					<option value="1">예매율순</option>
					<option title="현재 선택됨" selected value="2">제목순</option>
					<option value="3">개봉일순</option>
				</select>
				<%
				} else if (sort.equals("3")) {
				%>
				<select id="order_type" name="order-type">
					<option value="1">예매율순</option>
					<option value="2">제목순</option>
					<option title="현재 선택됨" selected value="3">개봉일순</option>
				</select>
				<%
				} else {
				%>
				<select id="order_type" name="order-type">
					<option title="현재 선택됨" selected value="1">예매율순</option>
					<option value="2">제목순</option>
					<option value="3">개봉일순</option>
				</select>
				<%
				}
				%>

				<button type="button" class="round gray" onclick="sortclick()"
					id="sortclick">GO</button>
			</div>
			<script type="text/javascript">
				function sortclick() {
					var selectedElement = document.getElementById("order_type");
					var optionVal = selectedElement.options[selectedElement.selectedIndex].value;
					var chk_nowshow = document.getElementById("chk_nowshow").checked;

					if (chk_nowshow) { //상영중
						var division = 3;
					} else { //전체
						var division = 1;
					}

					// 선택한 option의 value, 텍스트
					location.href = "Movielist?param=sortMovielist&sort="
							+ optionVal + "&division=" + division;
				}
			</script>
		</div>
		<!-- //Sorting -->

		<!-- MovieList -->
		<div class="moviechart">
			<table class="movielist">
				<script>
					function is_checked() {

						// 1. checkbox element를 찾습니다.
						const checkbox = document.getElementById('chk_nowshow');

						// 2. checked 속성을 체크합니다.
						const is_checked = checkbox.checked;

						if (is_checked) {
							location.href = "Movielist?param=nowMovielist";
							checkbox.checked;
						} else {
							location.href = "Movielist?param=movielist";
						}

					}
				</script>

				<%
				for (int i = 0; i < list.size(); i++) {
					if (i % 4 == 0) {
				%>
				<tr>
					<%
					}
					%>
					<td class="movie_td">
						<div style="background-color: red; padding: 5px;">
							<strong class="rank" style="color: white">No.<%=i + 1%></strong>
						</div>
						<div class="pab">
							<div class="front">
								<img src="<%=list.get(i).getImg()%>" width="100%" height="292px">
							</div>
							<div class="back">
								<div class="backinner">
									<p class="bottom_title" id="bottom_title<%=i + 1%>"><%=list.get(i).getTitle()%></p>
									<p class="bottom_detail">
										예매율
										<%=list.get(i).getReservation()%> %
										<br>
										<%=list.get(i).getRdate().substring(0, 4) + "." + list.get(i).getRdate().substring(4, 6) + "."
										+ list.get(i).getRdate().substring(6, 8)%>
										개봉
									</p>
								</div>
							</div>
						</div>
						<div>
							<%-- <p class="bottom_title<%=i+1 %>" id="bottom_title<%=i+1 %>" style="text-align:left; color:white; font-weight: bold; margin:5px 0 0 0;"><%=list.get(i).getTitle() %></p>
		        			<p class="bottom_detail" style="text-align:left; color:white; font-weight: lighter; margin:5px 0;">예매율 <%=list.get(i).getReservation() %> %<br>
		        			<%=list.get(i).getRdate().substring(0, 4) + "." + list.get(i).getRdate().substring(4, 6) + "." + list.get(i).getRdate().substring(6, 8) %> 개봉</p> --%>
							<p style="text-align: left">
								<input type="button" value="예매하기" id="reservation"
									name="reservation" onclick="detailsubmit('<%=list.get(i).getRowtitle()%>')">
							</p>
						</div> <script>
							function detailsubmit(rowtitle) {
								location.href = "movieDetail?rowtitle="
										+ rowtitle;
							}
						</script>
					</td>
					<%
					if (i % 4 == 3 || i == list.size() - 1) {
					%>
				</tr>
				<%
				}
				%>
				<%
				}
				%>

			</table>
		</div>
		<!-- //MovieList -->
	</div>
	<!-- FOOTER -->
	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>