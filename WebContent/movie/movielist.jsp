<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Movie List</title>

  <link rel="icon" href="./favicon.png">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/movielist.css">
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  

</head>
<body>
  
  <!-- CONTENT -->
	<div class="content">
        <!-- Heading Map Multi -->
        <div class="tit-heading-wrap">
            <div class="tit-movielist-header">무비차트</div>
           
            <div class="submenu">
				<a href="#">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        무비차트
			    </a>
			    <a href="#">
			        <span></span>
			        <span></span>
			        <span></span>
			        <span></span>
			        상영예정작
			    </a>
            </div>
        </div>
         <br><hr style="border: double 7px black;"><br>
        
        <!-- Sorting -->
        <div class="sect-sorting">
            <div class="nowshow">
                <input type="checkbox" id="chk_nowshow"  title="현재 선택됨" checked/>
                <label for="chk_nowshow">현재 상영작만 보기</label>                
            </div>
            <div class="movielist-sort">
	            <select id="order_type" name="order-type">
					<option value="1">예매율순</option>
	                <option title="현재 선택됨" selected value="2">평점순</option>
	                <option value="3">관람객순</option>
	            </select>
	            <button type="button" class="round gray"><span>GO</span></button>
            </div>
        </div>
        <!-- //Sorting -->
        
        <!-- MovieList -->
        <table class="movielist">
        	<% for(int i=0; i<9; i=i+3) {
        	%>
	        	<tr>
		        	<td>
		        		<div style="background-color:red; padding:5px;"><strong class="rank" style="color:white">No.<%=i+1 %></strong></div>
		        		<div><img src="../images/git.png" width="100%" height="100%"></div>
		        		<div><p class="bottom_title" style="text-align:left">제목</p>
		        			<p class="bottom_detail" style="text-align:left">상세정보</p>
		        			<p style="text-align:left"><input type="button" value="예매하기" id="reservation" name="reservation"></p>
		        		</div>
		        	</td>
		        	<td>
		        		<div style="background-color:red; padding:5px;"><strong class="rank" style="color:white">No.<%=i+2 %></strong></div>
		        		<div><img src="../images/git.png" width="100%" height="100%"></div>
		        		<div><p class="bottom_title" style="text-align:left">제목</p>
		        			<p class="bottom_detail" style="text-align:left">상세정보</p>
		        			<p style="text-align:left"><input type="button" value="예매하기" id="reservation" name="reservation"></p>
		        		</div>
		        	</td>
		        	<td>
						<div style="background-color:red; padding:5px;"><strong class="rank" style="color:white">No.<%=i+3 %></strong></div>
		        		<div><img src="../images/git.png" width="100%" height="100%"></div>
		        		<div><p class="bottom_title" style="text-align:left">제목</p>
		        			<p class="bottom_detail" style="text-align:left">상세정보</p>
		        			<p style="text-align:left"><input type="button" value="예매하기" id="reservation" name="reservation"></p>
		        		</div>	
					</td>
	        	</tr>
        	<%
        	}
        	%>
        </table>
        <!-- //MovieList -->
     </div>
     
     
	
  <!-- FOOTER -->
  <footer>
    <div class="inner">

      <ul class="menu">
        <li><a href="javascript:void(0)" class="green">개인정보처리방침</a></li>
        <li><a href="javascript:void(0)">영상정보처리기기 운영관리 방침</a></li>
        <li><a href="javascript:void(0)">홈페이지 이용약관</a></li>
        <li><a href="javascript:void(0)">위치정보 이용약관</a></li>
        <li><a href="javascript:void(0)">스타벅스 카드 이용약관</a></li>
        <li><a href="javascript:void(0)">운영경영 핫라인</a></li>
      </ul>

      <div class="btn-group">
        <a href="javascript:void(0)" class="btn btn--white">찾아오시는 길</a>
        <a href="javascript:void(0)" class="btn btn--white">신규입점제의</a>
        <a href="javascript:void(0)" class="btn btn--white">사이트 맵</a>
      </div>

      <div class="info">
        <span>사업자등록번호 201-81-21515</span>
        <span>(주)스타벅스 코리아 대표이사 서지훈</span>
        <span>TEL : 02) 1234-1234 / FAX : 02) 1234-1234</span>
        <span>개인정보 책임자 : 정태영</span>
      </div>

      <p class="copyright">
        &copy; <span class="this-year"></span> Starbucks Coffee Company. All Right Reserved.
      </p>
      <img src="./images/starbucks_logo_only_text.png" alt="" class="logo">

    </div>
  </footer>
<body>

</body>
</html>