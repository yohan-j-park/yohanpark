
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
String Access_level = (String)session.getAttribute("Access_level");
%>

<div class='index_main'>
   <div class='login'>
      <%if (sessionId == null) { %>
      <a href='index.jsp?inc=member/login.jsp' id=logintag>로그인</a>
      <% }else { %>
      <span id='loginspan'>[<%=sessionId %>님 로그인] (<%=Access_level %>) </span>
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
      	 <c:if test="${ (Access_level eq ('사원') )|| (Access_level eq ('임원') )}">
	         <a href='operation.do'>생산관리</a>
	         <a href='sales.do'>판매관리</a>
      	 </c:if>
      <c:if test="${ (Access_level eq ('임원') )}"> 
         <a href='cost.do'>원가관리</a>
      </c:if>
      </nav>
   </header>
   <div class = 'content'>
      <jsp:include page = "<%=inc%>"/>
   </div>
		<footer>
			<div class='firstRow'>
				<span>콘텐츠</span> <span>프리미엄 콘텐츠</span> <span>기업용</span> <span>회사</span>
				<span>지원 센터</span>
			</div>
			<div class='secondRow'>
				<span><a href='#'>홈페이지</a></span> <span><a href='#'>Offset
						스톡 사진</a></span> <span><a href='#'>ShutterStock Premier</a></span> <span><a
					href='#'>회사 소개</a></span> <span><a href='#'>도움 받기</a></span>
			</div>
			<div class='thirdRow'>
				<span><a href='#'>이미지</a></span> <span><a href='#'>ShutterStock
						Select</a></span> <span><a href='#'>ShutterStock Studios</a></span> <span><a
					href='#'>채용</a></span> <span><a href='#'>접근성</a></span>
			</div>
		</footer>
	</div>
</body>
</html>
 