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
	String sdate_m = request.getParameter("sdate_m");
	String edate_m = request.getParameter("edate_m");

	String sdate2 = sdate_m + "-01";
	String edate2 = edate_m + "-31";

	System.out.println("<month>");
	System.out.println(code);
	System.out.println(sdate);
	System.out.println(edate);
	System.out.println(sdate_m);
	System.out.println(edate_m);
	ArrayList<WinPop> array_list = wptrl.returnDatas2(code, sdate2, edate2);
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
	
	function searchData(){
		var sdate_m=$("#sdate_m").val();
		var edate_m=$("#edate_m").val();
		var code=$("#code").val();
		var query = {
				sdate_m : sdate_m,
				edate_m : edate_m,
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
				<!-- <form action="windowopen_temp.jsp?page=month" method="post"
				id=search_form> -->
				<div class="well">
					<div class="row text-sm">
						<div class="form-group m-b-none">
							<label class="col-lg-3 control-label">검색월</label>
							<div class="col-lg-7 form-inline">
								<input class="input-sm input-s-sm datepicker-input form-control"
									type="text" name="sdate_m" value="${param['sdate_m']}"
									data-date-format="yyyy-mm" id="sdate_m"
									onchange="changeData(this.value);"> ~ <input
									class="input-sm input-s-sm datepicker-input form-control"
									type="text" name="edate_m" value="${param['edate_m']}"
									data-date-format="yyyy-mm" id="edate_m"
									onchange="changeData(this.value);">
							</div>
							<input type=hidden name="wherefrom" value="월"> <input
								type=hidden name="sdate" value="${param['sdate']}"> <input
								type=hidden name="edate" value="${param['edate']}"> <input
								type=hidden name="code" value="${param['code']}" id="code">
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
				</div>
			</div>
		</div>
		<div class="col-md-6 p-l-none">
			<div class="panel">
				<header class="panel-heading text-primary font-semibold h5">
					<i class="fa fa-chevron-circle-right"></i> 그래프
				</header>
				<div class="row m-t m-b wrapper">
					<div id="monthchart"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>