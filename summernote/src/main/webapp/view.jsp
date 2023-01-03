<%@page import="bean.SnVo"%>
<%@page import="bean.SnDao"%>
<%@page import="bean.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='./css/sn.css'>


</head>
<body>

	<%

request.setCharacterEncoding("utf-8");
SnDao dao = new SnDao();
String serial = request.getParameter("serial");
SnVo vo = dao.view(serial);

%>
	<div id='list'>
		<h1>상세보기</h1>
		<div class='item'>
			<div class='serial'>
				serial :
				<%=vo.getSerial()%></div>
			<div class='subject'><%=vo.getSubject() %></div>
			<div class='doc'><%=vo.getDoc() %></div>
			</a>
		</div>
		<hr />
		<a href='modify.jsp?serial=<%=vo.getSerial()%>'>수정하기</a> <a
			href='delete.jsp?serial=<%=vo.getSerial()%>'>삭제하기</a> <a
			href='list.jsp'>목록으로</a>
	</div>

</body>
</html>