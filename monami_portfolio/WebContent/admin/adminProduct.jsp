<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/order.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<title>Admin</title>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="/include/header.jsp"%>

		<section class="order__con1">
			<div class="order__con1__img">
				<h2>관리자 페이지</h2>
			</div>
		
			
			<div class="mypage-inner">
				<div class="lnb-area">
					<ul>
						<li class="lnb-depth1"><a href="#">상품관리</a></li>
						<li class="lnb-depth1"><a href="#">회원관리</a></li>
						<li class="lnb-depth1"><a href="#">주문관리</a></li>
					</ul>
				</div>
				<div class="cont-area">
					<section class="lately">
						<h4 class="tit">상품관리</h4>
<!-- 						<div class="btn-titarea"> -->
<!-- 							<a href="#" class="btn-more">주문목록보기</a> -->
<!-- 						</div> -->
			
								<div class="step-wrap">
									<table class="table">
									    <thead>
									      <tr>
									        <th>상품분류</th>
									        <th>상품명</th>
									        <th>상품가격</th>
									        <th></th>
									      </tr>
									    </thead>
									    <tbody>
									    
									    	<c:forEach var="item" items="${itemList}">
										      <tr>
										        <td>${item.value }</td>
										        <td>${item.name }</td>
										        <td>${item.price }</td>
										        <td>
											        <button type="button" class="btn btn-secondary">상품수정</button>
											        <button type="button" class="btn btn-danger" onclick="">상품삭제</button><span></span>
										        </td>
										      </tr>
									    	</c:forEach>
									      	
									    </tbody>
									  </table>
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