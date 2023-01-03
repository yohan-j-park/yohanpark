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
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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
		<h1>수정하기</h1>
		<div id='summer'>
			<form name='frm_summbernote' method='post' action='modify_result.jsp'>
				<label>제목 : <input type='text' size='90' name='subject'
					value='<%=vo.getSubject()%>'></label> <br />
				<textarea id='summernote' name='doc'><%=vo.getDoc() %></textarea>

				<button>수정하기</button>
				<a href='list.jsp'>목록으로</a> <input type='hidden' name='serial'
					value='<%=vo.getSerial() %>' />
			</form>
		</div>
	</div>
	<script src='./js/sn.js'></script>
</body>
</html>