<%@page import="java.util.List"%>
<%@page import="dto.UserReserveDto"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Object obj = session.getAttribute("login");
MemberDto mem = null;
if(obj == null){
	%>
	<script>
	alert('로그인 해 주십시오');
	location.href = "login.jsp";
	</script>
	<%
}
mem = (MemberDto)obj;

MemberDao dao = MemberDao.getInstance();
List<UserReserveDto> list = null;
list = dao.findreserve(mem);

%>
   
<%
//	request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
	
%>   
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>예매 내역</title>

  <link rel="icon" href="../favicon.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  
   <!-- Bootstrap core CSS -->
  <link href="../css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/footers/"> -->
  <link rel="stylesheet" href="../css/mypage.css">
  <link rel="stylesheet" href="../css/header.css" >
  <link rel="stylesheet" href="../css/footer.css" >
  
  <style type="text/css">
  	.content-wrapper .top .top_right .top_myinfoDown .sub-menu .menu .menu__name .reserve {
  		color: #fff;
  	}
  
  	.content-wrapper .bottom .inner {
	  color: #fff;
	}
	
	.tb {
	  color: #fff;
	  border-collapse: separate;
	  border-spacing: 0 15px;
	}
  </style>
  
</head>
<body>


<!-- HEADER -->
<jsp:include page="../main/header.jsp"></jsp:include>

<div class="content-wrapper" align="center">
	<div class="top">
		<div class="top_left">
			<div class="top_myinfoUp">
				<img alt="" src="../images/default_profile.gif">
			</div>
		</div>
		<div class="top_right">
			<div class="top_myinfoUp">
				<span class="username"><%=mem.getName() %>님</span>&nbsp;반가워요!
			</div>
			<div class="top_myinfoDown">
				<ul class="sub-menu">
			        <li class="menu">
			        	<div class="menu__name">
			        		<a href="./mypageReserve.jsp" class="reserve">예매내역</a>
			        	</div>
			        </li>
			        <li class="menu">
			          <div class="menu__name">
			          	<a href="./mypageInfo.jsp">MY 정보 보기</a>
			          </div>
			        </li>
		      	</ul>  	
			</div>
		</div>
	</div>
	
	
	<div class="bottom">
		<div class="inner">
          예매내역
      	</div>
      	
      	<div class="contents" align="center">
	      		<table class="tb" style="text-align: center; font-size: 15px;">
	      		<col width="200px"><col width="150px"><col width="150px"><col width="150px">
	      			<tr style="font-weight: bold;">
	      				<th>제목</th><th>상영관</th><th>결제일</th><th>상영일</th>
	      			</tr>
	      			<% for(int i = 0; i < list.size(); i++){
	      				UserReserveDto dto = list.get(i);
	      				%>
	      			<tr>
	      				<td><%=dto.getTitle() %></td>
	      				<td><%=dto.getCity() %></td>
	      				<td><%=dto.getWdate() %></td>
	      				<td><%=dto.getRdate() %></td>
	      			</tr>
	      				<%
	      			} %>
	      			
	      		</table>
	     </div>
	</div>
</div>

<!-- FOOTER -->
<jsp:include page="../main/footer.jsp"></jsp:include>

</body>
</html>







