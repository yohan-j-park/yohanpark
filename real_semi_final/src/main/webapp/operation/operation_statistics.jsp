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
<script defer src = 'js/operation.js'></script>

   <%


   
   
/* 

   **가장 처음 기계 부하 정도를 게이지로 표현하기**
   가동률 100%초과
   1일,2일 연속 : 노란색 , 3일 연속+ : 빨간색
   
   **선택기간반영o**
   일간   생산량추이 생산비율(6개 제품) 가동률 불량률(양품률)
   
   **선택기간반영x**
   월간 생산량추이 생산비율 가동률 불량률(양품률)
   연간 생산량추이 생산비율 가동률 불량률(양품률)
   
   조금 더 정교하게 만들면 특정기간을 선택하게 해야 함. 시간 남으면 ㄱㄱ

*/

HashSet manyDays = new HashSet();
List<OperationVo> list_stat= (ArrayList<OperationVo>)request.getAttribute("list_stat");


for(int i = 0; i<list_stat.size(); i++){
   manyDays.add(list_stat.get(i).getDate());
}

ArrayList manyDaysAsc = new ArrayList(manyDays);
Collections.sort(manyDaysAsc);

Iterator iter = manyDaysAsc.iterator();

/*1호기 2호기로 생산한 제품 전체 개수*/
int first_machine_cnt = 0;
int second_machine_cnt = 0;

for(int i = 0; i<list_stat.size(); i++){
   if(list_stat.get(i).getMachine_no().toString().equals("1")){
      first_machine_cnt++;
   }else{
      second_machine_cnt++;
   }
}

/* 날짜별 1호기 2호기 생산 개수 */
int[] first_machine_by_day = new int[manyDaysAsc.size()];
int[] second_machine_by_day = new int[manyDaysAsc.size()];

for(int i = 0; i<manyDaysAsc.size(); i++){
   for(int j = 0; j<list_stat.size(); j++){
      if(list_stat.get(j).getMachine_no().toString().equals("1")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
         first_machine_by_day[i]++;
      }
   }
   for(int j = 0; j<list_stat.size(); j++){
      if(list_stat.get(j).getMachine_no().toString().equals("2")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
         second_machine_by_day[i]++;
      }
   }
}

int cnt_day_quant_brain = 0;   //108분
int cnt_day_quant_neuron = 0;   //135분
int cnt_day_quant_arm = 0;      //60분
int cnt_day_quant_leg = 0;      //60분
int cnt_day_quant_body = 0;      //100분
int cnt_day_quant_head = 0;      //60분

/* int cnt_day_quant_brain_p = 0;   //108분
int cnt_day_quant_neuron_p = 0;   //135분
int cnt_day_quant_arm_p = 0;      //60분
int cnt_day_quant_leg_p = 0;      //60분
int cnt_day_quant_body_p = 0;      //100분
int cnt_day_quant_head_p = 0;      //60분

int cnt_day_quant_brain_f = 0;   //108분
int cnt_day_quant_neuron_f = 0;   //135분
int cnt_day_quant_arm_f = 0;      //60분
int cnt_day_quant_leg_f = 0;      //60분
int cnt_day_quant_body_f = 0;      //100분
int cnt_day_quant_head_f = 0;      //60분

int machine_time1 = 1080;
int machine_time2 = 1200; */

for(int i = 0; i<list_stat.size(); i++){
   switch(list_stat.get(i).getPr_name()){
   case "엑스봇로봇두뇌" :      
      cnt_day_quant_brain++;
      break;
   case "엑스봇로봇신경" :
      cnt_day_quant_neuron++;
      break;
   case "엑스봇로봇팔" :
      cnt_day_quant_arm++;
      break;   
   case "엑스봇로봇다리" :
      cnt_day_quant_leg++;
      break;   
   case "엑스봇로봇몸통" :
      cnt_day_quant_body++;
      break;   
   case "엑스봇로봇머리" :
      cnt_day_quant_head++;
      break;      
   }   
}

/* int time_brain = cnt_day_quant_brain * 108;
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
          +cnt_day_quant_head; */

/* 일자별 생산량 */
/* 날짜 오름차순 리스트와 사이즈가 같은 primitive type의 일별 생산량 */

int cnt_day_by_day[] = new int[manyDaysAsc.size()];
for(int i = 0; i<manyDaysAsc.size(); i++){
   for(int j = 0; j<list_stat.size(); j++){
      if(list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
         cnt_day_by_day[i]++;
      }
   }
}

/* 가동률 */
double[] util_rate_1 = new double[manyDaysAsc.size()];
double[] util_rate_2 = new double[manyDaysAsc.size()];
for(int i = 0; i<manyDaysAsc.size(); i++){
   for(int j = 0; j<list_stat.size(); j++){
      if(list_stat.get(j).getMachine_no().toString().equals("1")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
         util_rate_1[i] += Double.parseDouble(list_stat.get(j).getTaken_time())/1080;
      }
   }
   for(int j = 0; j<list_stat.size(); j++){
      if(list_stat.get(j).getMachine_no().toString().equals("2")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
         util_rate_2[i] += Double.parseDouble(list_stat.get(j).getTaken_time())/1200;
      }
   }
}

/* 날짜별 양품률/불량률 */
double[] pf_rate_f = new double[manyDaysAsc.size()];
double[] pf_rate_p = new double[manyDaysAsc.size()];
for(int i = 0; i<manyDaysAsc.size(); i++){
   for(int j = 0; j<list_stat.size(); j++){
      if(list_stat.get(j).getPf().toString().equals("f")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
         pf_rate_f[i] += 1.0/cnt_day_by_day[i];
      }
   }
   for(int j = 0; j<list_stat.size(); j++){
      if(list_stat.get(j).getPf().toString().equals("p")&&list_stat.get(j).getDate().toString().equals(manyDaysAsc.get(i).toString())){
         pf_rate_p[i] += 1.0/cnt_day_by_day[i];
      }
   }
}

