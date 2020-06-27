<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome Monami</title>
<link rel="stylesheet" href="css/default.css">
<link rel="stylesheet" href="css/index.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;500;900&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
		<header>
			<h1 class="logo">
				<a href="/monami/board?cmd=home">
					<img src="images/logo_white.png" />
				</a>
			</h1>

			<div class="button_container" id="toggle">
				<span class="top"></span> 
				<span class="middle"></span> 
				<span class="bottom"></span>
			</div>
		</header>
		<!--end of header-->

		<div class="overlay" id="overlay">
			<nav class="overlay-menu">
				<ul>
					<li class="about"><a href="/monami/board?cmd=about">ABOUT</a></li>
					<li class="product"><a href="/monami/board?cmd=product">PRODUCT</a></li>
					<li class="class"><a href="/monami/board?cmd=class">CLASS</a></li>
					<li class="map"><a href="/monami/board?cmd=map">MAP</a></li>
				</ul>
			</nav>
		</div>
		<!--end of overlay-->

		<section class="main_con">
			<video autoplay muted loop id="myVideo">
				<source src="http://dfrkkcv2hg1jc.cloudfront.net/data/video/monami_brand_web_60.mp4" type="video/mp4">
			</video>
		</section>
	</div>

	<script src="js/index.js"></script>
</body>
</html>