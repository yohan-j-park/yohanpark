<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href='member.css'>
<title>mybatis/member_select.jsp</title>
<script defer src='member.js'></script>
</head>
<body>
<div id='member'>
	<h2>회원관리</h2>
	<form name='frm' method='post' class='frm'>
		<input type='button' value='입력' class='btnInsert'/>
		<input type='search' name='findStr' autocomplete='off'/>
		<input type='button' value='검색' class='btnSearch'/>
		<input type='text' name='nowPage' value='${nowPage }'/>	<!-- 나중에 히든으로 바꾸기 -->
		<input type='text' name='id'/>	<!-- 나중에 히든으로 바꾸기 -->
	</form>
	<br/>
	<div class='item_title'>
		<span class='no'>NO</span>
		<span class='id'>아이디</span>
		<span class='name'>성명</span>
		<span class='gender'>성별</span>
		<span class='phone'>연락처</span>
		<span class='mdate'>가입일</span>
	</div>
	<div class='item_list'>
		<c:forEach var='vo' begin='1' end='10'>
			<div class='item' onclick="view('hong')">
				<span class='no'>NO</span>
				<span class='id'>아이디</span>
				<span class='name'>성명</span>
				<span class='gender'>성별</span>
				<span class='phone'>연락처</span>
				<span class='mdate'>가입일</span>
			</div>
		</c:forEach>
	</div>
	<div class='btn_zone'>
		<input type='button' value='처음' class='btnFirst' onclick='move(1)'/>
		<input type='button' value='이전' class='btnPrev' onclick='move(1)'/>
		
		<c:forEach var='i' begin='1' end='5'>
			<input type='button' value='${i }' class='btnMove' onclick='move(${i})'/>
		</c:forEach>
		
		<input type='button' value='다음' class='btnNext' onclick='move(10)'/>
		<input type='button' value='맨끝' class='btnLast' onclick='move(100)'/>
		
		
	</div>
	

</div>
</body>
</html>