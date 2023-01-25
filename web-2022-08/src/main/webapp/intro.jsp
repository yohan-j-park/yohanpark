<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<!-- JS -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<title>코드레벨업 - 코덥!</title>
<style>
*{
	margin:0; padding:0;
	box-sizing:border-box;
	text-decoration:none;
	scroll-behavior:smooth;
}
header{
	position: fixed;
	top:0; left:0; right:0;
	z-index:1000;
	background:#bb2642;
	padding:25px;
	text-align:center;
}
header nav a{
	padding:10px 25px;
	color:#fff;
	font-size: 20px;
	text-transform:capitalize;
}
header nav a.active,

header nav a:hover{
	background:white;
	color:#bb2642;
	border-radius:5px;
}

section {
	margin: 0 auto;
	text-align: center;
	background-color: #ccc;
}


.container div {
	background-color: white;
	width: 100%;
	min-height:100vh;
	align-items:center;
	justify-content:center;
	font-size:7em;
	color:#ccc;
	font-weight:bolder;
	padding-bottom:70px;
	text-transform:uppercase;
}
.container div:nth-child(odd){
	background-color:black;
}
</style>
</head>
<body>
<header>
	<nav>
		<a class="active" href="#pixel">픽셀</a>
		<a href="#QnA">Q&A</a>
		<a href="#infoShare">정보공유</a>
		<a href="#community">자유게시판</a>
		<a href="#manSearch">구인게시판</a>
		<a href="#mantoman">멘토</a>
	</nav>
</header>
<section class="section section--code" style="margin-top: 1000px;">
	<div class="container pixel">
		<div class="code code--small code--left" data-aos="fade-down-right">
			pixel
		</div>
	</div>
	<div class="container QnA">
		<div class="code code--small code--left" data-aos="fade-down-left">
			Q&A
		</div>
	</div>
	<div class="container infoShare">
		<div class="code code--small code--left" data-aos="fade-down-right">
			infoShare
		</div>
	</div>
	<div class="container community">
		<div class="code code--small code--left" data-aos="fade-down-left">
			community
		</div>
	</div>
	<div class="container mansearch">
		<div class="code code--small code--left" data-aos="fade-down-right">
			mansearch
		</div>
	</div>
	<div class="container mantoman">
		<div class="code code--small code--left" data-aos="fade-down-left">
			mantoman
		</div>
	</div>		
</section>
<script> 
	AOS.init(); //자바스크립트로 init()을 해야 동작한다.
</script>
</body>
</html>