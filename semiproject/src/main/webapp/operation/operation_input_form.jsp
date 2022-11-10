<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>operation_input_form</title>
		<link rel = 'stylesheet' href = './css/operation_input_form.css'>
		<script defer src='js/operation_input_form.js'></script>
		<script defer src='js/operation.js'></script>
		<script src = '//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
	</head>
	<body>
	<jsp:useBean id = "pageVo" class = "operation.Page"/>
	<jsp:setProperty property = "*" name = "pageVo"/>
	
		<form id = "operation_input_form" name = 'frm_input' method = 'post'>
			<h2>생산정보 입력</h2>
			<div>
				<span class = 'cc1'>아이디</span>
				<span class = 'cc2'><input type = "search" size = '18' value ='a123' 
					autocomplete='off' maxlength='20' required
					placeholder='영어로 시작하는 영숫자만'				
					id='id1' name = 'id'></span>
			</div>
			<div>
				<span class = 'cc1'>성명</span>
				<span class = 'cc2'><input type = "text" name = 'name' size = '14'>
				</span>
			</div>
			<div>
				<span class = 'cc1'>성별</span>
				<span class = 'cc2'>
					<label>
					<input type = "radio" value = "m" name = 'gender'>
					남자</label>
					<label>
					<input type = "radio" value = "f" name = 'gender'>
					여자</label>
					</span>
			</div>
			<div>
				<span class = 'cc1'>암호</span>
				<span class = 'cc2'>
				<input type = "password" name = "pwd" size = '21' id='pw1'></span>
			</div>
			<div>
				<span class = 'cc1'>암호 확인</span>
				<span class = 'cc2'><input type = "password" size = '21' id='pw2' name = 'pwd2'></span>
			</div>
			<div>
				<span class = 'cc1'>연락처</span>
				<span class = 'cc2'><input type = "text" size = '14' id='phone1' name = 'phone'></span>
			</div>
			<div>
				<span class = 'cc1' id='code1'>우편번호</span>
				<span class = 'cc2'>
				<input type = "text" size = '10' id='code2' name = 'zipcode'></span>
				<input type = "button" value = "우편번호 검색" id='code3' name = 'findZipCode'>
			</div>
			<div>
				<span class = 'cc1'>주소</span>
				<span class = 'cc2'><input type = "text" size = '36' id='address1' name = 'address'></span>
			</div>
			<div>
				<span class = 'cc1'>상세주소</span>
				<span class = 'cc2'><input type = "text" size = '36' name = 'address2'></span>
			</div>
			<div>
				<span class = 'cc1'>이메일</span>
				<span class = 'cc2'><input type = "email" size = '18' id='email1' name = 'email'></span>
			</div>
			<br/>
			<div>
				<span class = 'cc1'></span>
				<span class = 'cc2'>
				<input type = "button" value = "저장" id='btn_save' name = 'btnSave'/>				
				<input type = "button" value = "취소" name = 'btnCancel'/>
				</span>
			</div>
		<input type='text' name='findStr' value='${pageVo.findStr }'/>
        <input type='text' name='nowPage' value='${pageVo.nowPage }'/>
		</form>
	</body>
</html>
