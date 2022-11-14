<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="operation.OperationVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%

/* 

	**가장 처음 기계 부하 정도를 게이지로 표현하기**
	가동률 100%초과
	1일,2일 연속 : 노란색 , 3일 연속+ : 빨간색
	
	**선택기간반영o**
	일간	생산량추이 생산비율(6개 제품 가동률 불량률(양품률)
	
	**선택기간반영x**
	월간 생산량추이 생산비율 가동률 불량률(양품률)
	연간 생산량추이 생산비율 가동률 불량률(양품률)
	
	조금 더 정교하게 만들면 특정기간을 선택하게 해야 함. 시간 남으면 ㄱㄱ

*/

HashSet manyDays = new HashSet();
List<OperationVo> list= (ArrayList<OperationVo>)request.getAttribute("list");

for(int i = 0; i<list.size(); i++){
	manyDays.add(list.get(i).getDate());
}

ArrayList manyDaysAsc = new ArrayList(manyDays);
Collections.sort(manyDaysAsc);

Iterator iter = manyDaysAsc.iterator();

int cnt_day_quant_brain = 0;	//108분
int cnt_day_quant_neuron = 0;	//135분
int cnt_day_quant_arm = 0;		//60분
int cnt_day_quant_leg = 0;		//60분
int cnt_day_quant_body = 0;		//100분
int cnt_day_quant_head = 0;		//60분

int cnt_day_quant_brain_p = 0;	//108분
int cnt_day_quant_neuron_p = 0;	//135분
int cnt_day_quant_arm_p = 0;		//60분
int cnt_day_quant_leg_p = 0;		//60분
int cnt_day_quant_body_p = 0;		//100분
int cnt_day_quant_head_p = 0;		//60분

int cnt_day_quant_brain_f = 0;	//108분
int cnt_day_quant_neuron_f = 0;	//135분
int cnt_day_quant_arm_f = 0;		//60분
int cnt_day_quant_leg_f = 0;		//60분
int cnt_day_quant_body_f = 0;		//100분
int cnt_day_quant_head_f = 0;		//60분

int machine_time1 = 1080;
int machine_time2 = 1200;

for(int i = 0; i<list.size(); i++){
	switch(list.get(i).getPr_name()){
	case "엑스봇로봇두뇌" :		
		cnt_day_quant_brain++;
		switch(list.get(i).getPf()){
		case "p" : cnt_day_quant_brain_p++; break;
		}
		break;
	case "엑스봇로봇신경" :
		cnt_day_quant_neuron++;
		switch(list.get(i).getPf()){
		case "p" : cnt_day_quant_neuron_p++; break;
		}
		break;
	case "엑스봇로봇팔" :
		cnt_day_quant_arm++;
		switch(list.get(i).getPf()){
		case "p" : cnt_day_quant_arm_p++; break;
		}
		break;	
	case "엑스봇로봇다리" :
		cnt_day_quant_leg++;
		switch(list.get(i).getPf()){
		case "p" : cnt_day_quant_leg_p++; break;
		}
		break;	
	case "엑스봇로봇몸통" :
		cnt_day_quant_body++;
		switch(list.get(i).getPf()){
		case "p" : cnt_day_quant_body_p++; break;
		}
		break;	
	case "엑스봇로봇머리" :
		cnt_day_quant_head++;
		switch(list.get(i).getPf()){
		case "p" : cnt_day_quant_head_p++; break;
		}
		break;		
	}	
}

cnt_day_quant_brain_f = cnt_day_quant_brain-cnt_day_quant_brain_p;	//108분
cnt_day_quant_neuron_f = cnt_day_quant_neuron-cnt_day_quant_neuron_p;	//135분
cnt_day_quant_arm_f = cnt_day_quant_arm-cnt_day_quant_arm_p;		//60분
cnt_day_quant_leg_f = cnt_day_quant_leg-cnt_day_quant_leg_p;		//60분
cnt_day_quant_body_f = cnt_day_quant_body-cnt_day_quant_body_p;		//100분
cnt_day_quant_head_f = cnt_day_quant_head-cnt_day_quant_head_p;		//60분

