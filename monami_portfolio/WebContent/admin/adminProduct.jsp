<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/order.css">
<link rel="stylesheet" href="css/default.css">
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
						<li class="lnb-depth1"><a href="http://localhost:8000/monami/admin?cmd=product&page=0">상품관리</a></li>
						<li class="lnb-depth1"><a href="http://localhost:8000/monami/admin?cmd=users">회원관리</a></li>
						<li class="lnb-depth1"><a href="#">주문관리</a></li>
					</ul>
				</div>
				<div class="cont-area">
					<section class="lately">
						<div style="display: flex; justify-content: space-between;">
							<h4 class="tit">상품관리</h4>
							<input id="inputName" type="text" placeholder="상품명을 입력하세요">
							<button type="button" class="btn btn-primary" onclick="searchByName()">상품검색</button>
							<button type="button" class="btn btn-info" onclick="insertItem()">상품등록</button>
						</div>
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
									    <tbody id="itemTbody">
									    
									    	<c:forEach var="item" items="${itemList}">
										      <tr>
										        <td>${item.value }</td>
										        <td>${item.name }</td>
										        <td>${item.price }</td>
										        <td>
											        <button type="button" class="btn btn-secondary"onclick="updateItem(${item.id}, ${page})">상품수정</button>
											        <button type="button" class="btn btn-danger" onclick="deleteItem(${item.id}, ${page})">상품삭제</button><span></span>
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
		<ul class="pagination justify-content-center">

		<c:choose>
			<c:when test="${listSize < 20}">
				<li class="page-item"><a class="page-link" href="http://localhost:8000/monami/admin?cmd=product&page=${page-1}">Previous</a></li>
				<li class="page-item disabled"><a class="page-link" href="http://localhost:8000/monami/admin?cmd=product&page=${page+1}">Next</a></li>
			</c:when>

			<c:when test="${param.page == 0}">
				<li class="page-item disabled"><a class="page-link" href="http://localhost:8000/monami/admin?cmd=product&page=${page-1}">Previous</a></li>
				<li class="page-item"><a class="page-link" href="http://localhost:8000/monami/admin?cmd=product&page=${page+1}">Next</a></li>
			</c:when>

			<%-- 			<c:when test="${boards.size() < 3}"> --%>

			<c:otherwise>
				<li class="page-item"><a class="page-link" href="http://localhost:8000/monami/admin?cmd=product&page=${page-1}">Previous</a></li>
				<li class="page-item"><a class="page-link" href="http://localhost:8000/monami/admin?cmd=product&page=${page+1}">Next</a></li>
			</c:otherwise>

		</c:choose>
	</ul>
	<br />
	<br />
	<br />
		
		<!-- footer 영역 -->
		<%@include file="../include/footer.jsp"%>

	</div>
	<script type="text/javascript">
		
		function searchByName() {
			
			var name = $("#inputName").val();
			
			$.ajax({

				type : "get",
				url : "/monami/admin?cmd=productSearchProc&name=" + name,
				dataType: "json"

			}).done(function(resultList) {
				
				if(resultList != null && resultList.length > 0){
					
					$("#itemTbody").empty();
					
					for (let result of resultList) {
						
						var string = "                               <tr>\r\n" + 
						"										        <td>"+result.value+"</td>\r\n" + 
						"										        <td>"+result.name+"</td>\r\n" + 
						"										        <td>"+result.price+"</td>\r\n" + 
						"										        <td>\r\n" + 
						"											        <button type=\"button\" class=\"btn btn-secondary\"onclick=\"updateItem("+result.id+", "+result.page+")\">상품수정</button>\r\n" + 
						"											        <button type=\"button\" class=\"btn btn-danger\" onclick=\"deleteItem("+result.id+", "+result.page+")\">상품삭제</button><span></span>\r\n" + 
						"										        </td>\r\n" + 
						"										     </tr>";
							
						$("#itemTbody").append(string);
					}
					
					$(".pagination").remove();
					
				} else {
					alert("해당 상품이 없습니다.");
				}
				

			}).fail(function(error) {
				alert("검색 실패");
			});
			
		}
	
		function insertItem() {
			
			window.open("/monami/admin?cmd=productInput", "", "width=600,height=800", "left=500,top=400");
			
		}
		
		function updateItem(id, page) {
			
			window.open("/monami/admin?cmd=productUpdate&id="+id+"&page="+page, "", "width=600,height=800", "left=500,top=400");
			
		}
	
		function deleteItem(id, page) {
			
			location.href = "/monami/admin?cmd=productDeleteProc&id="+id+"&page="+page;
			
		}
	
	</script>
	<script src="js/index.js"></script>

</body>
</html>