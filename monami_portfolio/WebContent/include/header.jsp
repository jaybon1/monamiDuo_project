<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<nav class="local-nav">
		<div class="local-nav-links">
		<c:choose>
			<c:when test="${empty sessionScope.principal}">
				<a href="/monami/users?cmd=login">로그인</a> 
				<a href="/monami/users?cmd=join">회원가입</a>
			</c:when>
			
			<c:otherwise>
				<a href="/monami/users?cmd=update">회원정보수정</a> 
				<a href="/monami/users?cmd=order">주문관리</a> 
				<a href="/monami/users?cmd=logout">로그아웃</a>
				<div class="count__con">
					<a href="/monami/users?cmd=cart"><i class="large material-icons">shopping_basket</i></a> 
					<span class="count">0</span>
				</div>
			</c:otherwise>
		</c:choose>	
				
				<a href="#"><i class="large material-icons">search</i></a>
		</div>
		<!--end of local-nav-links-->
	</nav>
	<!--end of local-nav-->

	<nav class="global-nav">
		<div>
			<ul class="global-nav-links">
				<a href="/monami/board?cmd=home" class="product-name"><img src="images/logo.png"></a>
				<li><a href="/monami/board?cmd=about" class="global-nav-item">ABOUT</a></li>
				<li><a href="/monami/board?cmd=product" class="global-nav-item">PRODUCT</a></li>
				<li><a href="/monami/board?cmd=class" class="global-nav-item">CLASS</a></li>
				<li><a href="/monami/board?cmd=map" class="global-nav-item">MAP</a></li>
			</ul>
		</div>
		<!--end of global-nav-links-->
	</nav>
	<!--end of global-nav-->
</header>