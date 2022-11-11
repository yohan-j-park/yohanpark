<%@page import="jdbc.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id = 'login_result_body'>
<%

String mId = request.getParameter("mId");
String pwd = request.getParameter("pwd");
Login l = new Login();
boolean b = l.login(mId, pwd);
if(b){
	session.setAttribute("sessionId", mId);
	response.sendRedirect("../index.jsp");
}else{
	out.print("<script>alert('넌 누구니?');</script>");
	out.print("<a href='../index.jsp'>홈으로</a>");
}

/*
session.setAttribute("sessionId", "a001");
response.sendRedirect("../index.jsp");
*/
%>
</body>
</html>