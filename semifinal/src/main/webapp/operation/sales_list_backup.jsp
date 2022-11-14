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
      <title>sales list</title>
      <link rel = 'stylesheet' href = 'css/sales_list.css'>
      <script defer src = 'js/sales.js'></script>
   </head>
   <div class='list_body'>
      <div id=table_wrapper>
         <h1>판매정보 조회</h1>   
         
            
         <form id = "table" name = 'frm_search' method = 'post'>
            <div id = operationSearch>
            <input type="button" value="원가관리" name="salesCost"/><br/>
            <span>생산일</span>
            <input type = "date" value = "2020-01-01" min = "2020-01-01"/><br/>
            <span>판매일</span>
            <input type = "date" value = "2020-01-01" min = "2020-01-01"/><br/>
            <span>제품명</span>
            <label><input type = "checkbox" value="엑스봇로봇두뇌" name="checkPrname"/>엑스봇로봇두뇌</label>
            <label><input type = "checkbox" value="엑스봇로봇신경" name="checkPrname"/>엑스봇로봇신경</label>
            <label><input type = "checkbox" value="엑스봇로봇머리" name="checkPrname"/>엑스봇로봇머리</label>
            <label><input type = "checkbox" value="엑스봇로봇몸통" name="checkPrname"/>엑스봇로봇몸통</label>
            <label><input type = "checkbox" value="엑스봇로봇팔" name="checkPrname"/>엑스봇로봇팔</label>
            <label><input type = "checkbox" value="엑스봇로봇다리" name="checkPrname"/>엑스봇로봇다리</label><br/>
            <span>Status</span>
            <select>
               <option value="재고등록">재고등록</option>
               <option value="판매완료">판매완료</option>
            </select>
            <br/>
            
            <span>부품명</span>
            <select>
               <option value="1">1</option>
               <option value="2">2</option>               
            </select>
            <br/>
            <span>제품코드</span>
            <input type = "search" name = 'findStr' value = "${pageVo.findStr }" size ="23" placeholder ="제품 코드를 입력해 주세요"/>
            <input type = "button" value = "조회" name = 'btnSelect'/>
            <input type = 'hidden' name = 'nowPage' value = "${pageVo.nowPage }"/>
            <input type = "button" value = "통계" name = 'btnStat' />
            <br/>
            <input type = "button" value = "데이터 추가" name = 'btnInsert' /><br/>
            </div>
         </form>
         <div id = "r1">
            <span class = "c1">No</span>
            <span class = "c2">생산일</span>
            <span class = "c3">제품코드</span>
            <span class = "c4">제품명</span>
            <span class = "c5">제품상태</span>
            <span class = "c6">제품이름</span>
            <span class = "c7">생산시간</span>
            <span class = "c8">불량여부</span>
            <span class = "c9">재고상태</span>
         </div>
      </div>

      <c:forEach var='v' items='${list }' varStatus='status'>
         <div class='item' onclick = "view('${v.pr_code}')">
            <span class='c1'>${status.count }</span>
            <span class='c2'>${v.date }</span>
            <span class='c3'>${v.machine_no }</span>
            <span class='c4'>${v.manager }</span>
            <span class='c5'>${v.pr_code }</span>
            <span class='c6'>${v.pr_name }</span>
            <span class='c7'>${v.taken_time }</span>
            <span class='c8'>${v.pf }</span>
            <span class='c9'>${v.status }</span>
           </div>
      </c:forEach>


      <%-- <div id = "bottom_line">
      </div>
      <div class = "pageNumber"><!-- page 이동 버튼 -->
         <c:if test="${pageVo.startPage>1 }">
            <input type = "button" style="cursor: pointer;" value = "처음" onclick = 'movePage(1)'/>
            <input type = "button" style="cursor: pointer;" value = "이전" onclick = 'movePage(${pageVo.startPage-1})'/>
         </c:if>
         
         
         <c:forEach var='i' begin='${pageVo.startPage }' end='${pageVo.endPage }'>
            <input type = "button" style="cursor: pointer;" value = "${i }" onclick = 'movePage(${i})'/>
         </c:forEach>
         
         <c:if test="${pageVo.totPage gt pageVo.endPage }">
            <input type = "button" style="cursor: pointer;" value = "다음" onclick = 'movePage(${pageVo.endPage+1})'/>
            <input type = "button" style="cursor: pointer;" value = "끝" onclick = 'movePage(${pageVo.totPage})'/>
         </c:if>
      </div>       --%>            
   </div>
</html>