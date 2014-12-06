$(function(){

$('iframe').hide();
$('.loading').hide();

var form = document.getElementsByClassName('navbar-form')[0];
form.addEventListener("submit", function() {

    // e.preventDefault();

    $('iframe').show();
    $('.loading').show();
    $('.search').hide();

    // document.forms[0].submit();

});

// // $('button').click(function(){
// //   alert('yo')
// // $('.one').slideDown();
// // setTimeout(function(){
// //   $('.two').slideDown();
// // }, 1500)

// // setTimeout(function(){
// //  $('.three').fadeIn();
// // }, 3000);
// // setTimeout(function(){
// //  $('.four').show();
// // }, 5500);

// // setTimeout(function(){
// //  $('.five').show();
// // }, 7400)
// // setTimeout(function(){
// //  $('.six').show();
// // }, 9000)
// // setTimeout(function(){
// //  $('.seven').show();
// // }, 11000)
// // setTimeout(function(){
// //  $('.eight').show();
// // }, 13000)

// // setTimeout(function(){
// //  $('h4, .input-group').show();
// // }, 15000)
// // })
})();