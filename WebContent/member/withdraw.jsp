<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="icon" href="../images/favicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/account.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"
	integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>BITBOX</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>

<style type="text/css">
.center {
	margin: auto;
	width: 60%;
	border: 3px solid #00ff00;
	padding: 10px;
}

body {
	margin: 0px 350px;
	background-image: url('../images/background.png');
}
</style>

</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

	<section class="account">
		<%-- <form action="<%=request.getContextPath()%>/member" method="post"> --%>
			<!-- <input type="hidden" name="param" value="withdrawAf"> -->

			<div class="content">
				<div class="join_row">
					<h3 class="join_title">
						<label for="pswd1">탈퇴하려면 비밀번호를 입력하세요</label>
					</h3>
					<span class="ps_box int_pass" id="pswd1Img"> 
					<input
						type="password" id="pwd" name="pwd" class="int" title="비밀번호 입력"
						aria-describedby="pswd1Msg" maxlength="20"> 
						<span
						class="lbl"> <span id="pswd1Span" class="step_txt" required></span>
					</span>
					</span>
				</div>
				<button type="button" id="withdrawBtn" class="btn btn_type btn-danger btn_primary">회원탈퇴하기</button>
			</div>
		<!-- </form> -->
			<script type="text/javascript">
		$(function() {
			$("#withdrawBtn").click(function() {
				$.ajax({
					type : "post",
					url : "../member?param=withdrawAf",
					data : {
						"pwd" : $("#pwd").val()
					},
					// 위에 data 는 서버로 보내는 A, 아래 data 는 서버에서 받아오는 JSONObject B

					success : function(data) {
						// alert('success');
						// alert(data.msg);
						
						if (data.msg.trim() == "withdrawOK") {
							alert(data.id + " 회원님, 탈퇴 처리 되었습니다.");
							window.location.href = "../member?param=login";
						} else {
							alert("비밀번호가 일치하지 않아 회원탈퇴에 실패하였습니다.");
							window.location.href = "../member?param=withdraw";
						}
					},
					error : function() {
						alert("error");
					}
				});

			});

		});
	</script>	
		
	</section>

<jsp:include page="../main/footer.jsp"></jsp:include>
  
</body>
</html>








