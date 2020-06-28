<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>loginPage</title>
<link rel="stylesheet" href="/monami/css/default.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>

<%@ include file="/include/header.jsp" %>
<br />
<br />
<br />
<br />
<br />
<br />
<div class="container">
	<h1>카카오 로그인 추가 정보 구성창</h1>
	<form action="/monami/oauth/naver?cmd=joinProc" method="POST" class="was-validated">
	  
	  <div class="form-group">
	    <label for="username">UserId:</label>
	    <input value="${naverProfile.response.id}_naver" type="text" class="form-control" id="username" name="username" required readonly>
	    <div class="valid-feedback">Valid.</div>
	    <div class="invalid-feedback">Please fill out this field.</div>
	  </div>
	  
<!-- 이름이 필요할 경우 살릴것 -->
<!-- 	  <div class="form-group"> -->
<!-- 	    <label for="name">name:</label> -->
<%-- 	    <c:choose> --%>
<%-- 		    <c:when test="${empty naverProfile.response.name}"> --%>
<!-- 		    	<input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" required > -->
<%-- 		    </c:when> --%>
<%-- 		    <c:otherwise> --%>
<%-- 		    	<input value="${naverProfile.response.name}" type="email" class="form-control" id="email" placeholder="Enter Email" name="email" required readonly> --%>
<%-- 		    </c:otherwise> --%>
<%-- 	    </c:choose> --%>
<!-- 	    <div class="valid-feedback">Valid.</div> -->
<!-- 	    <div class="invalid-feedback">Please fill out this field.</div> -->
<!-- 	  </div> -->
	  
	  <div class="form-group">
	    <label for="email">Email:</label>
	    <c:choose>
		    <c:when test="${empty naverProfile.response.email}">
		    	<input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" required >
		    </c:when>
		    <c:otherwise>
		    	<input value="${naverProfile.response.email}" type="email" class="form-control" id="email" placeholder="Enter Email" name="email" required readonly>
		    </c:otherwise>
	    </c:choose>
	    <div class="valid-feedback">Valid.</div>
	    <div class="invalid-feedback">Please fill out this field.</div>
	  </div>
	  
	  <div class="form-group">
	    <label for="phonenumber">Phonenumber:</label>
	    <input type="phonenumber" class="form-control" id="phonenumber" placeholder="Enter Phonenumber" name="phonenumber" required>
	    <div class="valid-feedback">Valid.</div>
	    <div class="invalid-feedback">Please fill out this field.</div>
	  </div>
	  
	  <div class="form-group">
	    <label for="address">Address:</label>
	    <input type="address" class="form-control" id="address" placeholder="Enter Address" name="address" required>
	    <div class="valid-feedback">Valid.</div>
	    <div class="invalid-feedback">Please fill out this field.</div>
	  </div>

	  <button type="submit" class="btn btn-primary">회원가입완료</button>
	</form>
</div>

<%@ include file="/include/footer.jsp" %>
<script>
	alert("주소와 전화번호 입력이 필요합니다.");
</script>
</body>
</html>