%>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
      google.charts.load('current', {'packages':['gauge']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['1호기', <%=util_rate_1[manyDaysAsc.size()-1]*100%>],
          ['2호기', <%=util_rate_2[manyDaysAsc.size()-1]*100%>]
        ]);

        var options = {
          width: 900, height: 300,
          redFrom: 90, redTo: 100,
          yellowFrom:80, yellowTo: 90,
          minorTicks: 5
        };

        var chart = new google.visualization.Gauge(document.getElementById('chart_div_3'));

        chart.draw(data, options);

        setInterval(function() {
          data.setValue(0, 1, <%=util_rate_1[manyDaysAsc.size()-1]*100-8%> + Math.round(16 * Math.random()));
          chart.draw(data, options);
        }, 2000);
        setInterval(function() {
          data.setValue(1, 1, <%=util_rate_2[manyDaysAsc.size()-1]*100-8%> + Math.round(16 * Math.random()));
          chart.draw(data, options);
        }, 1900);         
      }
    </script>


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
        data.addColumn('number', '총생산량');
        data.addColumn('string', 'title');
        data.addColumn('string', 'text');
        data.addColumn('number', '1호기');
        data.addColumn('string', 'title');
        data.addColumn('string', 'text');
        data.addColumn('number', '2호기');
        data.addColumn('string', 'title');
        data.addColumn('string', 'text'); 
        
        /* System.out.println(Arrays.toString(first_machine_by_day));
        System.out.println(Arrays.toString(second_machine_by_day)); */
        
        <% for(int i=0; i<manyDays.size(); i++){ %>
           data.addRows([
              
              [new Date(<%=manyDaysAsc.get(i).toString().substring(0,4)%> , <%=manyDaysAsc.get(i).toString().substring(5,7)%>, <%=manyDaysAsc.get(i).toString().substring(8)%>),
                         <%=cnt_day_by_day[i]%>, undefined, undefined,
                         <%=first_machine_by_day[i]%>, undefined, undefined,
                         <%=second_machine_by_day[i]%>, undefined, undefined]
                      
           ]);
        <%}%>
        
        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true
        };

        chart.draw(data, options);
      }
    </script>
    
    
    
    
 <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawTrendlines);

    function drawTrendlines() {
          var data = new google.visualization.DataTable();
          data.addColumn('number', 'X');
          /* data.addColumn('number', '전체가동률'); */
          data.addColumn('number', '1호기');
          data.addColumn('number', '2호기');
          
          <% for(int i=0; i<manyDays.size(); i++){ %>
             data.addRows([
                [<%=i%>, <%=util_rate_1[i]*100%>, <%=util_rate_2[i]*100%>]                 
               ]);
          <%}%>
          
          
         

          var options = {
            hAxis: {
              title: '영업일(설립일 기준 +)'
            },
            vAxis: {
              title: '가동률(백분율, %)'
            },
            colors: ['#AB0D06', '#007329'],
            trendlines: {
              0: {type: 'exponential', color: '#333', opacity: 1},
              1: {type: 'linear', color: '#111', opacity: .3}
            }
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div_2'));
          chart.draw(data, options);
        } 
 </script>
 
  <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawTrendlines);

    function drawTrendlines() {
          var data = new google.visualization.DataTable();
          data.addColumn('number', 'X');
          /* data.addColumn('number', '전체가동률'); */
          data.addColumn('number', '불량률');
          data.addColumn('number', '양품률');
          
          <% for(int i=0; i<manyDays.size(); i++){ %>
             data.addRows([
                [<%=i%>, <%=pf_rate_f[i]*100%>, <%=pf_rate_p[i]*100%>]                 
               ]);
          <%}%>
          
          
         

          var options = {
            hAxis: {
              title: '영업일(설립일 기준 +)'
            },
            vAxis: {
              title: '불량률과 양품률(백분율, %)'
            },
            colors: ['#AB0D06', '#007329'],
            trendlines: {
              0: {type: 'exponential', color: '#333', opacity: 1},
              1: {type: 'linear', color: '#111', opacity: .3}
            }
          };

          var chart = new google.visualization.LineChart(document.getElementById('chart_div_4'));
          chart.draw(data, options);
        } 
 </script>    
    
    
   
    
    
</head>
<body>


 
 
   <input type = 'button' name = 'btnBack' id = 'btnBack' value = '돌아가기' onclick = 'btnBack()'/>

   <div id="chart_div_3" style="width: 900px; height: 300px;"></div>
   <div id="piechart_3d" style="width: 900px; height: 600px;"></div>
   <div id='chart_div' style='width: 900px; height: 600px;'></div>
   <div id="chart_div_2" style='width: 900px; height: 600px;'></div>
   <div id="chart_div_4" style='width: 900px; height: 600px;'></div>
   
   <form name = 'frmStat' method = 'post'>       
       <input type = 'hidden' name = 'findPrcode' value = '${pageVo.findPrcode }'/>
         <input type = 'hidden' name = 'findDate' value = '${pageVo.findDate }'/>
         <input type = 'hidden' name = 'findMachine_no' value = '${pageVo.findMachine_no }'/>
         <input type = 'hidden' name = 'findManager' value = '${pageVo.findManager }'/>
         <input type ='hidden' name = 'findPrname' value = '${pageVo.findPrname }'/>
         <input type = 'hidden' name = 'nowPage' value = '${pageVo.nowPage }'/>         
   </form>
</body>
</html>