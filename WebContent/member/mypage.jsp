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
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Starbucks Coffee JIHUN</title>

  <link rel="icon" href="../favicon.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
   <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/"> -->
  <link rel="stylesheet" href="../css/mypage.css">
  <link rel="stylesheet" href="../css/header.css" >
  <link rel="stylesheet" href="../css/footer.css" >

  
</head>
<body>

<!-- HEADER -->
<jsp:include page="../main/header.jsp"></jsp:include>


<div class="content-wrapper" align="center">
	<div class="top">
		<div class="top_left">
			<div class="top_myinfoUp">
				<img alt="" src="../images/default_profile.gif">
			</div>
		</div>
		<div class="top_right">
			<span class="username"><%=mem.getName() %>님</span>&nbsp;반가워요!
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
	      		<span>콘텐츠입니다</span>
	     </div>
	</div>
</div>


<!-- FOOTER -->
<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>







