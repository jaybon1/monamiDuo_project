<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/about.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>About Monami</title>
</head>
<body>
	<div class="main__container">
		
		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>
		
		
		<!-- fixed ad 영역 -->
		<div class="l-popup__buttons">
		  <a class="l-popup__button" href="http://monamiconcept.com/reservation/" target="_blank">
		  <div class="l-popup__button-txt">예약하기</div>
		  </a>
		  <a class="l-popup__button--close" onclick="jQuery(this).parent().hide(); return false;" href="#">예약하기 버튼 닫기</a>
		</div>
		
		
		<!-- 메인 슬라이드 영역 -->
		<section class="about__main bxslider" style="cursor: pointer;">
			<div data-aos="fade-up">
			<span class="txt black" data-aos="fade-up" data-aos-duration="100">소소한 일상을 
				<br>
					기록하는 소소문구
					<small>파스텔 색상의 바디에 맞는 
					<br>문학과 회화에서 영감을 얻은 제품
					</small>
				</span>
				<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2020062516021827184.jpg">
			</div>
			
			<div>
				<span class="txt black" data-aos="fade-up" data-aos-duration="100">153 파스텔 펄
				<br>
					<small>파스텔 색상의 바디에 맞는 
					<br>5색의 잉크 컬러
					<br>
					</small>
				</span>
				<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2020070215075855904.jpg" >	
			</div>
			
			<div>
			<span class="txt black" data-aos="fade-up" data-aos-duration="100">디지털과 아날로그의 만남
				<br>
					작지만 똑똑한
					<small>153 스마트펜
					</small>
			</span>
			<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/stationerymain/banner/49/2020060109523998403.jpg">
			</div>
		</section>
		
		<!-- about__con0 영역 -->
		<section class="about__con0">
			<div class="about__con0_tit">
				<p class="about__con0_tit_big" data-aos="fade-up" data-aos-duration="500">더욱 새로워진 모나미를 만나보세요</p>
				<p class="about__con0_tit_small" data-aos="fade-up" data-aos-duration="500">모나미는 언제나 당신의 행복한 기록과 함께 합니다.</p>
			</div>
			<div class="about_con0_img1" data-aos="fade-up" data-aos-duration="1500">
				<a href="#">
					<img alt="콘텐츠 이미지1" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/allmain/thema2/58/2020061214341636321.jpg">
				</a>
			</div>
			<div class="about_con0_img2" data-aos="fade-up" data-aos-duration="1500"> 
				<a href="#">
					<img alt="콘텐츠 이미지2" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/allmain/thema2/58/2020070215055119288.jpg">
				</a>
			</div>
			<div class="about_con0_img3" data-aos="fade-up" data-aos-duration="1500">
				<a href="#">
					<img alt="콘텐츠 이미지3" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/allmain/thema1/57/2020062610180412626.jpg">
				</a>
			</div>
		</section>

		<!-- about__con1 영역 -->
		<section style="background:#f1f1f1; margin-top:100px;">
		<section class="about__con1">
			<div data-aos="fade-up">
				<h2>
					펜, 종이 그리고 <b>모나미</b><br>평범하지만 특별합니다.
				</h2>
				<button class="view__more" onclick="location.href='/monami/board?cmd=product'">VIEW MORE</button>
			</div>
			<div>
				<a href="#">
					<img src="images/paper_bg.jpg" />
				</a>
			</div>
		</section>
		</section>

		<!-- about__con2 영역 -->
		<section class="about__con2">
			<div class="about__con2__tit" data-aos="fade-up" data-aos-duration="500">
				<nav >모나미 소개</nav>
				<p>어쩌면 삶은 인생이라는 종이 위에 써 내려가는 펜의 기록 같습니다.</p>
			</div>
			<div class="about__con2__img" data-aos="fade-left" data-aos-offset="500" data-aos-duration="1000">
				<a href="http://www.monamimall.com/">
					<img src="images/pen1.png" />
					<p>모나미몰</p>
				</a>
				<a href="http://www.mon-arte.com/">
					<p>모나르떼</p>
				</a> 
				<a href="http://www.monamistation.com/main.do">
					<p>모나미 스테이션</p>
				</a> 
				<a href="http://www.monami.co.kr/art_contest/contest/introduction.asp">
					<p>모나미 환경사랑 미술대회</p>
				</a>
			</div>
		</section>

		
		<!-- about__con3 영역 -->
		<section class="about__con3" data-aos="fade-up">
			<p>'오래된 친구지만 항상 신선하고 놀라움으로 가득찬, 그리고 미래를 위해 쉼 없이 노력하는' 기업이 되고자 합니다. 모나미의 새로운 변화와 도전을 지켜봐 주시길 바라며, 앞으로도 변함없는 사랑과 격려를 부탁드립니다.</p>
			<p>
				<img src="images/logo.png">
			</p>
		</section>


		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
	<script src="js/index.js"></script>
	
	<script>
		AOS.init();
	</script>
	
</body>
</html>