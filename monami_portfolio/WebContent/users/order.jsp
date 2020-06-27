<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="css/order.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>order</title>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="../include/header.jsp"%>

		<section class="order__con1">
			<div class="order__con1__img">
				<h2>주문관리</h2>
			</div>
			<div class="info">
				<h4><b>${principal.username}</b>님의 주문내역입니다.</h4>
			</div>
			
			<div class="mypage-inner">
				<div class="lnb-area">
					<ul>
						<li class="lnb-depth1"><a href="#">주문목록/배송</a></li>
						<li class="lnb-depth1"><a href="#">취소/교환/반품조회</a></li>
						<li class="lnb-depth1"><a href="#">정기배송설정</a></li>
						<li class="lnb-depth1"><a href="#">결제관리</a></li>
						<li class="lnb-depth1"><a href="#">재입고알림내역</a></li>
					</ul>
				</div>
				<div class="cont-area">
					<section class="lately">
						<h4 class="tit">최근 주문현황<span>최근 1개월</span></h4>
						<div class="btn-titarea">
							<a href="#" class="btn-more">주문목록보기</a>
						</div>
			
							
								<div class="step-wrap">
									<ol class="step">
										<li>
											<span class="tit">입금대기</span>
											<span class="num none">0</span>
										</li>
										<li>
											<span class="tit">결제완료</span>
											<span class="num">0</span>
										</li>
										<li>
											<span class="tit">상품준비중</span>
											<span class="num">0</span>
										</li>
										<li>
											<span class="tit">배송중</span>
											<span class="num">0</span>
										</li>
										<li>
											<span class="tit">배송완료</span>
											<span class="num">0</span>
										</li>
									</ol>
									<dl>
										<dt>취소</dt>
										<dd>0</dd>
										<dt>교환</dt>
										<dd>0</dd>
										<dt>반품</dt>
										<dd>0</dd>
									</dl>
								</div>
							
						
					</section>
				</div>
			</div>
		</section>
		<!-- footer 영역 -->
		<%@include file="../include/footer.jsp"%>

	</div>
	<script src="js/index.js"></script>

</body>
</html>