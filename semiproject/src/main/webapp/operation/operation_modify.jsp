<%@page import="operation.OperationVo"%>
<%@page import="operation.OperationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student_modify</title>
		<link rel = 'stylesheet' href = './css/operation_modify.css'>	
		<script defer src = 'js/operation.js'></script>
			
	</head>
	<body>

		<h2>생산정보 수정</h2>
		<form id = "operation_modify.jsp" name = 'frm_student' method = 'post'>
			<div>
				<span class = 'cc1'>생산일</span>
				<span class = 'cc2'><input type = "date" id='date' name = 'date' value = '${vo.date }'/></span>
			</div>
			<div>
				<span class = 'cc1'>호기</span>
				<span class = 'cc2'>
				<input type = "text"  name = 'machine_no' value = '${vo.machine_no }'/>
				<%-- <input type = "text"  name = 'machine_no' value = '${vo.machine_no }'/>2 --%>
				</span>
			</div>				
			<div>
				<span class = 'cc1'>담당자</span>
				<span class = 'cc2'>
					<input type = "text" size = '14' name = 'manager' value = '${vo.manager }'>
					</span>
			</div>
			<div>
				<span class = 'cc1'>제품코드</span>
				<span class = 'cc2'>
				<input type = "text" size = '14' id='phone1' name = 'pr_code' value='${vo.pr_code }'></span>
			</div>
			<div>
				<span class = 'cc1' id='code1'>제품명</span>
				<span class = 'cc2'>
				<input type = "text" size = '10' id='code2' name = 'pr_name' value = '${vo.pr_name }'></span>
			</div>
			<div>
				<span class = 'cc1'>불량여부</span>
				<span class = 'cc2'><input type = "text"  id='pf' name = 'pf' value = '${vo.pf }'>P</span>
				<%-- <span class = 'cc2'><input type = "text"  id='pf' name = 'pf' value = '${vo.pf }'>F</span> --%>
			</div>
			<div>
				<span class = 'cc1'>가격</span>
				<span class = 'cc2'><input type = "text" size = '18' id='real_price' name = 'real_price' value = '${vo.real_price }'></span>
			</div>
			<br/>	
			<div>
				<span class = 'cc1'></span>
				<span class = 'cc2'>
					  <input type = "button" id='btnModify' value = "수정">
					  <input type = "button" value = "삭제" id = 'btnDelete'>
					  <input type = "button" value = "목록" id = 'btnSelect'></span>
			</div>
			<input type = 'hidden' name = 'findStr' value = '${pageVo.findStr }'/>
			<input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/>
		</form>	
		
		<script>
		
		</script>
		
	</body>
</html>