

/*스크롤시 컨텐츠 나타나는 애니메이션*/
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
//			if( bottom_of_window < bottom_of_object ){
//				$(this).removeClass('showme');
//			}
		});
	});
});




/*캐러셀*/
$(document).ready(function () {
  $('.bx-wrapper' ).removeAttr('border');
});

$('#toggle').click(function() {
   $(this).toggleClass('active');
   $('#overlay').toggleClass('open');
  });

 $(document).ready(function(){
   $(".drop").mouseover(function(){
     $(".dropmenu").slideDown("slow");
   });
 });


 $(document).ready(function(){
  $(".drop").mouseleave(function(){
      $(".dropmenu").slideUp("slow");
  });
  });

  $(document).ready(function () {
    $('.bxslider').bxSlider({
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
        // autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
    });
});

