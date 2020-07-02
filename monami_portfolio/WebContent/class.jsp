<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<li style="font-weight:900; font-size:20px; padding:10px 0;">모나미에서 다양한 클래스를 만나보세요</li>
<!-- 				<li style="font-weight:900; font-size:20px; padding:10px 0;"><a href="#">원데이 클래스</a></li> -->
			</ul>
		</section>

		<section class="class__con__wrap">
		<c:forEach var="classItem" items="${classes}">
			<div class="class__con${classItem.id}" style="background-size:100%; background-image:url('${classItem.imgUrl}'); cursor:pointer;" OnClick="location.href ='${classItem.alink}'">
			</div>
		</c:forEach>
		</section>
		
		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>
	</div>
</body>
</html>