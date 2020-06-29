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
<title>Monami Product</title>
</head>
<body>
	<div class="main__container">

		<!-- header 영역 -->
		<%@include file="include/header.jsp"%>

		<section class="product__menu__wrap">
			<div class="product__menu">
				<p>PRODUCT</p>
				<ul>
					<li class="product__tit prPen" onclick="productList('prPen')" style="font-weight: 900; font-size: 20px; padding: 10px 0; cursor: pointer;">프리미엄 펜</li>
					<li><a href="#">153프리미엄</a></li>
					<li><a href="#">데스크펜/스마트펜</a></li>
					<li><a href="#">파카</a></li>
					<li><a href="#">카렌다쉬</a></li>
					<li><a href="#">카웨코</a></li>
					<li><a href="#">매뉴스크립트</a></li>
				</ul>

				<ul>
					<li class="product__tit pen" onclick="productList('pen')" style="font-weight: 900; font-size: 20px; padding: 10px 0; cursor: pointer;">펜/펜슬</li>
					<li><a href="#">볼펜</a></li>
					<li><a href="#">수성펜/사인펜</a></li>
					<li><a href="#">연필/샤프</a></li>
					<li><a href="#">형광펜</a></li>
				</ul>

				<ul>
					<li class="product__tit mark" onclick="productList('mark')" style="font-weight: 900; font-size: 20px; padding: 10px 0; cursor: pointer;">마카</li>
					<li><a href="#">네임펜/유성매직</a></li>
					<li><a href="#">생활/보드마카</a></li>
					<li><a href="#">패브릭/세라믹마카</a></li>
				</ul>

				<ul>
					<li class="product__tit brush" onclick="productList('brush')" style="font-weight: 900; font-size: 20px; padding: 10px 0; cursor: pointer;">컬러링/브러쉬</li>
					<li><a href="#">컬러링펜</a></li>
					<li><a href="#">브러쉬펜</a></li>
					<li><a href="#">미술용품</a></li>
				</ul>

				<ul>
					<li class="product__tit designSt" onclick="productList('designSt')" style="font-weight: 900; font-size: 20px; padding: 10px 0; cursor: pointer;">디자인 문구</li>
					<li><a href="#">몰스킨</a></li>
					<li><a href="#">다이어리/노트</a></li>
					<li><a href="#">카드/봉투</a></li>
					<li><a href="#">파우치</a></li>
					<li><a href="#">풀/스티커/테이프</a></li>
					<li><a href="#">스탬프</a></li>
				</ul>
			</div>
		</section>

		<section class="product__con__wrap">
			<!-- items:모델 / itemss:list배열 -->
			<c:forEach var="items" items="${itemss}">
				<div id="product__con" style="background:url('${items.imgUrl}') no-repeat; background-size:contain; cursor:pointer">
					<a href="/monami/board?cmd=productDetail">
						<span class="info"> 
							<span class="txt_brand">Monami / 모나미</span> 
							<span class="txt-ti">${items.name}</span>
						</span> <span class="txt-price">${items.price}</span> 
						<span class="tag"></span>
					</a>
				</div>
			</c:forEach>
		</section>


		<script>
		
		var listAmount = 40;
		var status = 0;
	
		$(window).scroll(function() {
			
		// 스크롤이 80% 이상이 되면 해당 컨텐츠가 자동 생성
		if(((window.scrollY + window.innerHeight) / $('body').prop("scrollHeight") * 100) > 80){
			if (status == 0) {
				status = 1;
			
			// 에이작스
			}		
		}
	});

		function productList(value){
			$.ajax({
				type:"get",
				url:"/monami/board?cmd=productList&value="+value,
				dataType:"json"
			}).done(function(result){
				console.log(result);
				$(".product__con__wrap").empty();

				// result의 product 가져오기 (forEach)
				for(var items of result) {

					var string = // 다른 곳 java파일에 ""안에 붙여넣으면 자동으로 string화 		
						"			<div class=\"product__con\" style=\"background:url('"+items.imgUrl+"') no-repeat; background-size:contain; cursor:pointer\">\r\n" + 
						"				<a href=\"/monami/board?cmd=productDetail\">" +
						"				<span class=\"info\">\r\n" + 
						"					<span class=\"txt_brand\">Monami / 모나미</span>\r\n" + 
						"					<span class=\"txt-ti\">"+items.name+"</span>\r\n" + 
						"				</span>\r\n" + 
						"				<span class=\"txt-price\">"+items.price+"</span>\r\n" + 
						"				<span class=\"tag\"></span>\r\n" + 
						"				</a>\r\n"	
						"			</div>"
						$(".product__con__wrap").append(string);					
					
				}
			}).fail(function(error){
				console.log(error);
			});
		}
		

		// 아코디언 메뉴 
// 		var acc = document.getElementsByClassName("product__tit");
// 		var i;

// 		for (i = 0; i < 5; i++) {
// 		  acc[i].addEventListener("click", function() {
// 		    this.classList.toggle("active");
// 		    var lis = this.nextElementSibling;
// 		    if (lis.style.display === "block") {
// 		    	lis.style.display = "none";
// 		    } else {
// 		    	lis.style.display = "block";
// 		    }
// 		  });
// 		}
		
		</script>

		<!-- footer 영역 -->
		<%@include file="include/footer.jsp"%>

	</div>
</body>
</html>