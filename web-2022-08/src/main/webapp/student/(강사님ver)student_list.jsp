<%@page import="student.StudentVo"%>
<%@page import="java.util.List"%>
<%@page import="student.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 정보 조회</title>
<link rel='stylesheet' href='./student/(강사님ver)student.css'>
<script defer src='js/student.js'></script>
</head>
<body>
<jsp:useBean id="pageVo" class="student.Page"/>
<jsp:setProperty property="*" name="pageVo"/>
<%
StudentDao dao = new StudentDao();
List<StudentVo> list = dao.select(pageVo);
%>


<div id='std_list'>
	<h2>학생정보 조회</h2>
	<form name='frm_search' method='post'>
		<input type='button' value='입력' name='btnInsert'/>
		<input type='search' name='findstr' size='40' value="<%=pageVo.getFindStr()%>"/>
		<input type='button' value='조회' name='btnSelect'/>
		<input type='text' name='nowPage' value="<%=pageVo.getNowPage()%>"/>
	</form>
	<ul>
		<a href='http://localhost:8888/web-2022-08/student/(%EA%B0%95%EC%82%AC%EB%8B%98ver)student_input_form.jsp'>
		<li class='title'> <!-- 타이틀 영역 -->
			<span class='no'>No</span>
			<span class='id'>아이디</span>
			<span class='name'>성명</span>
			<span class='gender'>성별</span>
			<span class='phone'>연락처</span>
			<span class='address'>주소</span>
			<span class='email'>이메일</span>
			<span class='zipcode'>우편번호</span>
		</li>
		<% for(int i=1; i<list.size(); i++){ 
			StudentVo v = list.get(i);
		%>
			<li class='item'>
				<span class='no'><%=i %></span>
				<span class='id'><%=v.getId() %></span>
				<span class='name'><%=v.getName() %></span>
				<span class='gender'><%=v.getGender() %></span>
				<span class='phone'><%=v.getPhone() %></span>
				<span class='address'><%=v.getAddress() %></span>
				<span class='email'><%=v.getEmail() %></span>
				<span class='zipcode'><%=v.getZipcode() %></span>
		<%} %>
		<li class='btn_page'> <!-- page이동 버튼 -->
			<input type='button' value='처음'/>
			<input type='button' value='이전'/>
			
			<input type='button' value='1'/>
			<input type='button' value='2'/>
			<input type='button' value='3'/>
			<input type='button' value='4'/>
			
			<input type='button' value='다음'/>
			<input type='button' value='맨끝'/>
		</li>
		</a>
	</ul>
</div>


</body>
</html>