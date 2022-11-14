<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>sales_modify</title>
      <link rel = 'stylesheet' href = './css/sales_modify.css'>
      <script defer src = 'js/sales_modify.js'></script>
      <script defer src = 'js/sales.js'></script>    
   </head>
   <body onload = 'onload()'>
	<div id='modify_wrapper'>
      <form id = "sales_modify" name = 'frm_sales' method = 'post'>
         <div>
      		<h2>판매정보 수정</h2>
            <span class = 'cc1'>생산일</span>
            <span class = 'cc2'><input type = "date" id='date' name = 'date' value = '${vo.date }'/></span>
         </div>
         <div>
            <span class = 'cc1'>제품코드</span>
            <span class = 'cc2'>
            <input type = "text" size = '14' id='pr_code' name = 'pr_code' value='${vo.pr_code }' readonly></span>
         </div>
         <div>
            <span class = 'cc1'>제품현황</span>
            <select name='status'>           
            <option value = '재고등록' ${(vo.status eq '재고등록')? 'selected' : '' }>재고등록</option>
            <option value = '판매완료' ${(vo.status eq '판매완료')? 'selected' : '' }>판매완료</option>
           </select>
         </div>
         <div>
            <span class = 'cc1'>Update_time</span>
            <span class = 'cc2'>
            <input type = "date"  name = 'update_time' value = '${vo.update_time }'/>
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
         <div>
            <span class = 'cc1'>VAT</span>
            <span class = 'cc2'><input type = "text" size = '18' id='vat' name = 'vat' value = '${vo.vat }'></span>
         </div>
         <div>
            <span class = 'cc1'>Supply_price</span>
            <span class = 'cc2'><input type = "text" size = '18' id='supply_price' name = 'supply_price' value = '${vo.supply_price }'></span>
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
         <input type = 'hidden' name = 'findUpdate_time' value = '${pageVo.findUpdate_time }'/>
         <input type = 'hidden' name = 'findPrname' value = '${pageVo.findPrname }'/>
         <input type = 'hidden' name = 'findStatus' value = '${pageVo.findStatus }'/>
         <input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/>
     
     	<input type = 'hidden' name = 'x01' value = '${list_cost.get(0).pr_name }'/>
        <input type = 'hidden' name = 'x02' value = '${list_cost.get(0).robot_cost }'/>
        <input type = 'hidden' name = 'x03' value = '${list_cost.get(0).profit_rate }'/>
        
        <input type = 'hidden' name = 'x11' value = '${list_cost.get(1).pr_name }'/>
        <input type = 'hidden' name = 'x12' value = '${list_cost.get(1).robot_cost }'/>
        <input type = 'hidden' name = 'x13' value = '${list_cost.get(1).profit_rate }'/>
        
        <input type = 'hidden' name = 'x21' value = '${list_cost.get(2).pr_name }'/>
        <input type = 'hidden' name = 'x22' value = '${list_cost.get(2).robot_cost }'/>
        <input type = 'hidden' name = 'x23' value = '${list_cost.get(2).profit_rate }'/>
        
        <input type = 'hidden' name = 'x31' value = '${list_cost.get(3).pr_name }'/>
        <input type = 'hidden' name = 'x32' value = '${list_cost.get(3).robot_cost }'/>
        <input type = 'hidden' name = 'x33' value = '${list_cost.get(3).profit_rate }'/>
        
        <input type = 'hidden' name = 'x41' value = '${list_cost.get(4).pr_name }'/>
        <input type = 'hidden' name = 'x42' value = '${list_cost.get(4).robot_cost }'/>
        <input type = 'hidden' name = 'x43' value = '${list_cost.get(4).profit_rate }'/>
        
        <input type = 'hidden' name = 'x51' value = '${list_cost.get(5).pr_name }'/>
        <input type = 'hidden' name = 'x52' value = '${list_cost.get(5).robot_cost }'/>
        <input type = 'hidden' name = 'x53' value = '${list_cost.get(5).profit_rate }'/>
      </form>   
      </div>
      <script>
      
      </script>
      
   </body>
</html>