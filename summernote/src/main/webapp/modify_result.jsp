<%@page import="bean.SnDao"%>
<%@page import="bean.SnVo"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="bean.DBConn"%>
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
		
	String serial = request.getParameter("serial");
	String subject = request.getParameter("subject");
	String doc = request.getParameter("doc");

	SnVo vo = new SnVo();
	vo.setSerial( Integer.parseInt(serial) );
	vo.setSubject(subject);
	vo.setDoc(doc);
	
	SnDao dao = new SnDao();
	boolean b = dao.modify(vo);
	
	if( !b ){
		out.print("오류 발생 !!!!!");
		out.print("<a href='list.jsp'>목록 화면</a>");
		return;
	}

%>
	<div id='list'>
		<h1>수정 결과</h1>
		<div class='item'>
			<div class='subject'><%=subject %>
			</div>
			<div class='doc'><%=doc %></div>
		</div>
		<hr />
		<a href='list.jsp'>목록으로</a>
	</div>
</body>
</html>