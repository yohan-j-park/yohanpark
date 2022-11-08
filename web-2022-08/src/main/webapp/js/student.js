/**
 * 학생관리 
 */

/* 입력 화면 처리 --------------------*/
var frmInput = document.frm_input;
if(frmInput != null){
	frmInput.btnCancel.onclick=function(){
		frmInput.action= 'student.do?job=select';
		frmInput.submit();
	}
	
	// Sevlet을 직접 호출하지 않고 useBean으로 객체를 만든 후
	// Servlet을 호출하는 result.jsp를 호출
	frmInput.btnSave.onclick = function(){
		frmInput.action= 'result.jsp?job=insertR';
		frmInput.submit();
	}
}



/* 조회 화면 처리 --------------------*/
var frmSearch = document.frm_search;
if( frmSearch != null){
	frmSearch.btnInsert.addEventListener('click',function(){
		frmSearch.action= 'student.do?job=insert';
		frmSearch.submit();
	});
	
	frmSearch.btnSelect.onclick= function(){
		frmSearch.action= 'student.do?job=select';
		frmSearch.nowPage.value=1;
		frmSearch.submit();
	}
}

function movePage(nowPage){
	frmSearch.action= 'student.do?job=select';
	frmSearch.nowPage.value=nowPage;
	frmSearch.submit();	
}

function view(id){
	frmSearch.action= 'student.do?job=update&id=' + id;
	frmSearch.submit();	
}

/* 상세보기, 수정, 삭제 ---------------------------*/
var btnSelect = document.querySelector('#btnSelect');
if(btnSelect != null){
	btnSelect.onclick = function(){
		var frm = document.frm_student;
		frm.action='student.do?job=select';
		frm.submit();
	}
}

/*수정-----*/

var btnModify = document.querySelector('#btnModify');
if(btnModify != null){
	var frm = document.frm_student;
	btnModify.onclick = function(){
		frm.action = 'result.jsp?job=updateR';
		frm.submit();
	}
}

var btnDelete = document.querySelector('#btnDelete');
if(btnDelete != null ){
	var frm = document.frm_student;
	btnDelete.onclick = function(){
		frm.action = 'result.jsp?job=deleteR';
		frm.submit();
	}
}

















