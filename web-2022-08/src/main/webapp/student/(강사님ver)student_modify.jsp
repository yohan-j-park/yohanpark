<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 수정</title>
<link rel='stylesheet' href='(강사님ver)student.css'>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
</head>
<body>
<div id='std_modify'>
	<h2>학생정보 수정</h2>
	<form name='frm_modify' method='post'>
		<span>아이디</span>
		<input type='search' name='id' size='10' maxlength='20' required
		   autocomplete='off'/>
	<br/>
		<span>성 명</span>
		<input type='search' name='mName' size='7' maxlength='5' required
		   autocomplete='off'/>
	<br/>
		<span>성 별</span>
		<label><input type='radio' name='gender' value='m' checked>남자</label>
		<label><input type='radio' name='gender' value='f'>여자</label> 
	<br/>
		<span>연락처</span>
		<input type='search' name='phone' size='20' maxlength='20' required
		   autocomplete='off'/>
	<br/>
		<span>우편번호</span>
		<input type='text' name='zipcode' size='5' required readonly/>
		<input type='button' name='btnFindZip' value='우편번호 검색'/>
	<br/>
		<span>주 소</span>
		<input type='text' name='address' size='40' required/>
	<br/>
		<span>상세주소</span>
		<input type='text' name='address2' size='40'/>
	<br/>
		<span>이메일</span>
		<input type='search' name='email'/>
	<br/>
		<div class='btnzone'>
			<span></span>
			<input type='button' value='수정'/>
			<input type='button' value='삭제'/>
			<input type='button' value='취소'/>
	
		</div>
	
	</form>
</div>
<script>
let frm = document.frm_modify;
frm.btnFindZip.onclick = function(){
	new daum.Postcode({
		oncomplete : function(data){
			frm.address.value = data.address;
			frm.zipcode.value = data.zonecode;
		}
	}).open(); //daum에서 제공해주는 우편번호 api를 여는 코드
}
</script>
</body>
</html>