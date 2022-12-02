/**
 * main.js
 */
$('#btnMember').on('click',function(){
	$('section').load('mms.do');
})

$('#btnScore').on('click',function(){
	$('section').load('../mybatisScore/scoreServlet.do');
})
