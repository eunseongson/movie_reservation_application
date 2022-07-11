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
	background-image: url('../images/background.png')
}
</style>

</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>

	<section class="account">
		<form action="<%=request.getContextPath()%>/member" method="post">
			<input type="hidden" name="param" value="findidAf">

			<div class="content">
				<div class="row_group">
					<h3 class="join_title">
						<label for="id">이름</label>
					</h3>
					<span class="ps_box int_id"> <input type="text" id="name"
						name="name" class="int" title="ID" maxlength="20" required>
					</span>
				</div>

				<div class="join_row">
					<h3 class="join_title">
						<label for="pswd1">이메일</label>
					</h3>
					<span class="ps_box int_pass" id="pswd1Img"> <input
						type="email" id="email" name="email" class="int" title="비밀번호 입력"
						aria-describedby="pswd1Msg" maxlength="20"> <span
						class="lbl"> <span id="pswd1Span" class="step_txt" required></span>
					</span>
					</span>
				</div>
				<div class="btn_area">
					<button type="button" id="findIdBtn"
						class="btn btn_type btn-danger btn_primary">ID 찾기</button>
				</div>
			</div>
		</form>

		<script type="text/javascript">
			$(function() {

				$("#findIdBtn").click(function() {

					$.ajax({
						type : "post",
						url : "../member?param=findidAf",
						data : {
							"name" : $("#name").val(),
							"email" : $("#email").val()
						},
						// 위에 data 는 서버로 보내는 A, 아래 data 는 서버에서 받아오는 JSONObject B

						success : function(data) {
							if (data.msg.trim() == "YES") {
								alert(data.name + "님의 id는 " + data.id + "입니다");
								window.location.href = "login.jsp";

							} else {
								alert("없는 회원 정보입니다.");
								window.location.href = "findid.jsp";

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