int time_brain = cnt_day_quant_brain * 108;
int time_neuron = cnt_day_quant_neuron * 135;
int time_arm = cnt_day_quant_arm * 60;
int time_leg = cnt_day_quant_leg * 60;
int time_body = cnt_day_quant_body * 100;
int time_head = cnt_day_quant_head * 60;

int cnt_day = cnt_day_quant_brain
		   	 +cnt_day_quant_neuron
			 +cnt_day_quant_arm
			 +cnt_day_quant_leg
			 +cnt_day_quant_body
			 +cnt_day_quant_head;


/* 일자별 생산량 */
/* 날짜 오름차순 리스트와 사이즈가 같은 primitive type의 일별 생산량 */
int cnt_day_by_day[] = new int[manyDaysAsc.size()];
if(list.get(1).getDate().toString().equals(manyDaysAsc.get(0).toString())){
	System.out.println("true");
}else{
	System.out.println("false");
}





%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      
      
      google.charts.setOnLoadCallback(drawChart1);      
      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['제품명', '생산량'],
          ['엑스봇로봇두뇌', <%=cnt_day_quant_brain%>],
          ['엑스봇로봇신경', <%=cnt_day_quant_neuron%>],
          ['엑스봇로봇팔',  <%=cnt_day_quant_arm%>],
          ['엑스봇로봇다리', <%=cnt_day_quant_leg%>],
          ['엑스봇로봇몸통', <%=cnt_day_quant_body%>],
          ['엑스봇로봇머리', <%=cnt_day_quant_head%>]
        ]);

        var options = {
          title: '제품별 생산량(생산비율)',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }      
    </script>
    
    
    
    
    <script type='text/javascript'>
      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        data.addColumn('number', '1호기');
        data.addColumn('string', 'title');
        data.addColumn('string', 'text');
        data.addColumn('number', '2호기');
        data.addColumn('string', 'title');
        data.addColumn('string', 'text');
        
        
        
        <% for(int i=0; i<manyDays.size(); i++){ %>
        data.addRows([[new Date(<%=manyDaysAsc.get(i).toString().substring(0,4)%> , <%=manyDaysAsc.get(i).toString().substring(5,7)%>, <%=manyDaysAsc.get(i).toString().substring(8)%>),
                       111, 'Lalibertines', 'They are very tall',
            15766, 'Gallantors', 'First Encounter']]);
        <%}%>
        
        /* data.addRows([
       
          
          [new Date(2314, 2, 15), 12400, undefined, undefined,
                                  10645, undefined, undefined],
          [new Date(2314, 2, 16), 24045, 'Lalibertines', 'First encounter',
                                  12374, undefined, undefined],
          [new Date(2314, 2, 17), 35022, 'Lalibertines', 'They are very tall',
                                  15766, 'Gallantors', 'First Encounter'],
          [new Date(2314, 2, 18), 12284, 'Lalibertines', 'Attack on our crew!',
                                  34334, 'Gallantors', 'Statement of shared principles'],
          [new Date(2314, 2, 19), 8476, 'Lalibertines', 'Heavy casualties',
                                  66467, 'Gallantors', 'Mysteries revealed'],
          [new Date(2314, 2, 20), 0, 'Lalibertines', 'All crew lost',
                                  79463, 'Gallantors', 'Omniscience achieved'] 
        ]); */
        

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }
    </script>
    
    
    
    
</head>
<body>



	<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
	<div id='chart_div' style='width: 900px; height: 600px;'></div>
	
	
	
	<form name = 'frmStat' method = 'post'>
		<input type = 'text' name = 'findPrcode' value = '${pageVo.findPrcode }'/>
         <input type = 'text' name = 'findDate' value = '${pageVo.findDate }'/>
         <input type = 'text' name = 'findMachine_no' value = '${pageVo.findMachine_no }'/>
         <input type = 'text' name = 'findManager' value = '${pageVo.findManager }'/>
         <input type ='text' name = 'findPrname' value = '${pageVo.findPrname }'/>
         <input type = 'text' name = 'nowPage' value = '${pageVo.nowPage }'/>
         
	</form>
</body>
</html>