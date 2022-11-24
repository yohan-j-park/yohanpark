<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mail/mail_form.jsp</title>
<style>
 #mail{
  width:500px;
  border:3px solid #aaa;
  margin:auto; 50px;
  padding:30px;
 }
 input[type=text]{ width: 450px;}
 textarea{ width: 450px;}
 div>label{ vertical-align: top;}
 .btn{ 
  width:100%;
  text-align: center;
 }
 .msg{
  margin:30px;
  text-align: center;
 }
</style>
</head>
<body>
<div id='mail'>
 <h1>암호 찾기</h1>
 <form name='form_mail' method='post'>
   <label>아이디</label><input type='text' name='mid'  value="a005"><br/>
   <label>이메일 <font color='grey'>(*암호찾기 메일은 가입 시 입력한 이메일로 전송됩니다.)</font></label>
   <input type='text' name='email' value="p_yohan@naver.com"><br/>
   <div class='content'>
   <input type='hidden' name='sender'>
   </div>
   <hr/>
   <div class='btn'>
    <input type='button' value='암호 찾기' onclick="sendMail()"> 
   </div>
 </form>
</div> 

<script>
 var frm = document.form_mail;
 function sendMail(){
  frm.sender.value="p_yohan@naver.com";
  frm.action='../SendPwdServlet.do';
  frm.submit();
 }
</script>
</body>
</html>