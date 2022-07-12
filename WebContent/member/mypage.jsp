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
/* String id = request.getParameter("id");
 */	
%>   


    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>마이페이지</title>

  <link rel="icon" href="../favicon.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  
  <!-- font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding:wght@400;700&display=swap" rel="stylesheet">
  
  <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/"> -->
  <link rel="stylesheet" href="../css/mypage.css">
  <link rel="stylesheet" href="../css/header.css" >
  <link rel="stylesheet" href="../css/footer.css" >

  
</head>
<body style="font-family: 'Nanum Gothic Coding', monospace;">

<!-- HEADER -->
<jsp:include page="../main/header.jsp"></jsp:include>


<div class="content-wrapper" align="center">
	<div class="top">
		<div class="top_left">
			<div class="top_myinfoUp">
				<img alt="" src="../images/default_profile.gif">
			</div>
			<div class="top_myinfoDown">
				<a href="<%=request.getContextPath() %>/member?param=withdraw">회원탈퇴</a>
			</div>
			
		</div>
		<div class="top_right">
			<div class="top_myinfoUp">
				<span class="username"><%=mem.getName() %>님</span>&nbsp;반가워요!
			</div>
			<div class="top_myinfoDown">
				<ul class="sub-menu">
			        <li class="menu">
			        	<div class="menu__name">
			        		<a href="./mypageReserve.jsp">예매내역</a>
			        	</div>
			        </li>
			        <li class="menu">
			          <div class="menu__name">
			          	<a href="./mypageInfo.jsp">MY 정보 보기</a>
			          </div>
			        </li>
		      	</ul>  	
			</div>
		</div>
	</div>
	
	
	<div class="bottom">
		<div class="intro" style="color: #8c8c8c; font-size: 20px;">
			<br><br>
			<span style="color: #fff; font-size: 30px;">Bit Box(주) 윤리행동 준칙의 목적과 취지</span><br><br>
			특별한 만족을 드리는 특별한 멀티플렉스라는 경영이념과 더불어 국내 멀티플렉스 산업의 선두이기보다는<br>
			 관객 여러분들이 생각하는 최상의 멀티플렉스로 거듭나기 위하여 올바른 윤리적 가치관과 공정한 거래로<br>
			 윤리경영을 함으로써 고객이 풍요로운 삶을 추구하고, 사회와 국가의 발전을 도모함에 있습니다.
			 <br><br>
			
			<span style="color: #fff; font-size: 30px;">신고접수처</span><br><br>
			Bit Box(주) 윤리사무국은 기업윤리의 저촉과 관련된 사항의 제보와 신고를 접수 받고 있습니다.<br>
			여러분의조언을 최대한 윤리경영에 반영하겠습니다. 또한 실질적인 기업윤리 정착을 위해 내부신고자<br>
			 보호제도를 마련하여, 신고자 보호를 위해 가능한 모든 조취를 취할 것입니다.<br>
			우편번호 138-727 서울특별시 서초구 서초대로74길 비트빌 Bit Box(주) 윤리사무국
		</div>
	</div>
</div>


<!-- FOOTER -->
<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>







