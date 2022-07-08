<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

#withdrawBtn{
float:right;
}
</style>

</head>
<body>

	<div class="center">
	<h2>회원탈퇴</h2>


		<form action="<%=request.getContextPath()%>/member" method="post">
			<input type="hidden" name="param" value="withdrawAf">

			<table border="2">
				<tr>
					<th>탈퇴하려면 비밀번호를 입력하세요</th>
					<td><input type="password" name="pwd" size="20"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input id = "withdrawBtn" type="submit" value="회원탈퇴"></td>
				</tr>

			</table>

		</form>
	</div>
</body>
</html>




