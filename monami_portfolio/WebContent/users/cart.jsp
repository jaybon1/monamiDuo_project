<%@page import="java.util.ArrayList"%>
<%@page import="com.monami.dto.CartDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>cart</title>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="../include/header.jsp"%>

		<section class="cart__con1 order cart" id="contents">
			<div class="cart__con1__img">
				<h2>장바구니</h2>
			</div>
			<div class="info">
				<h4>
					<b>${principal.username}</b>님의 장바구니 목록입니다.
				</h4>
			</div>

			<div class="inner cartcon">
				<!-- 일반장바구니// -->
				<h3>장바구니 목록</h3>
				<ul class="infotxt">
					<li>모나미 배송상품과 업체배송상품은 배송비가 별도로 부과되며, 산간도서지역은 추가 배송비가 발생됩니다.</li>
					<li>장바구니에 담긴 상품은 최대 30일까지 보관되며 30일 경과 시 자동 삭제됩니다.</li>
				</ul>

				<div class="form-area">
					<form class="form-area-con">
						<fieldset class="list-field">
<!-- 							<legend class="hide">장바구니</legend> -->

							<table>
								<caption>장바구니 목록</caption>
								<colgroup>
									<col style="width: 40px">
									<col style="width: 96px">
									<col>
									<col style="width: 120px">
									<col style="width: 110px">
									<col style="width: 120px">
									<col style="width: 120px">
									<col style="width: 110px">
									<col style="width: 110px">
								</colgroup>

								<thead>
									<tr>
										<th><label><input type="checkbox" class="small" id="chkCartAll"><span></span><span class="hide"></span></label></th>
										<th colspan="2">상품명</th>
										<th>상품금액</th>
										<th>수량</th>
										<th>주문금액<small>(할인금액)</small></th>
										<th>업체</th>
										<th>배송비</th>
										<th>주문</th>
									</tr>
								</thead>

								<tbody>
								<!-- 장바구니 목록 -->
								<c:forEach var="dto" items="${sessionScope.cartDtos}">
									<tr>
										<td><label><input type="checkbox" name="cartIdx" ><span></span></label></td>
										<td><figure>
												<img src="${dto.item.imgUrl}" onerror="this.src='/w/images/80x80.jpg'" alt="" class="loading">
											</figure></td>
										<td>
											<div class="info-area">
												${dto.item.name}
											</div>
										</td>
										<td class="txt-right"><em>${dto.item.price}</em>원</td>



										<td>
											<div class="ea-area">
												<input type="number" name="goodsCnt" id="goodsCnt_190815" title="수량 입력" value="${dto.cart.amount}" readonly>
												<button type="button" class="btn-down" onclick="removeCnt(this);">수량 낮추기</button>
												<button type="button" class="btn-up" onclick="addCnt(this);">수량 올리기</button>
											</div>
											<button type="button" class="btn-whitegray small" onclick="changeCnt('190815');">변경</button>

										</td>
										<td class="txt-right"><em class="cartAllPrice">${dto.allPrice }</em>원<small>(0원)</small></td>


										<td><small> 모나미배송 <span class="deliveryinfo"> <a href="#" class="btn-popinfo type-over"><strong>!</strong></a>
											</span>
										</small></td>


										<td class="txt-right"><em>0</em>원 <span class="deliveryinfo"><a href="#" class="btn-popinfo type-over"><strong>!</strong></a>
										</span></td>

										<td class="btn">

											<button type="button" class="btn-gray small" onclick="orderCheck('190815');">바로주문</button>

											<button type="button" class="btn-whitegray small" onclick="removeCart('190815');">삭제</button>
										</td>
									</tr>
								</c:forEach>

								</tbody>
							</table>

							<div class="btn-area">
								<label><input type="checkbox" class="small" id="chkCartAll2"><span></span><span class="hide">전체선택</span></label>

								<button type="button" class="btn-gray small" onclick="addWishList();">찜하기</button>

								<button type="button" class="btn-whitegray small" onclick="removeSelected();">선택삭제</button>
							</div>
						</fieldset>

						<fieldset class="price-field">
<!-- 							<legend class="hide">결제내역</legend> -->
							<dl class="orderprice">
								<dt>상품금액</dt>
								<dd>
									<em id="totalPrice">20,000</em>원
								</dd>
							</dl>
							<dl class="discount">
								<dt>할인금액</dt>
								<dd>
									<em id="totalDiscountPrice">0</em>원
								</dd>
							</dl>
							<dl class="shipping">
								<dt>배송비</dt>
								<dd>
									<em id="deliveryPrice">0</em>원
								</dd>
							</dl>
							<dl class="total">
								<dt>총 결제금액</dt>
								<dd>
									<em id="totalPayPrice">20,000</em>원
								</dd>
							</dl>
						</fieldset>

						<div class="btn-area">

<!-- 							<a href="#popCartClubSelect" class="btn-gray" onclick="addClubCartPop();">클럽장바구니담기</a> -->


							<button type="button" class="btn-whitegray" onclick="orderSelected();">선택상품주문</button>
							<button type="button" class="btn-black" onclick="orderTotal();">전체상품주문</button>
						</div>
					</form>
				</div>
				<!-- //일반장바구니 -->

			</div>
		</section>
		<!-- footer 영역 -->
		<%@include file="../include/footer.jsp"%>

	</div>
	
	
	<script>
	
		function sumPrice() {
			var sumPrice = 0;
			for (var i = 0; i < $(".cartAllPrice").length; i++) {
				sumPrice = sumPrice + Number($(".cartAllPrice").get(i).textContent);
			}
			
			$("#totalPayPrice").text(sumPrice);			
		}
		
		sumPrice();
		
		
	
	</script>
	
	<script src="js/index.js"></script>
	<script src="js/cart.js"></script>

</body>
</html>