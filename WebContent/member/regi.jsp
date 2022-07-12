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

<link rel="icon" href="<%=request.getContextPath()%>/favicon.png">
<title>회원가입</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
</style>

</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>

	<section class="account">
		<div class="content">
			<form action="<%=request.getContextPath()%>/member" method="post">
				<input type="hidden" name="param" value="regiAf">

				<div class="row_group">
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="ps_box int_id"> <input type="text" id="id"
						name="id" class="int" title="ID" maxlength="20" required>
					</span>
					
										<p id="idcheck" style="font-size: 15px"></p>
					<input type="button" id="idBtn" value="아이디확인" style="float: right;">
					<br>
				</div>

				<div class="join_row">
					<h3 class="join_title">
						<label for="pswd1">비밀번호</label>
					</h3>
					<span class="ps_box int_pass" id="pswd1Img"> <input
						type="password" id="pwd" name="pwd" class="int" title="비밀번호 입력"
						aria-describedby="pswd1Msg" maxlength="20"> <span
						class="lbl"> <span id="pswd1Span" class="step_txt" required></span>
					</span>
					</span>
				</div>

				<div class="join_row">
					<h3 class="join_title">
						<label for="pswd1">이름</label>
					</h3>
					<span class="ps_box int_pass" id="pswd1Img"> <input
						type="text" id="name" name="name" class="int" title="비밀번호 입력"
						aria-describedby="pswd1Msg" maxlength="20"> <span
						class="lbl"> <span id="pswd1Span" class="step_txt" required></span>
					</span>
					</span>
				</div>

				<div class="join_row">
					<h3 class="join_title">
						<label for="pswd1">이메일</label>
					</h3>
					<span class="ps_box int_pass" id="pswd1Img"> <input
						type="text" id="email" name="email" class="int" title="비밀번호 입력"
						aria-describedby="pswd1Msg" maxlength="20" size="30" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
						required>
						 <span
						class="lbl"> <span id="pswd1Span" class="step_txt" required></span>
					</span>
					</span>
				</div>

				<div class="join_row">
					<h3 class="join_title">
						<label for="pswd1">전화번호</label>
					</h3>
					<span class="ps_box int_pass" id="pswd1Img"> <input
						type="text" id="phone" name="phone" class="int" title="비밀번호 입력"
						aria-describedby="pswd1Msg" maxlength="20"> <span
						class="lbl"> <span id="pswd1Span" class="step_txt" required></span>
					</span>
					</span>
				</div>
				
				<button type="submit" class="btn btn_type btn-danger btn_primary">회원가입</button>
			</form>

		</div>
	</section>


	<script type="text/javascript">
		$(function() {

			$("#idBtn").click(function() {
				//	alert("btn click");

				$.ajax({
					type : "post",
					url : "../member?param=idcheck",
					data : {
						"id" : $("#id").val()
					},
					// 위에 data 는 서버로 보내는 A, 아래 data 는 서버에서 받아오는 JSONObject B

					success : function(data) {
						if (data.msg.trim() == "YES") {
							$("#idcheck").css("color", "#0000ff");
							$("#idcheck").html('사용할 수 있는 id입니다');
						} else {
							$("#idcheck").css("color", "#ff0000");
							$("#idcheck").html('사용 중인 id입니다');
							$("#id").val("");
						}
					},
					error : function() {
						alert("error");
					}
				});

			});

		});
	</script>

	<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>






