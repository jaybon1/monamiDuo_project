<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>상품정보 등록</title>
<style type="text/css">
	input{width:100%;}
</style>
</head>
<body>
	<br />
	<div class="container">
		<form action="/monami/admin?cmd=productInputProc" method="post">
			<div class="text-center">
				<h2>상품등록</h2>
				<input name="id" type="hidden" value="${items.id}">
			</div>
			<br />
			<table class="table table-striped">
				<thead>
					<tr>
						<th>상품명</th>
						<td><input name="itemsName" type="text" value="${items.name}" required="required"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>메인 이미지 경로</th>
						<td><input name="itemsImgUrl" type="text" value="${items.imgUrl}" required="required"></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input name="itemsPrice" type="text" value="${items.price}" required="required"></td>
					</tr>
					<tr>
						<th>상품분류</th>
						<td><select name="valuePart" required="required">
								<option value="${items.value ne null ? items.value : '' }">
									<c:choose>
										<c:when test="${items.value eq 'prPen'}">프리미엄펜</c:when>
										<c:when test="${items.value eq 'pen'}">펜/펜슬</c:when>
										<c:when test="${items.value eq 'mark'}">마카</c:when>
										<c:when test="${items.value eq 'brush'}">컬러링/브러쉬</c:when>
										<c:when test="${items.value eq 'designSt'}">디자인문구</c:when>
										<c:otherwise>없음</c:otherwise>
									</c:choose>
								</option>
								
								<option value="prPen">프리미엄펜</option>
								<option value="pen">펜/펜슬</option>
								<option value="mark">마카</option>
								<option value="brush">컬러링/브러쉬</option>
								<option value="designSt">디자인문구</option>
										
						</select></td>
					</tr>
					<tr>
						<th>상품스펙</th>
						<td><input name="itemsProductSpec" type="text" value="${items.productSpec}" required="required" placeholder="이미지주소^^이름,,이미지주소^^이름 형식으로 작성해주세요"></td>
					</tr>
					<tr>
						<th>상품특징</th>
						<td><input name="itemsCharac" type="text" value="${items.charac}" required="required"></td>
					</tr>
					<tr>
						<th>상품주요특징</th>
						<td><input name="itemsMainCharac" type="text" value="${items.mainCharac}" required="required" placeholder="주요특징,,주요특징 형식으로 작성해주세요"></td>
					</tr>
					<tr>
						<th>바디컬러</th>
						<td><input name="itemsBodyColor" type="text" value="${items.bodyColor}" required="required"></td>
					</tr>
					<tr>
						<th>잉크컬러</th>
						<td><input name="itemsInkColor" type="text" value="${items.inkColor}" required="required"></td>
					</tr>
					<tr>
						<th>상세페이지 주소</th>
						<td><input name="itemsDetailImgUrl" type="text" value="${items.detailimgUrl}" required="required"></td>
					</tr>
				</tbody>
			</table>
			<br />
			<div class="text-center">
				<button type="submit" class="btn btn-warning">등록하기</button>
<%-- 				<button type="button" onclick="deleteClass(${classTable.id })" class="btn btn-danger btn-lg">삭제하기</button> --%>
			</div>
		</form>
	</div>

	<script type="text/javascript">
	
	function deleteClass(id) {
		
		location.href = "/practiceProgress/classtable?cmd=detailDeleteProc&id="+id;
		
// 		$.ajax({
			
// 			type: "get",
// 			url: "/practiceProgress/classtable?cmd=detailDeleteProc&room"+room
			
// 		}).done(function(result) {
			
// 			alert("삭제 성공하였습니다.");
// 			opener.location.reload();
			window.close();
			
// 		}).fail(function(error) {
			
// 			alert("실패");
			
// 		});
		
	}


</script>
</body>
</html>