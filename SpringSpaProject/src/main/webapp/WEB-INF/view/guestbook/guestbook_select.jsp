<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestbook_select.jsp</title>
<link rel="stylesheet" href="css/guestbook.css">
<script defer src="js/guest.js"></script>
</head>
<body>

<div id="guestbook_list">
	<%@include file="guestbook_insert.jsp" %>
	<form name='frm_gb_search' class='frm_gb_search' method='post'>
		<input type='hidden' name='nowPage' value='${gVo.nowPage }'/>
		<input type='hidden' name='serial' value="${gVo.sno }"/>
		<input type="text" class="findStr" name='findStr' value='${gVo.findStr }'>
		<input type='button' class='btnSearch' name='btnSearch' value='검색'>
	</form>
		
	<div class="guestbook_items">
		<c:forEach var="vo" items="${list }">
			<div class="item">
				<form name="frm_guestbook" class="frm_guestbook" method="post">
					<label>작성자</label>
					<input type="text" name="id" value="${vo.id }">
					<label>작성일</label>
					<output>2022-12-09</output><br/>
					<textarea rows="7" cols="55" name="doc">${vo.doc }</textarea>
					<br/>
					<label>암호</label>
					<input type="password" name="pwd">
					<input type="button" value="작성" class="btnGuestbookSave">
				</form>
			</div>
			
		</c:forEach>
	</div>
	<div class="guestbook_btn">
		<c:if test="${gVo.startPage>1 }">
			<input type="button" value="&lt;&lt;" class="btnFirst" onclick='move(1)'>
			<input type="button" value="&lt;" class="btnPrev" onclick = 'move(${gVo.startPage-1})'>
		</c:if>
		<c:forEach var='i' begin='${gVo.startPage }' end="${gVo.endPage }">
			<input type='button' value='${i }' class='btnMove' onclick='move(${i})'/>
		</c:forEach>
		<c:if test="${gVo.totPage>gVo.endPage }">
			<input type="button" value="&gt;" class="btnNext" onclick = 'move(${gVo.endPage+1})'>
			<input type='button' value="&gt;&gt;" class='btnLast' onclick='move(${gVo.totPage })'/>
		</c:if>
	</div>
</div>
</body>
</html>