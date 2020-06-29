<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/detail.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="js/index.js"></script>
<title>Monami Product Detail</title>
<style type="text/css">
.product_info {
	display: flex;
	justify-content: center;
}

.product_txt {
	flex-wrap: wrap;
	justify-content: flex-start;
}

.product_tit {
	font-size: 16px;
	display: inline-block;
	width: 100%;
}

.product_txt strong {
	font-weight: 500;
	padding-bottom: 20px;
	border-bottom: 3px solid #111;
	letter-spacing: -3px;
}

.product_txt h2 {
	width: 100%;
}

.product_txt table{
/* 	width:100%; */
	margin:0 auto;
	text-align: left;
}


.product_txt table td{
	padding-left:25px;
	padding:20px 0px;
}

.product_color{
	display: flex;
}

.product_color li{
	padding-right: 30px;
}
</style>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>

		<section style="text-align: center; margin: 150px 0;">
			<!-- 나중에 따로 빼기 -->
			<div class="product_info">
				<div class="product_img">
					<a href="#"> <img alt="이미지" src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003497/main/MG000003497_REP_THUMB_540X540_20191206103812.blob">
					</a>
				</div>
				<div class="product_txt">
					<h2>
						<a class="product_tit" href="/monami/board?cmd=about">Monami / 모나미</a> <strong>[리필심증정] 153 블라썸</strong>
					</h2>

					<table>
						<tbody class="pinfo-txt">

							<tr class="info-color">
								<th>바디컬러</th>
								<td>
									<ul class="product_color">
										<li><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/23_58340_P_120x80.blob" alt="" class="loading" data-was-processed="true"><span>비올라</span></li>
										<li><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/23_58322_P_120x80.blob" alt="" class="loading" data-was-processed="true"><span>피오니</span></li>
									</ul>
								</td>
							</tr>


							<tr class="info-color">
								<th>잉크컬러</th>
								<td>
									<ul>
										<li><img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/303_58462_P_120x80.blob" alt="" class="loading" data-was-processed="true"><span>블랙</span></li>
									</ul>
								</td>
							</tr>
							
							<tr class="info-spec">
								<th>판매가</th>
								<td>20,000원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/editor/77e61afd-7de2-6047-2845-fa4a733e21ac/20200414143538_P.jpg">
		</section>

		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
</body>
</html>