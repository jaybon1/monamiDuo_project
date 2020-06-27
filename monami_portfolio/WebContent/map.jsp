<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/map.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>map</title>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>

		<section class="map__main">
			<div>
				<img src="http://monamiconcept.com/wp-content/uploads/2017/12/2222.jpg">
			</div>
			<div>
				<img src="http://monamiconcept.com/wp-content/uploads/2017/12/1111.jpg">
			</div>
		</section>

		<section class="map__con1">
			<div class="map__con1__img">
				<h2>모나미 컨셉스토어</h2>
				<button class="view__more">VIEW MORE</button>
			</div>
			<div class="map__con1__txt">
				<a><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/allmain/thema3/60/2020060414124366103.jpg" /></a>
				<h3>무료한 일상의 재발견, 모나미 스토어</h3>
				<p>펜, 종이 그리고 모나미</p>
				<span class="tag">#모나미</span><span class="tag">#모나미스토어</span>
			</div>
		</section>

		<section class="map_sec2">
			<div class="map__con2">
				<h2>찾아오시는 길</h2>
				<p>해당 지점을 클릭하시면 지점 위치를 확인 하실 수 있습니다.</p>
				<div class="map__api">
					<a href=#><img src="http://prt.map.naver.com/mashupmap/print?key=p1512648006831_-1492038271"></a>
				</div>
				<div class="map__tit">
					<h3>
						<a href="#">본사 수지점 [스토리 연구소]</a>
					</h3>
					<h3>
						<a href="#">인사동점 [스토리 연구소]</a>
					</h3>
					<h3>
						<a href="#">롯데백화점 부산점[워크룸]</a>
					</h3>
					<h3>
						<a href="#">에버랜드점 [꿈의 공장]</a>
					</h3>
					<h3>
						<a href="#">DDP점 [일,월, 년. 삶의 기록]</a>
					</h3>
					<h3>
						<a href="#">MCC 합정</a>
					</h3>
				</div>
			</div>
		</section>

		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
	<script src="js/index.js"></script>

</body>
</html>