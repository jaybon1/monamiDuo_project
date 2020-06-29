<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/about.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>About Monami</title>
</head>
<body>
	<div class="main__container">
		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>

		<section class="about__main bxslider">
			<div>
				<img src="images/about_main.jpg">
			</div>
			<div>
				<img src="images/about_main2.jpg">
			</div>
			<div>
				<img src="images/about_main3.jpg">
			</div>
		</section>

		<section class="about__con1">
			<div class="hideme top">
				<h2>
					펜, 종이 그리고 <b>모나미</b><br>평범하지만 특별합니다.
				</h2>
				<button class="view__more hideme" onclick="location.href='product.jsp' ">VIEW MORE</button>
			</div>
			<div class="hideme top">
				<a><img src="images/paper_bg.jpg" /></a>
			</div>
		</section>


		<section class="about__con2">
			<div class="about__con2__tit hideme right">
				<nav >모나미 소개</nav>
				<p>어쩌면 삶은 인생이라는 종이 위에 써 내려가는 펜의 기록 같습니다.</p>
			</div>
			<div class="about__con2__img hideme right">
				<a href="http://www.monamimall.com/"> <img src="images/pen1.png" />
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

		
		<section class="about__con3 hideme right">
			<p>'오래된 친구지만 항상 신선하고 놀라움으로 가득찬, 그리고 미래를 위해 쉼 없이 노력하는' 기업이 되고자 합니다. 모나미의 새로운 변화와 도전을 지켜봐 주시길 바라며, 앞으로도 변함없는 사랑과 격려를 부탁드립니다.</p>
			<p>
				<img src="images/logo.png">
			</p>
		</section>

		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
	<script src="js/index.js"></script>

</body>
</html>