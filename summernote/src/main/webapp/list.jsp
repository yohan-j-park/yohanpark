<%@page import="bean.SnVo"%>
<%@page import="java.util.List"%>
<%@page import="bean.SnDao"%>
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
		String findStr = "";
		if(request.getParameter("findStr") != null){
			findStr = request.getParameter("findStr");	
		}
		
		SnDao dao = new SnDao();
		List<SnVo> list = dao.select(findStr);
	
	%>

	<div id='list'>
		<h2>LIST</h2>
		<form name='frm_search' id='frm_search' method='post'>
			<a href='insert.jsp'>입력</a> <input type='search' name='findStr'
				value='<%=findStr%>' /> <input type='submit' value='검색'
				id='btnSearch' />
		</form>

		<div id='items'>

			<div id='title'>
				<span class='subject'>제 목</span>
			</div>

			<%for(SnVo vo : list){ %>
			<div class='item'>
				<a href='view.jsp?serial=<%=vo.getSerial()%>'> <span><%=vo.getSubject() %></span>
				</a>
			</div>
			<%} %>
			<hr />
		</div>

	</div>

</body>
</html>