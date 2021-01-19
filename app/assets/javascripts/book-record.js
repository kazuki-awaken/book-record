// トグルメニュースライドアニメーション
$(function(){
  
  $(function(){
    $('.down1,.down2').hide();
    $(".parent1,.parent2").click(function(){
    $(this).next().slideToggle(300);
  });
  $('.parent1,.parent2').hover(function(){
    over_flg = true;
    }, function(){
    over_flg = false;
  });
  
  $('body').click(function() {
    if (over_flg == false) {
      $('.down1,.down2').slideUp(300);
    }
  });
  });

});

// スクロールフェイドイン
$(function(){
	$(window).scroll(function (){
		$('.fadein').each(function(){
			var elemPos = $(this).offset().top;
			var scroll = $(window).scrollTop();
			var windowHeight = $(window).height();
			if (scroll > elemPos - windowHeight + 200){
				$(this).addClass('scrollin');
			}
		});
	});
});

