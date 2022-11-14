<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login.jsp</title>
<link rel="stylesheet" href="css/login_css.css">
</head>
<body>
<div class="login-box">
	<h2>Login</h2>
    <form name='frm_login' method='post' action='member/login_result.jsp'>
    	<div class="user-box">
        	<input type='text' name='mId' required/>
        	<label>아이디</label>
        </div>
        <div class="user-box">
            <input type='password' name='pwd'  required/>
            <label>비밀번호</label>
        </div>
        <a href="#" onclick="document.frm_login.submit();">>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            로그인
        </a>
	</form>
</div>
    
</body>
</html>