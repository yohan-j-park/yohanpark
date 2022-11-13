<%@page import="operation.OperationVo"%>
<%@page import="operation.OperationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>operation_modify</title>
      <link rel = 'stylesheet' href = './css/operation_modify.css'>   
      <script defer src = 'js/operation.js'></script>
	  <link rel="preconnect" href="https://fonts.gstatic.com"> 
	  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
   </head>
   <body>
	<div id='modify_wrapper'>
      <form id = "operation_modify" name = 'frm_operation' method = 'post'>
         <div>
      		<h2>생산정보 수정</h2>
            <span class = 'cc1'>생산일</span>
            <span class = 'cc2'><input type = "date" id='date' name = 'date' value = '${vo.date }'/></span>
         </div>
         <div>
            <span class = 'cc1'>호기</span>
			<select name='machine_no'>           
            <option value = '1' ${(vo.machine_no eq '1')? 'selected' : '' }>1</option>
            <option value = '2' ${(vo.machine_no eq '2')? 'selected' : '' }>2</option>
           </select>
         </div>            
         <div>
            <span class = 'cc1'>담당자</span>
            <span class = 'cc2'>
               <input type = "text" size = '14' name = 'manager' value = '${vo.manager }'>
               </span>
         </div>
         <div>
            <span class = 'cc1'>제품코드</span>
            <span class = 'cc2'>
            <input type = "text" size = '14' id='pr_code' name = 'pr_code' value='${vo.pr_code }' readonly></span>
         </div>
         <div>
            <span class = 'cc1' id='code1'>제품명</span>
            <span class = 'cc2'>
            <input type = "text" size = '10' id='pr_name' name = 'pr_name' value = '${vo.pr_name }' readonly></span>
         </div>
         <div>
            <span class = 'cc1'>불량여부</span>
            <select name='pf'>
            <option value = 'p' ${(vo.pf eq 'p')? 'selected' : '' }>p</option>
            <option value = 'f' ${(vo.pf eq 'f')? 'selected' : '' }>f</option>
            </select>
         </div>
         <br/>   
         <div class='btnGroup'>
            <span class = 'cc1'></span>
            <span class = 'cc2'>
                 <button class='btn btn--hyperion' id='btnModify' value = "수정">수정</button>
                 <button class='btn btn--hyperion' value = "삭제" id = 'btnDelete'>삭제</button>
                 <button class='btn btn--hyperion' value = "목록" id = 'btnSelect'>목록</button>
                </span>
         </div>
         <input type = 'hidden' name = 'findPrcode' value = '${pageVo.findPrcode }'/>
         <input type = 'hidden' name = 'findDate' value = '${pageVo.findDate }'/>
         <input type = 'hidden' name = 'findMachine_no' value = '${pageVo.findMachine_no }'/>
         <input type = 'hidden' name = 'findManager' value = '${pageVo.findManager }'/>
         <input type = 'hidden' name = 'findPrname' value = '${pageVo.findPrname }'/>
         <input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/>
         
         </form>   
      </div>
      <script>
      
      </script>
      
   </body>
</html>