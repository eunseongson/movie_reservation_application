
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Starbucks Coffee JIHUN</title>

<link rel="icon" href="<%=request.getContextPath() %>/favicon.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/"> -->

<style type="text/css">
.btn_totalSearch{
	width: 26px;
	height: 26px;
	background: transparent url(../images/search.png) center center/26px scroll no-repeat;
	border: none;
}
</style>

</head>
<body>
	<!-- HEADER -->
	<header>
		<main>
			<nav class="py-2 bg-light border-bottom">

				<ul class="nav">
					<div class="container d-flex flex-wrap">
						<ul class="nav me-auto">
							<li class="nav-item" style="font-size: 60px;"><a
								href="<%=request.getContextPath() %>/main/main.jsp"
								class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
									<img alt="" src="<%=request.getContextPath() %>/images/logo.png">
							</a></li>
						</ul>
						
						<li class="nav-item" style="padding-top: 55px; margin-right: 40px; position:relative;">
							<form action="<%=request.getContextPath()%>/member" method="post">
								<input type="text" id="searchbar" name="searchbar">
								<button id="chk" type="submit" class="btn_totalSearch" form="searchbar" style="position: absolute; bottom: 0px; margin-bottom: 10px; margin-left: 5px;">
								</button>
							</form>
						</li>
						<%
						if (session.getAttribute("login") == null) {
						%>

						<li class="nav-item"><a href="<%=request.getContextPath() %>/member/login.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="<%=request.getContextPath() %>/images/loginPassword.png"
								class="bi d-block mx-auto mb-1" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="<%=request.getContextPath() %>/member?param=login"> 로그인
						</a></li>
						<li class="nav-item"><a href="<%=request.getContextPath() %>/member/regi.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="<%=request.getContextPath() %>/images/loginJoin.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="<%=request.getContextPath() %>/member?param=regi"> 회원가입
						</a></li>

						<%
						} else {
						MemberDto dto = (MemberDto) session.getAttribute("login");
						%>

						<li class="nav-item"><a href="<%=request.getContextPath() %>/member/mypage.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="<%=request.getContextPath() %>/images/loginMember.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="<%=request.getContextPath() %>/member?param=mypage">
								마이페이지
						</a></li>

						<li class="nav-item"><a href="<%=request.getContextPath() %>/member?param=logout.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="<%=request.getContextPath() %>/images/loginMember.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="<%=request.getContextPath() %>/member?param=logout"> 로그아웃
						</a></li>

						<%-- <li class="nav-item"><a href="<%=request.getContextPath() %>/member?param=withdraw.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="<%=request.getContextPath() %>/images/loginMember.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="<%=request.getContextPath() %>/member?param=withdraw">
								회원탈퇴
						</a></li> --%>
						<%
						}
						%>
						
				</ul>
				</div>
			</nav>
		</main>
</header>
</body>


<script type="text/javascript">
	$("#chk").click(function() {
		alert("id를 입력해 주십시오");
	});
</script>




</html>
