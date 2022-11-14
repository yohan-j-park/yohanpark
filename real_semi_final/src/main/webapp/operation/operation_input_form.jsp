<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>operation_input_form</title>
		<link rel = 'stylesheet' href = './css/operation_input_form.css'>
		<script defer src='js/operation_input_form.js'></script>
		<script defer src='js/operation.js'></script>
		<script src = '//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
	</head>
	<body>
	<jsp:useBean id = "pageVo" class = "operation.Page"/>
	<jsp:setProperty property = "*" name = "pageVo"/>
	
	<jsp:useBean id = "vo_cost" class = "operation.CostVo"></jsp:useBean>
	<jsp:setProperty property = "*" name = "vo_cost"/>
	
		<form id = "operation_input_form" name = 'frm_input' method = 'post'>
			<h2>생산정보 입력</h2>
			
			<div>
            <span class = 'cc1'>생산일</span>
            <span class = 'cc2'><input type = "date" id='date' name = 'date'/></span>
         </div>
         <div>
            <span class = 'cc1'>호기</span>
			<select name='machine_no'>           
            <option value = '1'>1</option>
            <option value = '2'>2</option>
           </select>
         </div>            
         <div>
            <span class = 'cc1'>담당자</span>
            <span class = 'cc2'>
               <input type = "text" size = '14' name = 'manager'/>
               </span>
         </div>
         <div>
            <span class = 'cc1'>제품코드</span>
            <span class = 'cc2'>
            <input type = "text" size = '14' id='pr_code' name = 'pr_code' onchange = 'auto_pr_info()'/></span>
         </div>
         <div>
            <span class = 'cc1' id='code1'>제품명</span>
            <span class = 'cc2'>
            <input type = "text" size = '10' id='pr_name' name = 'pr_name'></span>
         </div>
         <div>
            <span class = 'cc1'>불량여부</span>
            <select name='pf'>
            <option value = 'p'>p</option>
            <option value = 'f'>f</option>
            </select>
         </div>
         <br/>   
         <div>
            <span class = 'cc1'></span>
            <span class = 'cc2'>
                 <input type = "button" name='btnSave' value = "저장">
                 <input type = "button" value = "취소" name = 'btnCancel'>
            </span>
         </div>
         <input type = 'hidden' name = 'findPrcode' value = '${pageVo.findPrcode }'/>
         <input type = 'hidden' name = 'findDate' value = '${pageVo.findDate }'/>
         <input type = 'hidden' name = 'findMachine_no' value = '${pageVo.findMachine_no }'/>
         <input type = 'hidden' name = 'findManager' value = '${pageVo.findManager }'/>
         <input type = 'hidden' name = 'findPrname' value = '${pageVo.findPrname }'/>
         <input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/>
         
         <input type = 'hidden' name = 'taken_time'/>
         <input type = 'hidden' name = 'status'/>
         <input type = 'hidden' name = 'update_time'/>
         <input type = 'hidden' name = 'pr_cost'/>
         <input type = 'hidden' name = 'real_price'/>
         <input type = 'hidden' name = 'vat'/>
         <input type = 'hidden' name = 'supply_price'/>
         
     
  	 	    
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
      <script>
      
      </script>
	</body>
	
	
	
	
	
	
	
</html>
