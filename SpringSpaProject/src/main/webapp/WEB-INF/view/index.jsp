<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring으로 만든 SPA게시판</title>
<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css'>
<link rel='icon' href='images/favicon.png'/>
<link rel='stylesheet' href='css/index.css'/>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script defer src='js/index.js'></script>
</head>
<body>
<div id='main'>
    <header>
		<img src='/images/spring1.png' class='img'/>
    	<font color='white' size='5' style='display:inline-block; position:absolute; margin-top:25px; margin-left:25px; width:300px; vertical-align:center;'>Spring으로 만든 SPA게시판</font>
		<nav>
			<a href="/" class="btn btn-outline-primary text-white index" >Home</a>
			<a href="javascript:void(0)" class="btn btn-outline-primary text-white board btnGuestBook">방명록</a>
			<a href="javascript:void(0)" class="btn btn-outline-primary text-white board btnBoard">게시판</a>		
		</nav>
    </header>
    <div id='content'>
        <div class='info1'>
            방명록리스트                      
        </div>
		 <div class='info2'>
            게시물리스트           
        </div>
    </div>
    <footer>
     Spring SPA Project
    </footer>
</div>

</body>
</html>