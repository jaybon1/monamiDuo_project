<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/product.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="js/index.js"></script>
<title>Monami Product Detail</title>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>
		
		<section style="text-align:center; margin:150px 0;"> <!-- 나중에 따로 빼기 -->
			<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/editor/77e61afd-7de2-6047-2845-fa4a733e21ac/20200414143538_P.jpg">
		</section>
		
		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
</body>
</html>