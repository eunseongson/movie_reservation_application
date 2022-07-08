<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/swipe.css">
<link rel="stylesheet" type="text/css" href="../css/moviedetail.css">
<script src="https://kit.fontawesome.com/079869d0a6.js"
	crossorigin="anonymous"></script>
<link rel="icon" href="./favicon.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js"
	integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- SWIPER -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
<link rel="stylesheet" href="./navbar.css">
<link rel="stylesheet" href="footer.css">
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="inner">
			<ul class="main-menu">
				<li class="item">
					<div class="item__name">COFFEE</div>
				</li>
				<li class="item">
					<div class="item__name">MENU</div>
				</li>
				<li class="item">
					<div class="item__name">STORE</div>
				</li>
				<li class="item">
					<div class="item__name">RESPONSIBILITY</div>
				</li>
				<li class="item">
					<div class="item__name">MY STARBUCKS REWARDS</div>
				</li>
				<li class="item">
					<div class="item__name">WHAT'S NEW</div>
				</li>
			</ul>
		</div>
	</header>
	<div id="container">
		<div id="mainWrapper">
			<div id="mainBlock">
				<div id="mainLeft">
					<div id="mltop">
						<div id="title">토르: 러브 앤 썬더</div>
						<div id="regipercent">
							<i class="fa-solid fa-ticket"></i>예매율 61.3%
						</div>
						<div style="border-top: 2px solid #fff; margin: 10px 10px;"></div>
						<div id="regipercent">
							감독 : 타이카 와이티티<br> 배우 : 크리스 헴스워스 , 나탈리 포트만 , 테사 톰슨 , 크리스찬 베일
							, 타이카 와이티티 , 크리스 프랫<br> 장르 : 액션, 어드벤처, 환타지 <br> 기본 :
							12세 이상, 119분, 미국 <br> 개봉 : 2022.07.06
						</div>
					</div>
					<div id="mlbottom"></div>
				</div>
				<div id="mainRight">
					<div id="poster"></div>
					<div id="resvbtn">
						<input type="button" value="예매하기">
					</div>
				</div>
			</div>
		</div>
		<div id="contentWrapper">
			<div id="contentBlock">
				<div class="title">"신을 죽이는 자, 신이 상대한다!"</div>
				<div id="content">
					“신을 죽이는 자, 신이 상대한다!” 슈퍼 히어로 시절이여, 안녕!<br> 이너피스를 위해 자아 찾기 여정을
					떠난 천둥의 신 ‘토르’<br> <br> 그러나, 우주의 모든 신들을 몰살하려는 신 도살자 ‘고르’의
					등장으로<br> ‘토르’의 안식년 계획은 산산조각 나버린다.<br> <br> ‘토르’는 새로운
					위협에 맞서기 위해,<br> ‘킹 발키리’, ‘코르그’, 그리고 전 여자친구 ‘제인’과 재회하게 되는데,<br>
					그녀가 묠니르를 휘두르는 ‘마이티 토르’가 되어 나타나 모두를 놀라게 한다.<br> <br> 이제, 팀
					토르는 ‘고르’의 복수에 얽힌 미스터리를 밝히고<br> 더 큰 전쟁을 막기 위한 전 우주적 스케일의 모험을
					시작하는데...<br> <br> 7월 6일, 우주 최고의 ‘갓’ 매치가 시작된다!
				</div>
				<div id="graphWrapper">
					<div id="lGraph">성별 예매 분포</div>
					<div id="rGraph">연령별 예매 분포</div>
				</div>
			</div>

			<div
				style="border-top: 2px solid #454545; margin-top: 100px; margin-bottom: 80px"></div>
		</div>

		<section class="notice">
			스틸컷
			<div class="promotion">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img id="slideimg" src="../img/토르.jpg"
								alt="2022 뉴이어, 스타벅스와 함께 즐겁고 활기차게 시작하세요!">
						</div>
						<div class="swiper-slide">
							<img id="slideimg" src="../img/토르.jpg">
						</div>
						<div class="swiper-slide">
							<img id="slideimg" src="../img/토르.jpg">
						</div>
						<div class="swiper-slide">
							<img id="slideimg" src="../img/토르.jpg"
								alt="2022 뉴이어, 스타벅스와 함께 즐겁고 활기차게 시작하세요!">
						</div>
						<div class="swiper-slide">
							<img id="slideimg" src="../img/토르.jpg"
								alt="2022 뉴이어, 스타벅스와 함께 즐겁고 활기차게 시작하세요!">
						</div>
					</div>
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-prev">
					<div class="material-icons">arrow_back</div>
				</div>
				<div class="swiper-next">
					<div class="material-icons">arrow_forward</div>
				</div>
			</div>
		</section>

		<div id="reviewWrapper">
			<div style="border-top: 2px solid #454545; margin-bottom: 100px;"></div>
			<div class="title">
				<i class="fa-regular fa-face-smile"></i>실시간 후기
			</div>
			<table id="table">
				<tr>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img alt="../img/default_profile.gif" src="../img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id">dmstjd3256</div>
										<div>2022.07.28</div>
									</div>
									<br>
									점점마블영화가김빠진콜라같은느낌은무엇인지...좀허전한데,주연,스토리라인모두재정비해야할거같아요~~ㅠㅠ
								</div>
							</div>
						</div>
					</td>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img alt="../img/default_profile.gif" src="../img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id">dmstjd3256</div>
										<div>2022.07.28</div>
									</div>
									<br>
									점점마블영화가김빠진콜라같은느낌은무엇인지...좀허전한데,주연,스토리라인모두재정비해야할거같아요~~ㅠㅠ
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img alt="../img/default_profile.gif" src="../img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id">dmstjd3256</div>
										<div>2022.07.28</div>
									</div>
									<br>
									점점마블영화가김빠진콜라같은느낌은무엇인지...좀허전한데,주연,스토리라인모두재정비해야할거같아요~~ㅠㅠ
								</div>
							</div>
						</div>
					</td>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img alt="../img/default_profile.gif" src="../img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id">dmstjd3256</div>
										<div>2022.07.28</div>
									</div>
									<br>
									점점마블영화가김빠진콜라같은느낌은무엇인지...좀허전한데,주연,스토리라인모두재정비해야할거같아요~~ㅠㅠ
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img alt="../img/default_profile.gif" src="../img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id">dmstjd3256</div>
										<div>2022.07.28</div>
									</div>
									<br>
									점점마블영화가김빠진콜라같은느낌은무엇인지...좀허전한데,주연,스토리라인모두재정비해야할거같아요~~ㅠㅠ
								</div>
							</div>
						</div>
					</td>
					<td class="td">
						<div id="tdDiv">
							<div id="revLeft">
								<img alt="../img/default_profile.gif" src="../img/second.jpg">
							</div>
							<div id="revRight">
								<div id="revId">
									<div id="revTop">
										<div id="id">dmstjd3256</div>
										<div>2022.07.28</div>
									</div>
									<br>
									점점마블영화가김빠진콜라같은느낌은무엇인지...좀허전한데,주연,스토리라인모두재정비해야할거같아요~~ㅠㅠ
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
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
				<a href="javascript:void(0)" class="btn btn--white">찾아오시는 길</a> <a
					href="javascript:void(0)" class="btn btn--white">신규입점제의</a> <a
					href="javascript:void(0)" class="btn btn--white">사이트 맵</a>
			</div>

			<div class="info">
				<span>사업자등록번호 201-81-21515</span> <span>(주)롯데시네마 대표 손은성</span>
				<span>TEL : 02) 1234-1234 / FAX : 02) 1234-1234</span> <span>개인정보
					책임자 : 정태영</span>
			</div>

			<p class="copyright">
				&copy; <span class="this-year"></span> Starbucks Coffee Company. All
				Right Reserved.
			</p>
			<img src="./images/starbucks_logo_only_text.png" alt="" class="logo">

		</div>
	</footer>




	<!-- swipe-script -->
	<script type="text/javascript">
		// new Swiper(선택자, 옵션)
		new Swiper('.promotion .swiper-container', {
			slidesPerView : 3,
			spaceBetween : 10,
			centeredSlides : true,
			loop : true,
			autoplay : {
				delay : 3000,
			},
			pagination : {
				el : '.promotion .swiper-pagination', // 페이지 번호 요소 선택자
				clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부
			},
			navigation : {
				prevEl : '.promotion .swiper-prev',
				nextEl : '.promotion .swiper-next',
			},
		})
	</script>
</body>
</html>