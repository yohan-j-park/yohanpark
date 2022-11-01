<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp/dynamic_main</title>
</head>
<body>
<h2>동적 삽입 메인 페이지</h2>
<% 
String url="dynamic_sub.jsp";
%>
<jsp:include page="<%=url %>">
	<jsp:param value="홍길동" name="irum"/>
	<% /* parameter 변수값: 홍길동, parameter value값: irum이 url에 전달된다. (get방식) */ %>
</jsp:include>

<hr/>

<jsp:include page="dynamic_sub2.jsp">
	<jsp:param value="99" name="dan"/>
</jsp:include>


<h2>메인 페이지 꼬릿말</h2>
</body>
</html>