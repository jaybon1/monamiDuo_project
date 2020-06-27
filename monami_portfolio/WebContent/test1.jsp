<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/monami/test?cmd=test" method="post">
		<input name="url" type="text"> 
		<select name="value" id="value">
			<option value="prPen">프리미엄펜</option>
			<option value="pen">펜/펜슬</option>
			<option value="mark">마카</option>
			<option value="brush">컬러링/브러쉬</option>
			<option value="designSt">디자인문구</option>
		</select>
		<button type="submit">데이터넣기</button>
	</form>
</body>
</html>