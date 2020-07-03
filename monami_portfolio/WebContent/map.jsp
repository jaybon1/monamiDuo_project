<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/map.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1skwdhjb4c"></script>
<title>map</title>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>
		
		<div class="l-popup__buttons">
		  <a class="l-popup__button" href="http://monamiconcept.com/reservation/" target="_blank"><div class="l-popup__button-txt">예약하기</div></a>
		  <a class="l-popup__button--close" onclick="jQuery(this).parent().hide(); return false;" href="#">예약하기 버튼 닫기</a>
		</div>

		<section class="map__main">
			<div>
				<img src="http://monamiconcept.com/wp-content/uploads/2017/12/2222.jpg">
			</div>
			<div>
				<img src="http://monamiconcept.com/wp-content/uploads/2017/12/1111.jpg">
			</div>
		</section>

		<section class="map__con1">
			<div class="map__con1__img" data-aos="fade-up" data-aos-duration="500">
				<h2>모나미 컨셉스토어</h2>
				<button class="view__more">VIEW MORE</button>
			</div>
			<div class="map__con1__txt" data-aos="fade-up" data-aos-duration="1000">
				<a><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/allmain/thema3/60/2020060414124366103.jpg" /></a>
				<h3>무료한 일상의 재발견, 모나미 스토어</h3>
				<p>펜, 종이 그리고 모나미</p>
				<span class="tag">#모나미</span><span class="tag">#모나미스토어</span>
			</div>
		</section>

		<section class="map_sec2" data-aos="fade-right" data-aos-duration="1500">
			<div class="map__con2">
				<h2>찾아오시는 길</h2>
				<p>해당 지점을 클릭하시면 지점 위치를 확인 하실 수 있습니다.</p>
				<div class="map__api">
					<div id="map" style="width: 534px; height: 418px;"></div>
				</div>
				<div class="map__tit">
					<h3>
						<!-- javascript:void(0) a태그의 무효화 -->
						<a href="javascript:void(0);" onclick="changeMap(0)">본사 수지점 [스토리 연구소]</a>
					</h3>
					<h3>
						<a href="javascript:void(0);" onclick="changeMap(1)">인사동점 [스토리 연구소]</a>
					</h3>
					<h3>
						<a href="javascript:void(0);" onclick="changeMap(2)">롯데백화점 부산점[워크룸]</a>
					</h3>
					<h3>
						<a href="javascript:void(0);" onclick="changeMap(3)">에버랜드점 [꿈의 공장]</a>
					</h3>
					<h3>
						<a href="javascript:void(0);" onclick="changeMap(4)">DDP점 [일,월, 년. 삶의 기록]</a>
					</h3>
					<h3>
						<a href="javascript:void(0);" onclick="changeMap(5)">MCC 합정</a>
					</h3>
				</div>
			</div>
		</section>

		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
	<script>
	
		/*var mapOptions = {
		 center: new naver.maps.LatLng(35.1559322, 129.0587823),
		 zoom: 17
		 };*/
		//모나미 본사
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.335537, 127.100666),
			zoom : 15
		});

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(37.335537, 127.100666),
			map : map
		});
		
		function changeMap(num) {
			
			var lat;
			var lng;
			
			if(num == 0){ // 본사
				lat = 37.335537;
				lng = 127.100666;
			} else if(num == 1){ // 인사동점
				lat = 37.574385;
				lng = 126.983736;
			} else if(num == 2){ // 롯데백화점
				lat = 35.156842;
				lng = 129.056675;
			} else if(num == 3){ // 에버랜드
				lat = 37.294088;
				lng = 127.202528;
			} else if(num == 4){ // ddp
				lat = 37.574385;
				lng = 126.983736;
			} else if(num == 5){ // 합정
				lat = 37.546313;
				lng = 126.914180;
			}
			
			map = new naver.maps.Map('map', {
				center : new naver.maps.LatLng(lat, lng),
				zoom : 15
			});

			marker = new naver.maps.Marker({
				position : new naver.maps.LatLng(lat, lng),
				map : map
			});
		}

	</script>
	<script src="js/index.js"></script>
	
	<script>
		AOS.init();
	</script>

</body>
</html>