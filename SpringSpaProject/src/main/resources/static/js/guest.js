/**
 * 
 */

/*move = function(nowPage){
	let frm = $('.frm_gb_search')[0];
	frm.nowPage.value = nowPage;
	let param = $(frm).serialize();
	$.post('/guestbook/guestbook_select',param,function(data){
		$('#content').html(data);
	})
}*/


$('.btnSearch').on('click',function(){
	let frm = $('.frm_gb_search')[0];
	frm.nowPage.value = 1;
	let param = $(frm).serialize();
	$('#content').load('/guestbook/guestbook_select',param);
});

move=function(nowPage){
	let frm = $('.frm_gb_search')[0];
	frm.nowPage.value = nowPage;
	let param = $(frm).serialize();
	$.ajax({
		url:'/guestbook/guestbook_select',
		method:'post',
		data:param,
		success: function(data, param){
			$('#content').append(data)
		}
	})
}


