<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="데이터넣기" onclick="input()">
	<script type="text/javascript">
	
	function input() {
		location.href = "/monami/test?cmd=classData";
	}
	
	</script>
</body>
</html>