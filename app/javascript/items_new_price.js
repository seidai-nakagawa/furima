$(function(){
  $('#sell__box').change(function(){
    var s = $('#sell__box').val();
    var result = '\xA5'+ Math.floor(s / 10).toLocaleString();

    $('.price__commission__right').html(result);
  });
});

$(function(){
  $('#sell__box').change(function(){
    var s = $('#sell__box').val();
    var result ='\xA5'+ (s - (Math.floor (s / 10))).toLocaleString();

    $('.profit__commission__right').html(result);
  });
});