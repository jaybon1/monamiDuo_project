<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Login Test</title>
<style type="text/css">
	.kakao{
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
</head>
<body>
	<div class="kakao">
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=b465c518547e52041228dd168891c8f0&redirect_uri=http://localhost:8000/monami/oauth/kakao?cmd=callback&response_type=code">
			<img src="../images/kakao_login.png">
		</a>
	</div>
</body>
</html>