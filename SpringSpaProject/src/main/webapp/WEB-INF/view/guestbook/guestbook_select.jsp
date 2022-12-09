<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook_select.jsp</title>
<link rel='stylesheet' href='css/guestbook.css'>
</head>
<body>
<div id='guestbook_list'>
	<div class='guestbook_items'>
		<c:forEach var='i' begin='1' end='20'>
			<div class='item'>
				<form name='frm_guestbook' class='frm_guestbook' method='post'>
					<label>작성자</label>
					<input type='text' name='id'>
					<label>작성일</label>
					<output>2022-12-09</output><br/>
					<textarea rows='7' cols='55' name='doc'></textarea>
					<br/>
					<label>암호</label>
					<input type='password' name='pwd'>
					<input type='button' value='작성' class='btnGuestbookSave'>
				</form>
			</div>
			
		</c:forEach>
	</div>
	<div class='buestbook_btn'>
		<input type='button' value='&lt;' class='btnPrev'>
		<input type='button' value='&gt;' class='btnNext'>
	</div>
</div>
</body>
</html>