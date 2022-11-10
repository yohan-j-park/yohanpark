<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>웹 프로젝트</title>
<link rel = 'stylesheet' href = 'css/index.css'>
<!-- <script defer src='js/operation.js'></script> -->
</head>
<body>
<%
String inc="temp.html";
if(request.getParameter("inc") != null){
	inc = request.getParameter("inc");
}

String sessionId = (String)session.getAttribute("sessionId");
%>

<div class='index_main'>
	<div class='login'>
		<%if (sessionId == null) { %>
		<a href='index.jsp?inc=member/login.jsp' id=logintag>로그인</a>
		<% }else { %>
		<span id='loginspan'>[<%=sessionId %>님 로그인]</span>
		<a href='member/logout.jsp' id=logouttag>로그아웃</a>
		<%} %> 
	</div>
	<header>
		<a href='index.jsp' id="hometag">GLOBAL IT</a>
			
		<div class='logo'></div>
			
		<img src='images/robot_logo2.png'>
			
		<nav>
			<a href='#'>스토어</a>
			<a href='#'>멤버쉽</a>
			<a href='#'>게시판</a>
			<a href='#'>고객지원</a>
			<%if (sessionId != null) { %>
			<a href='operation.do'>관리자</a>
			<% } %> 
			<a href='#'>판매관리</a>
		</nav>
	</header>
	<div class = 'content'>
		<jsp:include page = "<%=inc%>"/>
	</div>
	<footer>
		대한민국
	</footer>
</div>

</html>
 