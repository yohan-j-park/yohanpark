<%@page import="operation.OperationVo"%>
<%@page import="java.util.List"%>
<%@page import="operation.OperationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>cost list</title>
      <link rel = 'stylesheet' href = 'css/cost_list.css'>
      <script defer src = 'js/cost.js'></script>
   </head>
   <body>
   <div class='cost_body'>
      <div id=table_wrapper>
         <h1>원가 관리</h1>   
        
        <form name = 'frmSearch' method = 'post'></form>
        
         <div id='cost_table1'>
            <span class='pr_name'>제품명</span>
            <span class='pr_cost'> 단가</span>
            <span class='pr_rate'>이익률</span>
         </div>
         
         <c:forEach var='v' items='${list }' varStatus='status'>
         <div id='cost_table2' onclick="view('${v.pr_name}')">
            <span class='c1'>${v.pr_name }</span>
            <span class='c2'>${v.robot_cost }</span>
            <span class='c3'>${v.profit_rate }</span>
         </div>
         </c:forEach>
         
         
      </div>
   </div>
      
   </body>
</html>