<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class='item1'>
	<form name='frm_guestbook' class='frm_guestbook' method='post'>
		<label>작성자</label>
		<input type='text' name='id'>
		<label>작성일</label>
		<output>2022-12-09</output><br/>
		<textarea rows='7' cols='60' name='doc'></textarea>
		<br/>
		<label>암호</label>
		<input type='password' name='pwd'>
		<input type='button' value='작성' class='btnGuestbookSave'>
	</form>
</div>
<style>
.item1{
	text-align:center;
	width:990px;
	margin:10px auto;
}

</style>
</body>
</html>