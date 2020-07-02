<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/class.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="js/index.js"></script>
<title>Monami Class</title>
</head>
<body>
	<div class="main__container">
	
		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>
		
		<div class="l-popup__buttons">
		  <a class="l-popup__button" href="http://monamiconcept.com/reservation/" target="_blank"><div class="l-popup__button-txt">예약하기</div></a>
		  <a class="l-popup__button--close" onclick="jQuery(this).parent().hide(); return false;" href="#">예약하기 버튼 닫기</a>
		</div>
		
		<section class="class__menu__wrap">
			<ul class="class__menu">
				<p>ONEDAY CLASS</p>
				<li style="font-weight:900; font-size:20px; padding:10px 0;"><a href="#">이벤트</a></li>
				<li style="font-weight:900; font-size:20px; padding:10px 0;"><a href="#">원데이 클래스</a></li>
			</ul>
		</section>

		<section class="class__con__wrap">
			<div class="class__con1"></div>
			<div class="class__con2"></div>
			<div class="class__con3"></div>
			<div class="class__con4"></div>
			<div class="class__con5"></div>
			<div class="class__con6"></div>
			<div class="class__con7"></div>
			<div class="class__con8"></div>
			<div class="class__con9"></div>
			<div class="class__con10"></div>
			<div class="class__con11"></div>
			<div class="class__con12"></div>
			<div class="class__con13"></div>
			<div class="class__con14"></div>
		</section>
		
		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>
		
	</div>
</body>
</html>