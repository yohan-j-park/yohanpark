<%@page import="bean.SnDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
SnDao dao = new SnDao();
String serial = request.getParameter("serial");
boolean b = dao.delete(serial);
if(b){
	out.print("삭제됨");
}else{
	out.print("삭제중 오루 발생");
}

%>
	<hr />
	<a href='list.jsp'>목록으로</a>
</body>
</html>