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
<title>상품정보 수정</title>
<style type="text/css">
input {
	width: 100%;
}
</style>
</head>
<body>
	<br />
	<div class="container">
		<form action="/monami/admin?cmd=productUpdateProc" method="post">
			<input name="itemsId" type="hidden" value="${item.id }">
			<div class="text-center">
				<h2>상품수정</h2>
				<input name="id" type="hidden">
			</div>
			<br />
			<table class="table table-striped">
				<thead>
					<tr>
						<th>상품명</th>
						<td><input name="itemsName" type="text" value="${item.name }" required="required"></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>메인 이미지 경로</th>
						<td><input name="itemsImgUrl" type="text" value="${item.imgUrl }" required="required"></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input name="itemsPrice" type="text" value="${item.price }" required="required"></td>
					</tr>
					<tr>
						<th>상품분류</th>
						<td><select name="valuePart" required="required">
								<option value="${item.value ne null ? item.value : '' }">
									<c:choose>
										<c:when test="${item.value eq 'prPen'}">프리미엄펜</c:when>
										<c:when test="${item.value eq 'pen'}">펜/펜슬</c:when>
										<c:when test="${item.value eq 'mark'}">마카</c:when>
										<c:when test="${item.value eq 'brush'}">컬러링/브러쉬</c:when>
										<c:when test="${item.value eq 'designSt'}">디자인문구</c:when>
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
						<th>바디컬러</th>
						<td><input name="itemsBodyColor" type="text" value="${item.bodyColor }" placeholder="이미지주소!!이름,,이미지주소!!이름 형식으로 작성해주세요"></td>
					</tr>
					<tr>
						<th>잉크컬러</th>
						<td><input name="itemsInkColor" type="text" value="${item.inkColor }" placeholder="이미지주소!!이름,,이미지주소!!이름 형식으로 작성해주세요"></td>
					</tr>
					<tr>
						<th>상품스펙</th>
						<td><input name="itemsProductSpec" type="text" value="${item.productSpec }" placeholder="이미지주소!!이름,,이미지주소!!이름 형식으로 작성해주세요"></td>
					</tr>
					<tr>
						<th>상품특징</th>
						<td><input name="itemsCharac" type="text" value="${item.charac }"></td>
					</tr>
					<tr>
						<th>상품주요특징</th>
						<td><input name="itemsMainCharac" type="text" value="${item.mainCharac }" placeholder="주요특징,,주요특징 형식으로 작성해주세요"></td>
					</tr>
					<tr>
						<th>상세페이지 주소</th>
						<td><input name="itemsDetailImgUrl" type="text" value="${item.detailImgUrl }"></td>
					</tr>
				</tbody>
			</table>
			<br />
			<div class="text-center">
				<button type="submit" class="btn btn-warning">수정하기</button>
				<%-- 				<button type="button" onclick="deleteClass(${classTable.id })" class="btn btn-danger btn-lg">삭제하기</button> --%>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		
	</script>
</body>
</html>