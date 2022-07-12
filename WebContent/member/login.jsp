<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../css/account.css">
<link rel="icon" href="../images/favicon.png">
<link rel="stylesheet" href="../css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	crossorigin="anonymous"></script>
<link rel="icon" href="<%=request.getContextPath()%>/favicon.png">
<title>로그인</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js"
	type="text/javascript"></script>


</head>
<body style="background-image: url('../images/background.png')">
	<jsp:include page="../main/header.jsp"></jsp:include>

	<section class="account">
		<div class="content">
			<form action="<%=request.getContextPath()%>/member" method="post">
				<input type="hidden" name="param" value="loginAf">

				<div class="row_group">
					<h3 class="join_title">
						<label for="id" style="margin-left: 10px">아이디</label>
					</h3>
					<span class="ps_box int_id"> <input type="text" id="id"
						name="id" class="int" title="ID" maxlength="20" required>
					</span> <input type="checkbox" id="chk_save_id" 
					style="margin-left:10px; margin-top: 15px">  아이디저장

				</div>

				<div class="join_row">
					<h3 class="join_title">
						<label for="pswd1" style="margin-left: 10px">비밀번호</label>
					</h3>
					<span class="ps_box int_pass" id="pswd1Img"> <input
						type="password" id="pwd" name="pwd" class="int" title="비밀번호 입력"
						aria-describedby="pswd1Msg" maxlength="20"> <span
						class="lbl"> <span id="pswd1Span" class="step_txt" required></span>
					</span>
					</span>
				</div>
				<button type="submit" class="btn btn_type btn-danger btn_primary">로그인하기</button>
			</form>
			<br> <a href="findid.jsp"
				style="width: 50%; float: center; padding-left: 100px">ID 찾기</a> <a
				href="findpw.jsp"
				style="width: 50%; float: center; padding-left: 160px">PW 찾기</a>

		</div>
	</section>

	<script type="text/javascript">
		let user_id = $.cookie("user_id");
		if (user_id != null) {
			$("#id").val(user_id);
			$("#chk_save_id").prop("checked", true);
		}

		$("#chk_save_id").click(function() {

			if ($("#chk_save_id").is(":checked")) {

				if ($("#id").val().trim() == "") {
					alert("id를 입력해 주십시오");
					$("#chk_save_id").prop("checked", false);
				} else {
					// cookie를 저장	
					$.cookie("user_id", $("#id").val().trim(), {
						expires : 7,
						path : './'
					});
				}

			} else {
				$.removeCookie("user_id", {
					path : './'
				});
			}
		});
	</script>

	<jsp:include page="../main/footer.jsp"></jsp:include>

	</div>
</body>
</html>




