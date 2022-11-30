/**
 * member.js
 */

$('.btnInsert').on('click',function(){
	var param = $('.frm').serialize();
	$.post('member_insert.jsp',param, function(data){
		$('section').html(data);	
	})
})		

$('.btnInsertR').on('click',function(){
	var frm = $('.frm')[0];
	var data = new FormData(frm);
	$.ajax({
		type : 'POST',
		url : 'ajaxcontentupload.do',
		data : data,
		contentType : false,
		processData : false,
		success : function(resp){
			$('section').html(resp);
		}
		
	})
})



$('.btnSelect').on('click',function(){
	var frm = $('.frm')[0];
	frm.enctype='';
	var param = $(frm).serialize();
	$.post('member_select.jsp',param,function(data){
		$('section').html(data);
	})	
})


$('.btnSearch').on('click',function(){
	var frm = $('.frm');
	frm.nowPage.value=1;
	
	var param = $('.frm').serialize();
	$.post('member_select.jsp'),param,function(data){
		$('section').html(data);
	}	
})

$('.btnUpdate').on('click',function(){
	var param = $('.frm').serialize();
	$.post('member_update.jsp',param, function(data){
		$('section').html(data);	
	})
})	

$('.btnUpdateR').on('click',function(){
	var frm = $('.frm')[0];
	frm.enctype='multipart/form-data';
	var data = new FormData(frm);
	$.ajax({
		type : 'POST',
		url : 'ajaxcontentupload.do',
		data : data,
		contentType : false,
		processData : false,
		success : function(resp){
			$('section').html(resp);
		}
		
	})
})

$('.btnDeleteR').on('click',function(){
	var yn = confirm('정말 삭제하시겠습니까?');
	if(!yn) return;
	var param = $('.frm').serialize();
	$.post('member_select.jsp',param, function(data){
		$('section').html(data);	
	})
})	



view=function(id){
	var frm = $('.frm')[0];
	frm.id.value=id;
	var param = $(frm).serialize();
	$.post('member_view.jsp',param,function(data){
		$('section').html(data);
	})
}

move = function(nowPage){
	var frm = $('.frm')[0];
	frm.nowPage.value=nowPage;
	var param = $(frm).serialize();
	$.post('member_select.jsp',param,function(data){
		$('section').html(data);
	})
}