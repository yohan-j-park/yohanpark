/**
 * 학생관리
 */

/* 조회 화면 에서 입력 누르면 입력 화면 이동 처리 */
var frmSearch = document.frm_search;
if(frmSearch != null){
	frmSearch.btnInsert.addEventListener('click',function(){
		frmSearch.action='index.jsp?inc=student/(강사님ver)student_input_form.jsp';
		frmSearch.submit();
	});
	
	frmSearch.btnSelect.onclick= function(){
		frmSearch.action = 'index.jsp?inc=student/(강사님ver)student_list.jsp';
		frmSearch.nowPage.value=1;
		frmSearch.submit();
	}
}
 
/* 입력 화면 처리 */
var frmInput = document.frm_input;

if(frmInput != null){

/* 입력 화면 Cancel 처리 */
	frmInput.btnCancel.addEventListener('click',function(){
		frmInput.action='index.jsp?inc=student/(강사님ver)student_list.jsp';
		frmInput.submit();
	});
/* 입력 화면 저장 처리 */
	frmInput.btnSave.onclick = function(){
		frmInput.action='index.jsp?inc=student/student_input_result.jsp';
		frmInput.submit();
	}	
}




