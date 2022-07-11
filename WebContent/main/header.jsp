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

<link rel="icon" href="../favicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/"> -->

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
								href="../main/main.jsp"
								class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
									<img alt="" src="../images/logo3.png">
							</a></li>
						</ul>

						<%
						if (session.getAttribute("login") == null) {
						%>

						<li class="nav-item"><a href="../member/login.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="../images/loginPassword.png"
								class="bi d-block mx-auto mb-1" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="../member?param=login"> 로그인
						</a></li>
						<li class="nav-item"><a href="../member/regi.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="../images/loginJoin.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="../member?param=regi"> 회원가입
						</a></li>

						<%
						} else {
						MemberDto dto = (MemberDto) session.getAttribute("login");
						%>

						<li class="nav-item"><a href="../member/mypage.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="../images/loginMember.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="../member?param=mypage">
								마이페이지
						</a></li>

						<li class="nav-item"><a href="../member?param=logout.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="../images/loginMember.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="../member?param=logout"> 로그아웃
						</a></li>

						<li class="nav-item"><a href="../member?param=withdraw.jsp"
							class="nav-link link-dark px-2"> <img alt=""
								src="../images/loginMember.png" class="bi d-block mx-auto mb-1"
								width="48" height="48" href="../member?param=withdraw">
								회원탈퇴
						</a></li>
						<%
						}
						%>
						<br>
						<br>
						<li class="nav-item" style="padding-top: 50px; padding-left: 30px">
							<form action="/something">
								<label for="searchbar">검색창</label> <input type="text"
									id="searchbar" name="searchbar">
								<button type="submit" form="searchbar">검색</button>
							</form>
						</li>
				</ul>
				</div>
			</nav>
		</main>
	</header>
</body>
</html>
