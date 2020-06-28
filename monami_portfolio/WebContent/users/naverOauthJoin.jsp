<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>loginPage</title>
<link rel="stylesheet" href="/monami/css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
<%@include file="/css/join.css"%>
</style>
</head>

<body>

	<div id="main_container">
		
		<!-- header 영역 -->
		<%@include file="/include/header.jsp"%>

		<div id="join">
			<div id="join_form">
				<!--회원가입 폼-->
				<form class="join_form_con" action="/monami/oauth/naver?cmd=joinProc" method="post">
					<h3 class="join" style="letter-spacing: -1px;">네이버 로그인 추가 정보</h3>
					<hr>
					
					<!--아이디-->
					<p class="join_p">username</p>
					<input value="${naverProfile.response.id}_naver" type="text" id="username" name="username" placeholder="아이디" class="size" 
						style="background:rgba(0,0,0,0.2)" required readonly>
					<p></p>
					
					
					<p class="join_p">E-mail</p> 
					 <c:choose>
					    <c:when test="${empty naverProfile.response.email}">
					    	<input type="email" id="email" name="email" placeholder="이메일" class="size" required>
					    </c:when>
					    <c:otherwise>
					    	<input value="${naverProfile.response.email}" type="email" class="size" id="email" placeholder="Enter Email" name="email" required>
					    </c:otherwise>
	   				 </c:choose>
					

					<!--전화번호-->
					<p class="join_p">Mobile Phone</p> 
						<select class="size num1" name="tel">
							<option value="skt" selected>SKT</option>
							<option value="kt" selected>KT</option>
							<option value="lg" selected>LG</option>
						</select> 
					<input type="number" id="phonenumber" name="phonenumber" placeholder="-빼고 숫자만 입력" class="size num2" required>
					
					
					
					
				
					<!--주소-->
					<p class="join_p">Address</p>
					<input type="text" id="address" name="address" placeholder="주소" class="size" style="width:220px; margin-bottom: 10px">
					<button type="button" class="jusoBtn" onClick="goPopup();">검색</button>
					
					<br>
					
					<p>
						<input type="submit" value="회원가입 완료" class="btn" style="background:#2DB400;">
					</p>
				</form>

				<hr>
				<p class="find">
					<span><a href="/monami/users?cmd=login">로그인 페이지로 이동</a></span>
				</p>
			</div>
		</div>
	<script src="/blog/js/join.js"></script>	
	</div>
	
	<%@ include file="/include/footer.jsp" %>
	<script>
		alert("주소와 전화번호 입력이 필요합니다.");
	</script>
</body>
</html>