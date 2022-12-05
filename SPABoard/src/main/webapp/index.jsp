<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Starbucks Korea</title>
<link rel='icon' href='images/starbucks.png'/>
<link rel='stylesheet' href='css/index.css'/>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script defer src='js/index.js'></script>
</head>
<body>
<div id='main'>
    <header>
        <nav>
            <a href='index.jsp'>HOME</a>
            <a href='#' class='board'>게시판</a>
        </nav>
    </header>
    <div id='content'>
        <div class='info'>
            <h3>SPA(Single Page Application)를 제작함.</h3>
            <ul>
                <li>API & Library : servlet, jstl, ajax, jquery</li>
                <li>DB : mysql </li>
                <li>Framework : mybatis</li>
            </ul>               
        </div>
    </div>
    <footer>
        <font size='5' color='#00f'>S P A</font><br/>
        servlet,jstl,jquery,mysql로 만들어진 Single Page Application
    </footer>
</div>
</body>
</html>