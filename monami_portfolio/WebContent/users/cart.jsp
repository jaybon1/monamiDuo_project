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
									<tr>
										<td><label><input type="checkbox" name="cartIdx" id="cartIdx_0" value="190815" class="small" data-orderseq="1" data-sellercode="1350053" data-sellerfreeshippingyn="Y" data-sellerfreeshippingprice="20000"
												data-sellershippingprice="2500" data-packingsize="1" data-deliveryfee="0" data-deliveryfeetype="Y" data-rowcnt="1" data-goodsno="MG000003497" data-optionitemidx="64195" data-price="20000" data-gradediscountyn="Y"
												data-gradediscountprice="0" data-gradediscountprice1="0" data-addserviceyn="N" data-addserviceprice="0" data-addservicecontent="" data-directshipyn="N" onclick="calcPrice();"><span></span></label></td>
										<td><figure>
												<img src="https://d1bg8rd1h4dvdb.cloudfront.net/upload/imgServer/product/goods/MG000003497/main/MG000003497_REP_THUMB_80X80_20191206103813.blob" onerror="this.src='/w/images/80x80.jpg'" alt="" class="loading" data-was-processed="true">
											</figure></td>
										<td>
											<div class="info-area">
												<a href="/w/product/productDetail.do?goodsNo=MG000003497" class="txt-subject">[리필심증정] 153 블라썸</a> <span class="txt-option">리필심증정_비올라 </span> <a href="#popCartOption" class="btn-option" onclick="popOptionChange('190815');">옵션변경</a>

											</div>
										</td>
										<td class="txt-right"><em>20,000</em>원</td>



										<td>
											<div class="ea-area">
												<input type="number" name="goodsCnt" id="goodsCnt_190815" title="수량 입력" value="1" readonly="" data-stockcnt="18" data-convstockcnt="1" data-oldcnt="1">
												<button type="button" class="btn-down" onclick="removeCnt(this);">수량 낮추기</button>
												<button type="button" class="btn-up" onclick="addCnt(this);">수량 올리기</button>
											</div>
											<button type="button" class="btn-whitegray small" onclick="changeCnt('190815');">변경</button>

										</td>
										<td class="txt-right"><em id="payPrice_190815">20,000</em>원<small id="discountPrice_190815">(0원)</small></td>


										<td><small> 모나미배송 <span class="deliveryinfo"> <a href="#" class="btn-popinfo type-over"><strong>!</strong></a>
<!-- 													<div class="popinfo"> -->
<!-- 														<h4>배송정보</h4> -->
<!-- 														<p>16시 30분 이전 주문시 당일출고(공휴일,토/일요일제외)</p> -->
<!-- 													</div> -->
											</span>
										</small></td>


										<td class="txt-right"><em>0</em>원 <span class="deliveryinfo"> <a href="#" class="btn-popinfo type-over"><strong>!</strong></a>
<!-- 												<div class="popinfo"> -->
<!-- 													<h4>배송정보</h4> -->
<!-- 													<p> -->
<!-- 														16시 30분 이전 주문/결제 시 당일 발송<br> (업체배송, 각인 상품 제외 전 품목) -->
<!-- 													</p> -->
<!-- 												</div> -->
										</span></td>

										<td class="btn">

											<button type="button" class="btn-gray small" onclick="orderCheck('190815');">바로주문</button>

											<button type="button" class="btn-whitegray small" onclick="removeCart('190815');">삭제</button>
										</td>
									</tr>

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
	<script src="js/index.js"></script>
	<script src="js/cart.js"></script>

</body>
</html>