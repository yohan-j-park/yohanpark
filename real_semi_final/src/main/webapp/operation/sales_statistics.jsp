<%@page import="java.util.Collections"%>
<%@page import="operation.OperationVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sales_statistics</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script defer src = 'js/sales.js'></script>
	<% 
	HashSet manyDays = new HashSet();
	List<OperationVo> list_stat= (ArrayList<OperationVo>)request.getAttribute("list_stat");
	
	for(int i = 0; i<list_stat.size(); i++){
		manyDays.add(list_stat.get(i).getDate());
	}

	
	
	ArrayList manyDaysAsc = new ArrayList(manyDays);
	Collections.sort(manyDaysAsc);
	
	/* 날짜별 판매량 */
	double[] sold = new double[manyDaysAsc.size()];
	double[] inven = new double[manyDaysAsc.size()];
	for(int i = 0; i<manyDaysAsc.size(); i++){
		for(int j = 0; j<list_stat.size(); j++){
			if(list_stat.get(j).getStatus().toString().equals("판매완료")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
				sold[i] += 1;
			}
		}
		for(int j = 0; j<list_stat.size(); j++){
			if(list_stat.get(j).getStatus().toString().equals("재고등록")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
				inven[i] += 1;
			}
		}
	}
	
	
	%>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Date', '판매량', '재고량'],
         
          <% for(int i=0; i<manyDays.size(); i++){ %>
      			['<%=manyDaysAsc.get(i)%>', <%=sold[i]%>, <%=inven[i]%>],
      	    <% if(i==manyDays.size()-1){ %>
      		    ['<%=manyDaysAsc.get(i)%>', <%=sold[i]%>, <%=inven[i]%>]
      	  	<%}%>
      	  <%}%>
          
          
          /* ['2013',  1000,      400],
          ['2014',  1170,      460],
          ['2015',  660,       1120],
          ['2016',  1030,      540] */
        ]);

        var options = {
          title: 'Company Performance',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>

    
	<input type = 'button' name = 'btnBack' id = 'btnBack' value = '돌아가기' onclick = 'btnBack()'/>
    <div id="chart_div" style="width: 100%; height: 500px;"></div>
    
    <form name = 'frmStat' method = 'post'>		 
       	 <input type = 'hidden' name = 'findPrcode' value = '${pageVo.findPrcode }'/>
         <input type = 'hidden' name = 'findDate' value = '${pageVo.findDate }'/>
         <input type = 'hidden' name = 'findUpdate_time' value = '${pageVo.findUpdate_time }'/>
         <input type = 'hidden' name = 'findPrname' value = '${pageVo.findPrname }'/>
         <input type = 'hidden' name = 'findStatus' value = '${pageVo.findStatus }'/>
         <input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/>        
	</form>
</body>
</html>