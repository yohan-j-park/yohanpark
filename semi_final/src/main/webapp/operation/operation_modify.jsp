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
         
   </head>
   <body>

      <h2>생산정보 수정</h2>
      <form id = "operation_modify.jsp" name = 'frm_operation' method = 'post'>
         <div>
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
            <input type = "text" size = '14' id='pr_code' name = 'pr_code' value='${vo.pr_code }'></span>
         </div>
         <div>
            <span class = 'cc1' id='code1'>제품명</span>
            <span class = 'cc2'>
            <input type = "text" size = '10' id='pr_name' name = 'pr_name' value = '${vo.pr_name }'></span>
         </div>
         <div>
            <span class = 'cc1'>불량여부</span>
            <select name='pf'>
            <option value = 'p' ${(vo.pf eq 'p')? 'selected' : '' }>p</option>
            <option value = 'f' ${(vo.pf eq 'f')? 'selected' : '' }>f</option>
            </select>
         </div>
         <br/>   
         <div>
            <span class = 'cc1'></span>
            <span class = 'cc2'>
                 <input type = "button" id='btnModify' value = "수정">
                 <input type = "button" value = "삭제" id = 'btnDelete'>
                 <input type = "button" value = "목록" id = 'btnSelect'></span>
         </div>
         <input type = 'hidden' name = 'findPrcode' value = '${pageVo.findPrcode }'/>
         <input type = 'hidden' name = 'findDate' value = '${pageVo.findDate }'/>
         <input type = 'hidden' name = 'findMachine_no' value = '${pageVo.findMachine_no }'/>
         <input type = 'hidden' name = 'findManager' value = '${pageVo.findManager }'/>
         <input type = 'hidden' name = 'findPrname' value = '${pageVo.findPrname }'/>
         <input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/>
      </form>   
      
      <script>
      
      </script>
      
   </body>
</html>