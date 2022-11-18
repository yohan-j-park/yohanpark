<%@page import="jdbc.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login_result.jsp</title>
</head>
<body>
<%
String mId = request.getParameter("mId");
String pwd = request.getParameter("pwd"); 

Login l = new Login();
String b = l.login(mId, pwd);

if(b!=null){
   session.setAttribute("sessionId", mId);
   session.setAttribute("sessionPwd", pwd);

   session.setAttribute("Access_level", b);

   response.sendRedirect("../index.jsp");
}else{
   out.print("<script>alert('아이디 혹은 비밀번호가 올바르지 않습니다.');</script>");
   out.print("<script>history.back();</script>");
}


%>
</body>
</html>