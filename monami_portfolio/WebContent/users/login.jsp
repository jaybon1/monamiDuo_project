<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>loginPage</title>
<link rel="stylesheet" href="/monami/css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
<%@include file="../css/login.css"%>
</style>
</head>

<body>
	<div id="main_container">

		<!-- header 영역 -->
		<%@include file="../include/header.jsp"%>

		<div id="login">
			<div id="login_form">
				<!--로그인 폼-->
				<form action="/monami/users?cmd=loginProc" method="post" class="login_form_con">
					<h3 class="login" style="letter-spacing: -1px;">로그인</h3>

					<p>
						<input type="submit" value="google 로그인" class="btn" style="background-color: #217Af0">
					</p>
					
					<p>
						<input type="submit" value="naver 로그인" class="btn" style="background-color: #2DB400">
					</p>
					
					<p>
							<input type="button" value="kakao 로그인" class="btn" style="background-color: #ffe812; color:#000000;" onclick="kakao()">
					</p>
					<hr>
					
					<!-- 아이디, 비밀번호 -->
						<p class="login_p">username</p> 
						<input type="text" id="username" name="username" value="${cookie.remember.value}" placeholder="아이디 입력" class="size" required>
						<p></p>
						
						<p class="login_p">password</p> 
						<input type="password" name="password" placeholder="비밀번호 입력" class="size" required>

					<p>
						<input type="submit" value="로그인" class="btn">
					</p>
				</form>
				<hr>
				<p class="find">
					<span><a href="#">아이디 찾기</a></span>
					<span><a href="#">비밀번호 찾기</a></span> 
					<span><a href="/monami/users?cmd=join">회원가입</a></span>
				</p>
			</div>
			<div>
				<script>
				/*kakao*/
				function kakao(){
					window.open("https://kauth.kakao.com/oauth/authorize?client_id=b465c518547e52041228dd168891c8f0&redirect_uri=http://localhost:8000/monami/oauth/kakao?cmd=callback&response_type=code");
				}
				</script>
				
				<script src="js/index.js"></script>
			</div>
		</div>
		
		
	</div>	
</body>
</html>