<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Object obj = session.getAttribute("login");
MemberDto mem = null;
if(obj == null){
	%>
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>
	<%
}
mem = (MemberDto)obj;
%>
   
<%
//	request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
	
%>   
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Starbucks Coffee JIHUN</title>

  <link rel="icon" href="./favicon.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/mypage.css">
  <link rel="stylesheet" href="../css/mypageInfo.css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
</head>
<body>

<div class="content-wrapper" align="center">
	<div class="top">
		<div class="top_left">
			<div class="top_myinfoUp">
				<span class="username"><%=mem.getName() %>님</span>&nbsp;반가워요!
			</div>
			<div class="top_myinfoDown">
				MY POINT
			</div>
		</div>
		<div class="top_right">
			MY 영화관
		</div>
	</div>
	
	
	<div class="bottom">
		<div class="inner">
			<ul class="sub-menu">
		        <li class="menu">
		        	<div class="menu__name">
		        		<a href="mypageReserve.jsp?id=">예매내역</a>
		        	</div>
		        </li>
		        <li class="menu">
		          <div class="menu__name">
		          	<a href="mypageInfo.jsp?id=<%=mem.getId() %>">MY 정보 관리</a>
		          </div>
		        </li>
	      	</ul>  	
      	</div>
      	
      	<div class="contents">
      		<table>
				<tr>
					<th>아이디:</th>
					<td><%=mem.getId() %></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><%=mem.getName() %></td>
				</tr>
				<tr>
					<th>이메일:</th>
					<td><%=mem.getEmail() %></td>
				</tr>
				<tr>
					<th>전화번호:</th>
					<td><%=mem.getPhone() %></td>
				</tr>
			</table>
    	 </div>
	</div>
</div>

  <footer>
    <div class="inner">

      <ul class="menu">
        <li><a href="javascript:void(0)" class="green">개인정보처리방침</a></li>
        <li><a href="javascript:void(0)">영상정보처리기기 운영관리 방침</a></li>
        <li><a href="javascript:void(0)">홈페이지 이용약관</a></li>
        <li><a href="javascript:void(0)">위치정보 이용약관</a></li>
        <li><a href="javascript:void(0)">스타벅스 카드 이용약관</a></li>
        <li><a href="javascript:void(0)">운영경영 핫라인</a></li>
      </ul>

      <div class="btn-group">
        <a href="javascript:void(0)" class="btn btn--white">찾아오시는 길</a>
        <a href="javascript:void(0)" class="btn btn--white">신규입점제의</a>
        <a href="javascript:void(0)" class="btn btn--white">사이트 맵</a>
      </div>

      <div class="info">
        <span>사업자등록번호 201-81-21515</span>
        <span>(주)스타벅스 코리아 대표이사 서지훈</span>
        <span>TEL : 02) 1234-1234 / FAX : 02) 1234-1234</span>
        <span>개인정보 책임자 : 정태영</span>
      </div>

      <p class="copyright">
        &copy; <span class="this-year"></span> Starbucks Coffee Company. All Right Reserved.
      </p>
      <img src="./images/starbucks_logo_only_text.png" alt="" class="logo">

    </div>
  </footer>

</body>
</html>












</body>
</html>







