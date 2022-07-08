<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

	<div class="center">
		<h2>회원가입</h2>


		<form action="<%=request.getContextPath()%>/member" method="post">
			<input type="hidden" name="param" value="regiAf">

			<table border="2">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="id" name="id" size="30" required><br>
						<p id="idcheck" style="font-size: 8px"></p> <input type="button"
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

</body>
</html>






