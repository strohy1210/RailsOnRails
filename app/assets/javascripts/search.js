$(function(){
$(function(){

$('.five, .six, .seven, h2, h3, h4, .input-group').hide()
$('.one').slideDown()
setTimeout(function(){
  $('.two').slideDown()
}, 1500)

setTimeout(function(){
 $('.three').fadeIn();
}, 3000);
setTimeout(function(){
 $('.four').show();
}, 5500);

setTimeout(function(){
 $('.five').show()
}, 7400)
setTimeout(function(){
 $('.six').show()
}, 9000)
setTimeout(function(){
 $('.seven').show()
}, 11000)
setTimeout(function(){
 $('.eight').show()
}, 13000)

setTimeout(function(){
 $('h4, .input-group').show()
}, 15000)

})
// $('.vine-results').find('input').hide();
// $('.vine-results').on('click', '.project-item', function(){
//   // debugger;
//   var checkBox = $(this).find('input');
  
//   $(this).toggleClass("selected");
//   if ($(this).hasClass("selected")) {
//     checkBox.prop("checked", true);
//   }
//   else {
//     checkBox.prop("checked", false);
//   }

// });

// $('.project-item').hover(function(){
// $(this).find('video').get(0).play()
// }, function(){
// $(this).find('video').get(0).pause()

// })

})