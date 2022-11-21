<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax/ajax_test.jsp</title>
<style>
#output>div{
	display:inline-block;
	width:350px;
	padding:20px;
	box-sizing:border-box;
	min-height:250px;
	border:3px solid #aaa;
	vertical-align:top;
	margin-bottom:5px;
}
#output>#student{
	min-width:705px;
	max-width:1442px;
}
#output>#employee{
	min-width:705px;
	max-width:1442px;
}
</style>
<script defer src='ajax_test.js'></script>
</head>
<body>
<h2>Ajax Test</h2>
<input type='button' value='Load Text File' id='btnLoadText'/>
<input type='button' value='Load Html File' id='btnLoadHtml'/>
<input type='button' value='Load JSP File' id='btnLoadJSP'/>
<input type='button' value='Load Json File' id='btnLoadJson'/>
<input type='button' value='학생정보 조회' id='btnStudent'/>
<input type='button' value='직원정보 조회' id='btnEmployee'/>
<hr/>
<div id='output'>
	<div id='text'></div>
	<div id='html'></div>
	<div id='jsp'></div>
	<div id='json'></div>
	<div id='student'>
		<div id='frm'>

		</div>
		<div id='list'>
			
		</div>
	</div>
	<div id='employee'>
		<div id='frm_employee'>
		
		</div>
		<div id='employee_list'>
		
		</div>
	</div>
</div>
</body>
</html>