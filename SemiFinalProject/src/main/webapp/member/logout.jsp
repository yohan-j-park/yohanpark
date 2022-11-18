<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/logout.jsp</title>
</head>
<body>
<%
   session.setAttribute("sessionId", null);
   session.setAttribute("Access_level", null);
   response.sendRedirect("../index.jsp");
%>
</body>
</html>