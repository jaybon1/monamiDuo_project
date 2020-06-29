<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/detail.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
									<ul class="info-color-detail">
										<li>
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/23_58340_P_120x80.blob" alt="" class="loading" data-was-processed="true">
											<span>비올라</span>
										</li>
										<li>
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/23_58322_P_120x80.blob" alt="" class="loading" data-was-processed="true">
											<span>피오니</span>
										</li>
									</ul>
								</td>
							</tr>


							<tr class="info-color">
								<th>잉크컬러</th>
								<td>
									<ul class="info-color-detail">
										<li>
										<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/303_58462_P_120x80.blob" alt="" class="loading" data-was-processed="true">
											<span>블랙</span>
										</li>
									</ul>
								</td>
							</tr>

							<tr class="info-weight">
								<th>심 두께 및스펙</th>
								<td>
									<ul>
										<li>
											<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/attribute/24_58562_P_120x80.blob" alt="" class="loading" data-was-processed="true">
											0.7mm 
										</li>
									</ul>
								</td>
							</tr>


							<tr>
								<th>특징</th>
								<td>무광 메탈 소재, 고급리필심(FX-4000) 장착</td>
							</tr>

							<tr class="info-spec">
								<th>주요특징</th>
								<td>
								<span>프리미엄펜</span>
								<span>153시리즈</span>
								<span>각인서비스</span>
								<span>부드러운필기감</span>
								</td>
							</tr>
						</tbody>
						
						<tbody class="pinfo-price">
							<tr>
								<th>판매가</th>
								<td>
									<span class="txt-price"><em>20,000</em>원</span>		
								</td>
							</tr>
						</tbody>
						
					</table>
					<div class="product-btn">
						<button type="button" class="btn-gray btn-cart" onclick="_addCart();">장바구니 담기</button>
						<button type="button" class="btn-black btn-buy" onclick="_orderGoods();">바로 구매하기</button>
					</div>
				</div>
				
			</div>
			
			<div>
				<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/editor/77e61afd-7de2-6047-2845-fa4a733e21ac/20200414143538_P.jpg">
			</div>
			
<!-- 			<div class="review"> -->
<!-- 				<div class="review_info"> -->
<!-- 					<h2>전체리뷰</h2> -->
<!-- 					<h2>상품리뷰작성</h2> -->
<!-- 				</div> -->
<!-- 				<div class="review_con review_1"> -->
<!-- 					<div class="review_con_con">첫번째 후기</div> -->
<!-- 					<div class="review_con_con">첫번째 후기</div> -->
<!-- 					<div class="review_con_con">첫번째 후기</div> -->
<!-- 					<div class="review_con_con">첫번째 후기</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="review_con review_2"> -->
<!-- 					<div class="review_con_con">두번째 후기</div> -->
<!-- 					<div class="review_con_con">두번째 후기</div> -->
<!-- 					<div class="review_con_con">두번째 후기</div> -->
<!-- 					<div class="review_con_con">두번째 후기</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</section>

		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
</body>
</html>