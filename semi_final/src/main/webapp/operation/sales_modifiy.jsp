<%-- <%@page import="operation.OperationVo"%>
<%@page import="operation.OperationDao"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>sales_modify</title>           
   </head>
   <body>

      <h2>판매정보 수정</h2>
      <form id = "sales_modify.jsp" name = 'frm_student' method = 'post'>
         <div>
            <span class = 'cc1'>생산일</span>
            <span class = 'cc2'><input type = "date" id='date' name = 'date' value = '${vo.date }'/></span>
         </div>
         <div>
            <span class = 'cc1'>제품코드</span>
            <span class = 'cc2'>
            <input type = "text" size = '14' id='phone1' name = 'pr_code' value='${vo.pr_code }'></span>
         </div>
         <div>
            <span class = 'cc1'>불량여부</span>
            <span class = 'cc2'><input type = "text"  id='pf' name = 'pf' value = '${vo.pf }'></span>
            <%-- <span class = 'cc2'><input type = "text"  id='pf' name = 'pf' value = '${vo.pf }'>F</span> --%>
         </div>

         
         <div>
            <span class = 'cc1'>업데이트 일자</span>
            <span class = 'cc2'>
            <input type = "text"  name = 'update_time' value = '${vo.update_time }'/>
            <%-- <input type = "text"  name = 'machine_no' value = '${vo.machine_no }'/>2 --%>
            </span>
         </div>            
   		 <div>
            <span class = 'cc1'>Pr_cost</span>
            <span class = 'cc2'><input type = "text" size = '18' id='pr_cost' name = 'pr_cost' value = '${vo.pr_cost }'></span>
         </div>
         
         <div>
            <span class = 'cc1'>Real_price</span>
            <span class = 'cc2'><input type = "text" size = '18' id='real_price' name = 'real_price' value = '${vo.real_price }'></span>
         </div>
         <br/>   
         <div>
            <span class = 'cc1'></span>
            <span class = 'cc2'>
                 <input type = "button" id='btnModify' value = "수정">
                 <input type = "button" value = "삭제" id = 'btnDelete'>
                 <input type = "button" value = "취소" id = 'btnSelect'></span>
         </div>
        <%--  <input type = 'hidden' name = 'findStr' value = '${pageVo.findStr }'/>
         <input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/> --%>
      </form>   
      
      <script>
      
      </script>
      
   </body>
</html>