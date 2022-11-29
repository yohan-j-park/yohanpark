<%@page import="member.MemberVo"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.MyFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mybatis/mybatis_test.jsp</title>
</head>
<body>
<h2>mybatis test</h2>
<%
JSONArray array = new JSONArray();
SqlSession sqlSession = MyFactory.getFactory().openSession();	//CRUD처리 준비
List<MemberVo> list = sqlSession.selectList("member.select", "1");	//member.xml에 <select>안에 ${_parameter}에 "h"가 들어감
for(MemberVo vo : list){
	out.print("<li>" + vo.getPhone());
}
%>
</body>
</html>

