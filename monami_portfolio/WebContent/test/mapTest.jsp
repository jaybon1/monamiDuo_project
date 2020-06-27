<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=1skwdhjb4c"></script>
</head>
<body>
	<div id="map" style="width: 534px; height: 418px;"></div>

	<script>
	
		/*var mapOptions = {
		 center: new naver.maps.LatLng(35.1559322, 129.0587823),
		 zoom: 17
		 };*/
		//부산it교육센터
		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(35.156048, 129.059557),
			zoom : 15
		});

		var marker = new naver.maps.Marker({
			position : new naver.maps.LatLng(35.156028, 129.059557),
			map : map
		});

	</script>
</body>
</html>