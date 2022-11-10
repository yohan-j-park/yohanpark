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
		<title>operation list</title>
		<link rel = 'stylesheet' href = 'css/operation_list.css'>
		<script defer src = 'js/operation.js'></script>
	</head>
	<div class='list_body'>
		<div id=table_wrapper>
			<h1>생산정보 조회</h1>	
			
				
			<form id = "table" name = 'frm_search' method = 'post'>
				<div id = operationSearch>
				<span>기준일</span>
				<input type = "date" value = "2020-01-01" min = "2020-01-01"/>
				<span>생산라인</span>
				<select>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
				<span>담당자</span>
				<select>
					<option value="1">1</option>
					<option value="2">2</option>					
				</select>
				<span>부품명</span>
				<select>
					<option value="1">1</option>
					<option value="2">2</option>					
				</select>
				<span>제품코드</span>
				<input type = "search" name = 'findStr' value = "${pageVo.findStr }" size ="23" placeholder ="제품 코드를 입력해 주세요"/>
				<input type = "button" value = "조회" name = 'btnSelect'/>
				<input type = 'hidden' name = 'nowPage' value = "${pageVo.nowPage }"/>
				<input type = "button" value = "통계" name = 'btnStat' />
				<input type = "button" value = "데이터 추가" name = 'btnInsert' /><br/>
				</div>
			</form>
			<div id = "r1">
				<span class = "c1">No</span>
				<span class = "c2">생산일</span>
				<span class = "c3">호기</span>
				<span class = "c4">매니저</span>
				<span class = "c5">제품코드</span>
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


		<div id = "bottom_line">
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
		</div>						
	</div>
</html>