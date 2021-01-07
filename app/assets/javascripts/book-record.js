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

