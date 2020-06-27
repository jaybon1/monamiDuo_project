<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>joinPage</title>
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
	<%@include file="../css/join.css"%>
</style>
</head>

<body>
	<div id="main_container">
		
		<!-- header 영역 -->
		<%@include file="../include/header.jsp"%>

		<div id="join">
			<div id="join_form">
				<!--회원가입 폼-->
				<form class="join_form_con" action="/monami/users?cmd=updateProc" method="post">
					<h3 class="join" style="letter-spacing: -1px;">회원기본정보</h3>
					<hr>
					<input type="hidden" name="id" value="${sessionScope.principal.id}"/>
					
					<!--아이디-->
					<p class="join_p">username</p>
					<input value="${sessionScope.principal.username}" type="text" id="username" name="username" placeholder="아이디" class="size form-control" readonly>
					<p></p>
					

					<!--비밀번호-->
					<p class="join_p">Password</p> 
					<input type="password" id="password" name="password" placeholder="비밀번호" class="size" required>

					<!--전화번호-->
					<p class="join_p">Mobile Phone</p> 
						<select class="size num1">
							<option value="1" selected>SKT</option>
							<option value="2" selected>KT</option>
							<option value="3" selected>LG</option>
						</select> 
					<input value="${sessionScope.principal.phonenumber}" type="number" id="phonenumber" name="phonenumber" placeholder="-빼고 숫자만 입력" class="size num2" required>
					
					
					<!--이메일-->
					<p class="join_p">E-mail</p> 
					<input value="${sessionScope.principal.email}" type="email" id="email" name="email" placeholder="이메일" class="size" required>
					
					
					<!--주소-->
					<p class="join_p">Address</p>
					<input value="${sessionScope.principal.address}" type="text" id="address" name="address" placeholder="주소" class="size" style="width:220px; margin-bottom: 10px">
					<button type="button" class="jusoBtn" onClick="goPopup();">검색</button>
					
					<br>
					
					<p>
						<input type="submit" value="확인" class="btn">
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
</body>
</html>