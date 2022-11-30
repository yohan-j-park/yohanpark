<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mybatis/member_view.jsp</title>
<script defer src='member.js'></script>

</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm' class='frm' method='post'>
		<label>아이디</label>
		<input type='text' name='id' value='h001'/><br/>
		<label>성 명</label>
		<input type='text' name='name' value='홍길동'/><br/>
		<label>성별</label>
		<label><input type='radio' name='gender' value='m'/>남자</label>
		<label><input type='radio' name='gender' value='f'/>여자</label>
		<br/>
		<label>연락처</label>
		<input type='text' name='phone' value='010-1111-2222'/><br/>
		<label>가입일</label>
		<input type='date' name='mdate'/><br/>
		<label>프로필 사진</label>
		<img src=''/>
		<input type='button' value='수정' class='btnUpdate'/>
		<input type='button' value='삭제' class='btnDeleteR'/>
		<input type='button' value='취소' class='btnSelect'/>
	</form>
</div>
</body>
</html>