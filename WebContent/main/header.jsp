
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


<link rel="icon" href="<%=request.getContextPath()%>/favicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://kit.fontawesome.com/079869d0a6.js"
	crossorigin="anonymous"></script>

<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/"> -->
<style type="text/css">
#titleImg {
	width: 130px;
}

#titleLi {
	display: flex;
	align-items: center;
}

.py-2 {
	background: linear-gradient(black, 80%, transparent);
}

.px-2 {
	color: white;
}

i {
	color: white;
}
</style>

</head>
<body>
	<!-- HEADER -->
	<header>
		<main>
			<nav class="py-2">
				<ul class="nav">
					<div class="container d-flex flex-wrap">
						<ul class="nav me-auto">
							<li id="titleLi" class="nav-item" style="font-size: 60px;"><a
								href="<%=request.getContextPath()%>/main/main.jsp"
								class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
									<img alt="" id="titleImg"
									src="<%=request.getContextPath()%>/images/logo.png">
							</a></li>
						</ul>

						<ul class="nav">
							<li class="nav-item"
								style="display: flex; align-items: center; padding-right: 30px; color: white">
								<input type="text" id="searchbar" name="searchbar"> <i
								class="fa-solid fa-magnifying-glass"
								style="cursor: pointer; font-size: 18px; margin-left: 6px;"
								onclick="movieSearch()"></i>
							</li>
							<%
							if (session.getAttribute("login") == null) {
							%>

							<li class="nav-item" style="display: flex; align-items: center;"><a
								href="<%=request.getContextPath()%>/member/login.jsp"
								class="nav-link link-dark px-2"> <i
									class="fa-solid fa-arrow-right-to-bracket"
									href="<%=request.getContextPath()%>/member?param=login"></i> <span
									style="color: white">로그인</span>
							</a></li>
							<li class="nav-item"
								style="display: flex; align-items: center; padding-right: 30px;"><a
								href="<%=request.getContextPath()%>/member/regi.jsp"
								class="nav-link link-dark px-2"> <i
									class="fa-solid fa-person-circle-plus"
									href="<%=request.getContextPath()%>/member?param=regi"></i> <span
									style="color: white">회원가입</span>
							</a></li>

							<%
							} else {
							MemberDto dto = (MemberDto) session.getAttribute("login");
							%>

							<li class="nav-item" style="display: flex; align-items: center;"><a
								href="<%=request.getContextPath()%>/member/mypage.jsp"
								class="nav-link link-dark px-2"> <i
									class="fa-solid fa-circle-user"
									href="<%=request.getContextPath()%>/member?param=mypage"></i> <span
									style="color: white">마이페이지</span>
							</a></li>


							<li class="nav-item"
								style="display: flex; align-items: center; padding-right: 30px;"><a
								href="<%=request.getContextPath()%>/member?param=logout"
								class="nav-link link-dark px-2"> <i
									class="fa-solid fa-arrow-right-from-bracket"
									href="<%=request.getContextPath()%>/member?param=logout"></i> <span
									style="color: white">로그아웃</span>
							</a></li>
						</ul>

						<%
						}
						%>

					</div>
				</ul>
			</nav>
		</main>
	</header>

	<script type="text/javascript">
function movieSearch(){
let moviesr = document.getElementById("searchbar").value.trim();
if(moviesr == null || moviesr.trim()==""){
	alert("검색어를 입력하세요.");
}else{
location.href = "<%=request.getContextPath()%>/Movielist?param=movieSe&movieSearch=" + moviesr;

		}
	}
</script>

</body>

<script type="text/javascript">
	$("#chk").click(function() {
		alert("id를 입력해 주십시오");
	});
</script>




</html>
