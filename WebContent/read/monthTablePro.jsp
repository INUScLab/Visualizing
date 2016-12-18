<%@page import="visualizing.read.WinPop"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="wptrl" class="visualizing.read.WinPopCtrl" />
<%
	String code = request.getParameter("code");
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");

	ArrayList<WinPop> array_list = wptrl.returnDatas(code, sdate, edate);
%>
<script src="../js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../js/bootstrap.js"></script>
<!-- App -->
<script src="../js/app.js"></script>
<script src="../js/app.plugin.js"></script>
<script src="../js/app.data.js"></script>
<!-- datepicker -->
<script src="../js/datepicker/bootstrap-datepicker.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script>
/* High Chart1 */
$(function () {
Highcharts.chart('monthchart', {
    title: {
        text: '월별 그래프',
        x: -20 //center
    },
    xAxis: {
        categories: [
		            <%for (int i = 0; i < array_list.size(); i++) {%>
			        	'<%=array_list.get(i).getDate()%>',
		      		<%}%>
  					]
    },
    yAxis: {
        title: {
            text: '검침값'
        },
        plotLines: [{
            value: 0,
            width: 1,
            color: '#808080'
        }]
    },
    series: [{
        name: '검침값',
        data: [
	            <%for (int i = 0; i < array_list.size(); i++) {%>
	        	<%=array_list.get(i).getConsumed()%>,
      			<%}%>
			  ]
    }]
});
});
</script>
<table class="table table-striped b-t-blue">
	<thead>
		<tr>
			<th width="5"></th>
			<th width="80">검침월</th>
			<th width="70">검침값</th>
			<th width="70">사용량</th>
		</tr>
	</thead>
	<tbody>
		<%
			for (int i = 0; i < array_list.size(); i++) {
		%>
		<tr>
			<td><%=i + 1%></td>
			<td><%=array_list.get(i).getDate()%></td>
			<td><%=array_list.get(i).getConsumed()%></td>
			<td></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>