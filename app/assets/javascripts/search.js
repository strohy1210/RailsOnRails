$(function(){

// $('.vine-results').find('input').hide();
$('.vine-results').on('click', '.project-item', function(){
  // debugger;
  var checkBox = $(this).find('input');
  
  $(this).toggleClass("selected");
  if ($(this).hasClass("selected")) {
    checkBox.prop("checked", true);
  }
  else {
    checkBox.prop("checked", false);
  }

});

$('.project-item').hover(function(){
$(this).find('video').get(0).play()
}, function(){
$(this).find('video').get(0).pause()

})

})