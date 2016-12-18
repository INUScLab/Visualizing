<%@ page import="visualizing.read.WinPop"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	String stime = request.getParameter("stime");
	String etime = request.getParameter("etime");
	String sdate_m = request.getParameter("sdate_m");
	String edate_m = request.getParameter("edate_m");

	int stimeInt = Integer.parseInt(stime);
	int etimeInt = Integer.parseInt(etime);
	ArrayList<WinPop> array_list = wptrl.returnDatas(code, sdate, edate);
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<title>::: 수도검침서비스 :::</title>
<meta name="description" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="../css/font-awesome.min.css"
	type="text/css" />
<link rel="stylesheet" href="../css/font.css" type="text/css"
	cache="false" />
<link rel="stylesheet" href="../css/app.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="js/ie/respond.min.js" cache="false"></script>
    <script src="js/ie/html5.js" cache="false"></script>
    <script src="js/ie/fix.js" cache="false"></script>
  <![endif]-->
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
    Highcharts.chart('timechart', {
        title: {
            text: '시간별 그래프',
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
	
	function searchData(){
		var sdate=$("#sdate").val();
		var stime=$("#stime").val();
		var edate=$("#edate").val();
		var etime=$("#etime").val();
		var code=$("#code").val();
		var query = {
				sdate : sdate,
				stime : stime,
				edate : edate,
				etime : etime,
				code : code
			};
		$.ajax({
			type : "POST",
			url : "monthTablePro.jsp",
			data : query,
			success : function (data){
				$("#result").html(data);
			}
		});
	}
</script>
</head>
<body>
	<div class="row padder">
		<div class="col-md-6 p-r-none">
			<div class="panel">
				<!-- 검색조건 -->
				<!-- <form action="windowopen.jsp" method="post" id=search_form> -->
				<div class="well">
					<div class="row text-sm">
						<div class="form-group m-b-none">
							<label class="col-xs-3 control-label">검색일시</label>
							<div class="col-xs-7 form-inline">
								<input class="input-sm input-s-sm datepicker-input form-control"
									type="text" name="sdate" value="${param['sdate']}"
									data-date-format="yyyy-mm-dd" id="sdate"> <select
                        name=stime class="input-sm form-control input-s-sm inline"
                        id="stime">
                        <option value="0" <%if (stimeInt == 0) {%> selected <%}%>>0시</option>
                        <option value="1" <%if (stimeInt == 1) {%> selected <%}%>>1시</option>
                        <option value="2" <%if (stimeInt == 2) {%> selected <%}%>>2시</option>
                        <option value="3" <%if (stimeInt == 3) {%> selected <%}%>>3시</option>
                        <option value="4" <%if (stimeInt == 4) {%> selected <%}%>>4시</option>
                        <option value="5" <%if (stimeInt == 5) {%> selected <%}%>>5시</option>
                        <option value="6" <%if (stimeInt == 6) {%> selected <%}%>>6시</option>
                        <option value="7" <%if (stimeInt == 7) {%> selected <%}%>>7시</option>
                        <option value="8" <%if (stimeInt == 8) {%> selected <%}%>>8시</option>
                        <option value="9" <%if (stimeInt == 9) {%> selected <%}%>>9시</option>
                        <option value="10" <%if (stimeInt == 10) {%> selected <%}%>>10시</option>
                        <option value="11" <%if (stimeInt == 11) {%> selected <%}%>>11시</option>
                        <option value="12" <%if (stimeInt == 12) {%> selected <%}%>>12시</option>
                        <option value="13" <%if (stimeInt == 13) {%> selected <%}%>>13시</option>
                        <option value="14" <%if (stimeInt == 14) {%> selected <%}%>>14시</option>
                        <option value="15" <%if (stimeInt == 15) {%> selected <%}%>>15시</option>
                        <option value="16" <%if (stimeInt == 16) {%> selected <%}%>>16시</option>
                        <option value="17" <%if (stimeInt == 17) {%> selected <%}%>>17시</option>
                        <option value="18" <%if (stimeInt == 18) {%> selected <%}%>>18시</option>
                        <option value="19" <%if (stimeInt == 19) {%> selected <%}%>>19시</option>
                        <option value="20" <%if (stimeInt == 20) {%> selected <%}%>>20시</option>
                        <option value="21" <%if (stimeInt == 21) {%> selected <%}%>>21시</option>
                        <option value="22" <%if (stimeInt == 22) {%> selected <%}%>>22시</option>
                        <option value="23" <%if (stimeInt == 23) {%> selected <%}%>>23시</option>
                     </select> ~ <input
									class="input-sm input-s-sm datepicker-input form-control"
									type="text" name="edate" value="${param['edate']}"
									data-date-format="yyyy-mm-dd" id="edate"> <select
                        name=etime class="input-sm form-control input-s-sm inline"
                        id="etime">
                        <option value="0" <%if (etimeInt == 0) {%> selected <%}%>>0시</option>
                        <option value="1" <%if (etimeInt == 1) {%> selected <%}%>>1시</option>
                        <option value="2" <%if (etimeInt == 2) {%> selected <%}%>>2시</option>
                        <option value="3" <%if (etimeInt == 3) {%> selected <%}%>>3시</option>
                        <option value="4" <%if (etimeInt == 4) {%> selected <%}%>>4시</option>
                        <option value="5" <%if (etimeInt == 5) {%> selected <%}%>>5시</option>
                        <option value="6" <%if (etimeInt == 6) {%> selected <%}%>>6시</option>
                        <option value="7" <%if (etimeInt == 7) {%> selected <%}%>>7시</option>
                        <option value="8" <%if (etimeInt == 8) {%> selected <%}%>>8시</option>
                        <option value="9" <%if (etimeInt == 9) {%> selected <%}%>>9시</option>
                        <option value="10" <%if (etimeInt == 10) {%> selected <%}%>>10시</option>
                        <option value="11" <%if (etimeInt == 11) {%> selected <%}%>>11시</option>
                        <option value="12" <%if (etimeInt == 12) {%> selected <%}%>>12시</option>
                        <option value="13" <%if (etimeInt == 13) {%> selected <%}%>>13시</option>
                        <option value="14" <%if (etimeInt == 14) {%> selected <%}%>>14시</option>
                        <option value="15" <%if (etimeInt == 15) {%> selected <%}%>>15시</option>
                        <option value="16" <%if (etimeInt == 16) {%> selected <%}%>>16시</option>
                        <option value="17" <%if (etimeInt == 17) {%> selected <%}%>>17시</option>
                        <option value="18" <%if (etimeInt == 18) {%> selected <%}%>>18시</option>
                        <option value="19" <%if (etimeInt == 19) {%> selected <%}%>>19시</option>
                        <option value="20" <%if (etimeInt == 20) {%> selected <%}%>>20시</option>
                        <option value="21" <%if (etimeInt == 21) {%> selected <%}%>>21시</option>
                        <option value="22" <%if (etimeInt == 22) {%> selected <%}%>>22시</option>
                        <option value="23" <%if (etimeInt == 23) {%> selected <%}%>>23시</option>
                     </select>
							</div>
							<input type=hidden name="wherefrom" value="시간"> <input
								type=hidden name="sdate_m" value="${param['sdate_m']}">
							<input type=hidden name="edate_m" value="${param['edate_m']}">
							<input type=hidden name="code" value="${param['code']}" id="code">
							<div class="col-xs-12 text-right">
								<button class="btn btn-sm btn-default" id="search"
									onclick="searchData();">
									<i class="fa fa-search"></i> 검색
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- </form> -->
				<div class="table-responsive" id="result">
					<table class="table table-striped b-t-blue">
						<thead>
							<tr>
								<th width="5"></th>
								<th width="80">검침일시</th>
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
				</div>
			</div>
		</div>
		<div class="col-md-6 p-l-none">
			<div class="panel">
				<header class="panel-heading text-primary font-semibold h5">
					<i class="fa fa-chevron-circle-right"></i> 그래프
				</header>
				<div class="row m-t m-b wrapper">
					<div id="timechart" class="col-md-12"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>