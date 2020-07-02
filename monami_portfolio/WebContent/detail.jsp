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
		
		<div class="l-popup__buttons">
		  <a class="l-popup__button" href="http://monamiconcept.com/reservation/" target="_blank"><div class="l-popup__button-txt">예약하기</div></a>
		  <a class="l-popup__button--close" onclick="jQuery(this).parent().hide(); return false;" href="#">예약하기 버튼 닫기</a>
		</div>

		<section style="text-align: center; margin: 150px 0;">
			<div class="product_info">
				<div class="product_img">
					<a href="#">
						<img alt="이미지" src="${idd.imgUrl}">
					</a>
				</div>
				<div class="product_txt">
					<h2>
						<a class="product_tit" href="/monami/board?cmd=about">Monami / 모나미</a> <strong>${idd.name}</strong>
					</h2>

					<table class="product-table">
						<tbody class="pinfo-txt">
							<!-- 바디컬러 -->
							<c:choose>
								<c:when test="${empty idd.bodyColorList}">
								</c:when>
								<c:otherwise>
									<tr class="info-color">
										<th>바디컬러</th>
										<td>
											<ul class="info-color-detail">
												<li>
													<c:forEach var="bodyColor" items="${idd.bodyColorList}">
														<img src="${bodyColor.url}" alt="" class="loading" data-was-processed="true">
														<span>${bodyColor.name}</span>
													</c:forEach>
												</li>
											</ul>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>	
							
							<!-- 잉크컬러 -->
							<c:choose>
								<c:when test="${empty idd.inkColorList}">
								</c:when>
								<c:otherwise>
								<tr class="info-color">
									<th>잉크컬러</th>
									<td>
										<ul class="info-color-detail">
											<li>
												<c:forEach var="inkColor" items="${idd.inkColorList}">
												<img src="${inkColor.url}" alt="" class="loading" data-was-processed="true">
												<span>${inkColor.name}</span>
												</c:forEach>
											</li>
										</ul>
									</td>
								</tr>
								</c:otherwise>
							</c:choose>
						
						
							<!-- 심 두께 및 스펙 -->
							<c:choose>
								<c:when test="${empty idd.productSpecList}">
								</c:when>
								<c:otherwise>
									<tr class="info-weight">
										<th>심 두께 및스펙</th>
										<td>
											<ul>
												<li>
													<c:forEach var="productSpec" items="${idd.productSpecList}">
													<img src="${productSpec.url}" alt="" class="loading" data-was-processed="true">
													<span>${productSpec.name}</span>
													</c:forEach>
												</li>
											</ul>
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
							
							<!-- 특징 -->
							<c:choose>
								<c:when test="${empty idd.charac}">
								</c:when>
								<c:otherwise>
								<tr>
									<th>특징</th>
									<td>${idd.charac}</td>
								</tr>
								</c:otherwise>
							</c:choose>
							
							<!-- 주요특징 -->
							<c:choose>
								<c:when test="${empty idd.mainCharacList}">
								</c:when>
								<c:otherwise>
								<tr class="info-spec">
									<th>주요특징</th>
									<td>
										<c:forEach var="mainCharac" items="${idd.mainCharacList}">
										<span>${mainCharac}</span>
										</c:forEach>
									</td>
								</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						
						<!-- 판매가 -->
						<c:choose>
						<c:when test="${empty idd.price}">
						</c:when>
						<c:otherwise>
							<tbody class="info-price">
								<tr>
									<th>판매가</th>
									<td>
										<span class="txt-price">
										<em>${idd.price}</em>원
										</span>		
									</td>
								</tr>
							</tbody>
						</c:otherwise>
						</c:choose>
						
						<tbody class="info-cart-buy">
							<tr>
								<td class="info-cart-buy-name" style="padding-right:30px;">${idd.name}</td>
								<td style="width:90px;">
									<button onclick="mousedown(${idd.price})" type="button" class="btn-down" style="background-position: -200px -8px;">수량 낮추기</button>
									<!-- 수량이 컴파일 후 변화하기 때문에, 자바스크립트로 따로 빼준다. -->
									<input readonly title="수량입력" value="1" id="selCnt">
									<button onclick="mouseup(${idd.price})" type="button" class="btn-up" style="background-position: -200px -28px;">수량 높이기</button>
								</td>
								
							</tr>
							<tr>
								<td></td>
								<td class="info-cart-buy-price" style="padding-left:400px;">
										<span style="font-size:20px;">총 상품금액</span>
										<strong class="price">${idd.price}</strong>원
								</td>
							</tr>
						</tbody>
					</table>
					<div class="product-btn">
<!-- 					html에서 다른 태그의 바뀐정보를 가져올 수 없기 때문에 onclick에 자바스크립트 함수를 넣어서 처리한다 -->
						<button type="button" class="btn-gray btn-cart"  onclick="cart(${sessionScope.principal.id}, ${idd.id})">장바구니 담기</button>
						<button type="button" class="btn-black btn-buy" onclick="_orderGoods();">바로 구매하기</button>
					</div>
				</div>
				
			</div>
			
			<div>
			
			<!-- 상세이미지 -->
			<c:choose>
				<c:when test="${empty idd.detailImgUrl}">
				</c:when>
				<c:otherwise>
					<img src="${idd.detailImgUrl}">
				</c:otherwise>
			</c:choose>	
			</div>
		</section>

		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>


		<script type="text/javascript">
			function cart(userId, itemId){
				var amount = $('#selCnt').val();
				
				location.href = "/monami/cart?cmd=cartProc&userId="+userId+"&itemId="+itemId+"&amount="+amount;
				
			}
		</script>
	</div>
</body>
</html>