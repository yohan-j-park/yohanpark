/**
 * index.js
 */
$('.img').on('click',function(ev){
    window.location.href='/';
})

$('.btnBoard').on('click',function(){
	$('#content').load('/board/board_select');
});
 
$('.btnGuestBook').on('click',function(){
	$('#content').load('/guestbook/guestbook_select');
});