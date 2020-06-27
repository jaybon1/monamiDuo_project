<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	div{
		background-color:yellow;
		margin:20px;
		max-width:1080px;
		height:300px;
		margin:0 auto;
		color:#111;
	}
	
.hideme {
	opacity: 0;
}
.showme {
	border: 1px solid white;

	-webkit-animation: fade-in-fwd 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	animation: fade-in-fwd 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;

	&.top {
		-webkit-animation: fade-in-top 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
		animation: fade-in-top 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	}
	&.right {
		-webkit-animation: fade-in-right 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
		animation: fade-in-right 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	}
	&.bottom {
		-webkit-animation: fade-in-bottom 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
		animation: fade-in-bottom 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	}
	&.left {
		-webkit-animation: fade-in-left 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
		animation: fade-in-left 1s cubic-bezier(0.390, 0.575, 0.565, 1.000) both;
	}
}

/**
 * ----------------------------------------
 * animation fade-in-fwd
 * ----------------------------------------
 */

@keyframes fade-in-fwd {
  0% {
    -webkit-transform: translateZ(-80px);
            transform: translateZ(-80px);
    opacity: 0;
  }
  100% {
    -webkit-transform: translateZ(0);
            transform: translateZ(0);
    opacity: 1;
  }
}

/**
 * ----------------------------------------
 * animation fade-in-top
 * ----------------------------------------
 */
@keyframes fade-in-top {
  0% {
    -webkit-transform: translateY(-50px);
            transform: translateY(-50px);
    opacity: 0;
  }
  100% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
    opacity: 1;
  }
}
/**
 * ----------------------------------------
 * animation fade-in-right
 * ----------------------------------------
 */
@keyframes fade-in-right {
  0% {
    -webkit-transform: translateX(50px);
            transform: translateX(50px);
    opacity: 0;
  }
  100% {
    -webkit-transform: translateX(0);
            transform: translateX(0);
    opacity: 1;
  }
}
/**
 * ----------------------------------------
 * animation fade-in-bottom
 * ----------------------------------------
 */

@keyframes fade-in-bottom {
  0% {
    -webkit-transform: translateY(50px);
            transform: translateY(50px);
    opacity: 0;
  }
  100% {
    -webkit-transform: translateY(0);
            transform: translateY(0);
    opacity: 1;
  }
}
/**
 * ----------------------------------------
 * animation fade-in-left
 * ----------------------------------------
 */
@keyframes fade-in-left {
  0% {
    -webkit-transform: translateX(-50px);
            transform: translateX(-50px);
    opacity: 0;
  }
  100% {
    -webkit-transform: translateX(0);
            transform: translateX(0);
    opacity: 1;
  }
}
</style>
</head>
<body>
	<div>1번 영역</div>
	<div class="hideme right">2번 영역</div>
	<div class="hideme right">3번 영역</div>
	<div class="hideme right">2번 영역</div>
	<div class="hideme right">3번 영역</div>
	<div class="hideme right">2번 영역</div>
	<div class="hideme right">3번 영역</div>
	<div class="hideme right">2번 영역</div>
	<div class="hideme right">3번 영역</div>
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		$('.hideme').each( function(i){
			var bottom_of_object = $(this).offset().top ;
			var bottom_of_window = $(window).scrollTop() + $(window).height();
			if( bottom_of_window > bottom_of_object ){
				$(this).addClass('showme');
			}
		});
	$(window).scroll( function(){
		$('.hideme').each( function(i){
            var bottom_of_object = $(this).offset().top + $(this).outerHeight();
			var bottom_of_window = $(window).scrollTop() + $(window).height();
			if( bottom_of_window > bottom_of_object ){
				$(this).addClass('showme');
			}
			if( bottom_of_window < bottom_of_object ){
				$(this).removeClass('showme');
			}
		});
	});
});

	
	</script>
</body>
</html>