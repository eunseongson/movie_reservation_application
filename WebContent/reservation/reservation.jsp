<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>영화 예약</title>
        <link rel="stylesheet" href="../css/reservation.css">
        <link rel="stylesheet" href="../css/common.css">
    </head>

    <body> 
    <!-- <%-- <jsp:include page="/main/header.jsp"></jsp:include> --%> -->
        <div class="reservation-area">
            <div class="city">
                <ul>서울</ul>  
                <ul>경기/인천</ul>
                <ul>충청/대전</ul>
                <ul>전라/광주</ul>  
                <ul>경북/대구</ul>
                <ul>경남/부산/울산</ul>
                <ul>강원</ul> 
                <ul>제주</ul>
            </div>
            <div class="city-detail">
                <ul>예를들어1</ul>
                <ul>예를들어2</ul>
                <ul>예를들어3</ul>
                <ul>예를들어4</ul>
                <ul>예를들어5</ul>
                <ul>예를들어6</ul>
                <ul>예를들어7</ul>
            </div>
            <div class="movie-list"> 
                <ul>영화1</ul>
                <ul>영화2</ul>
                <ul>영화3</ul>
                <ul>영화4</ul>
                <ul>영화5</ul>
                <ul>영화6</ul>
            </div>
            <div class="movie-time-detail">
                <div class="movie-time">
                    <ul>20220709</ul>
                    <ul>20220710</ul>
                    <ul>20220711</ul>
                    <ul>20220712</ul>
                </div>
                <div class="movie-detail-time">
                    <input type="submit" value="예매">
                </div>
            </div> 
        </div>
	<!-- <%-- <jsp:include page="main/footer.jsp"></jsp:include> --%> -->
    </body>
    </html>