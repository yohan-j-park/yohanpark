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
				<span class = 'cc1'>생산일자</span>
				<span class = 'cc2'><input type = "date" name = 'name' size = '14'>
				</span>
			</div>
			<div>
				<span class = 'cc1'>호기</span>
				<span class = 'cc2'>
					<label>
					<input type = "radio" value = "1" name = 'gender'>
					1</label>
					<label>
					<input type = "radio" value = "2" name = 'gender'>
					2</label>
					</span>
			</div>
			<div>
				<span class = 'cc1'>매니저</span>
				<span class = 'cc2'><input type = "text" name = 'name' size = '14'>
				</span>
			</div>
			<div>
				<span class = 'cc1'>제품코드</span>
				<span class = 'cc2'><input type = "text" name = 'name' size = '14'>
				</span>
			</div>
			<div>
				<span class = 'cc1'>불량여부</span>
				<span class = 'cc2'>
					<label>
					<input type = "radio" value = "1" name = 'gender'>
					P</label>
					<label>
					<input type = "radio" value = "2" name = 'gender'>
					F</label>
					</span>
			</div>

			<br/>
			<div>
				<span class = 'cc1'></span>
				<span class = 'cc2'>
				<input type = "button" value = "저장" id='btn_save' name = 'btnSave'/>				
				<input type = "button" value = "취소" name = 'btnCancel'/>
				</span>
			</div>
		<input type='text' name='findPrcode' value='${pageVo.findPrcode }'/>
        <input type='text' name='nowPage' value='${pageVo.nowPage }'/>
		</form>
	</body>
</html>
