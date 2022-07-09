<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Starbucks Coffee JIHUN</title>

  <link rel="icon" href="./favicon.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/account.css">


  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
<title>BITBOX</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">
.center {
	margin: auto;
	width: 60%;
	border: 3px solid #00ff00;
	padding: 10px;
}

#regiBtn {
	float: right;
}
</style>

</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

	<div class="center">
		<h2>회원가입</h2>

		<form action="<%=request.getContextPath()%>/member" method="post">
			<input type="hidden" name="param" value="regiAf">

			<table border="2">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id" size="30" required><br>
						<p id="idcheck" style="font-size: 8px"></p> 
						<input type="button"
						id="idBtn" value="아이디확인"></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input type="text" name="pwd" size="30" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" size="30" required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
						size="30" required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" size="30" required></td>
				</tr>
				<tr>
					<td colspan="2"><input id="regiBtn" type="submit" value="회원가입"></td>
				</tr>

			</table>
		</form>
	</div>

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






