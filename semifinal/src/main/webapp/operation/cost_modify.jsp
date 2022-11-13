<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cost_modify</title>
<link rel='stylesheet' href='./css/cost_modify.css'>
<script defer src='js/cost.js'></script>
</head>
<body>
	<h2>원가정보 수정</h2>
	<form id = "cost_modify" name='frm_cost_modify' method='post'>
		<div>
			<span class = 'cc1'>제품명</span>
			<span class = 'cc2'>
				<input type='text' size='18' id='id1' name='pr_name' value='${vo.pr_name }' readonly/>
			</span>
		</div>
		<div>
			<span class='cc1'>원가</span>
			<span class='cc2'>
				<input type='text' size='18' id='id2' name='robot_cost' value='${vo.robot_cost }'/>
			</span>
		</div>
		<div>
			<span class = 'cc1'>이익률</span>
			<span class = 'cc2'>
				<input type='text' size='18' id='id3' name='profit_rate' value='${vo.profit_rate }'/>
			</span>
		</div>
		<br/>
		<div class='btnZone'>
			<span></span>
			<input type='button' value='수정' id='btnModify'/>
			<input type='button' value='목록' id='btnList'/>
		</div>
	
	
	
	</form>

</body>
</html>
















