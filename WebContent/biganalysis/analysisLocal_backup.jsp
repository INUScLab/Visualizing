<%@ page import="visualizing.analysis.RankDataCtrl"%>
<%@ page import="visualizing.analysis.RankData"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<jsp:useBean id="rdctrl" class="visualizing.analysis.RankDataCtrl" />

<%
	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String startdate = request.getParameter("sdate");
	String enddate = request.getParameter("edate");
	
	if (si == null || si.equals(""))
		si = "인천광역시";
	if (guGun == null || guGun.equals(""))
		guGun = "강화군";

	// 오늘 날짜 구하기
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	Date currentDate = new Date();
	String date = mSimpleDateFormat.format(currentDate);
	SimpleDateFormat DateFormat = new SimpleDateFormat("M.d", Locale.KOREA);
	String textDate = DateFormat.format(currentDate);
	
	Calendar cal = Calendar.getInstance();
 	cal.setTime(currentDate);
 	cal.add(Calendar.DATE, -6);
    String edate = mSimpleDateFormat.format(cal.getTime());
    String temp = DateFormat.format(cal.getTime());
    String textDate2 = DateFormat.format(cal.getTime());
	
    RankData rd_data = rdctrl.returnDatas(si, guGun, edate, date);
    
	
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
<!--구글 그래프 그리기-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Load Charts and the corechart package.
	google.charts.load('current', {'packages' : [ 'corechart' ]});

	// 랭킹 그래프 로드
	google.charts.setOnLoadCallback(drawLeakRankChart);
	google.charts.setOnLoadCallback(drawFreezedRankChart);
	google.charts.setOnLoadCallback(drawFatRankChart);
	google.charts.setOnLoadCallback(drawBreakageRankChart);
	google.charts.setOnLoadCallback(drawReverseRankChart);
	google.charts.setOnLoadCallback(drawAbsenceRankChart);

	// 상위랭킹 한달간 데이터 그래프 로드
	google.charts.setOnLoadCallback(drawUpperLeakRankChart);
	google.charts.setOnLoadCallback(drawUpperFreezedRankChart);
	google.charts.setOnLoadCallback(drawUpperFatRankChart);
	google.charts.setOnLoadCallback(drawUpperBreakageRankChart);
	google.charts.setOnLoadCallback(drawUpperReverseRankChart);
	google.charts.setOnLoadCallback(drawUpperAbsenceRankChart);
	
	// 누수 랭킹 그래프
	function drawLeakRankChart() {

		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Element', 'Density', { role: 'style' }],
         ['<%=rd_data.getLeak_rank().get(0).get(0)%>', <%=rd_data.getLeak_rank().get(0).get(1)%>, '#FF4943'],
         ['<%=rd_data.getLeak_rank().get(1).get(0)%>', <%=rd_data.getLeak_rank().get(1).get(1)%>, '#7DCDF2'],  
         ['<%=rd_data.getLeak_rank().get(2).get(0)%>', <%=rd_data.getLeak_rank().get(2).get(1)%>, '#33B1EB'],
		 ['<%=rd_data.getLeak_rank().get(3).get(0)%>', <%=rd_data.getLeak_rank().get(3).get(1)%>, '#1871CD'],
        ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
	        legend: { position: "none" },
	        hAxis: {title: '읍/면/동'},
	        vAxis: {title: '누수 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.PieChart(document.getElementById('leak_rank_chart_div'));
		chart.draw(data, options);
	}
	
	// 동파 랭킹 그래프
	function drawFreezedRankChart() {

		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Element', 'Density', { role: 'style' }],
         ['<%=rd_data.getFreezed_rank().get(0).get(0)%>', <%=rd_data.getFreezed_rank().get(0).get(1)%>, '#FF4943'], 
         ['<%=rd_data.getFreezed_rank().get(1).get(0)%>', <%=rd_data.getFreezed_rank().get(1).get(1)%>, '#7DCDF2'],
         ['<%=rd_data.getFreezed_rank().get(2).get(0)%>', <%=rd_data.getFreezed_rank().get(2).get(1)%>, '#33B1EB'],
		 ['<%=rd_data.getFreezed_rank().get(3).get(0)%>', <%=rd_data.getFreezed_rank().get(3).get(1)%>, '#1871CD'],
        ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			legend: { position: "none" },
	        hAxis: {title: '읍/면/동'},
	        vAxis: {title: '동파 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.PieChart(document.getElementById('freezed_rank_chart_div'));
		chart.draw(data, options);
	}
	
	// 비만관 랭킹 그래프
	function drawFatRankChart() {
		<%System.out.println(startdate);%>
	

		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Element', 'Density', { role: 'style' }],
         ['<%=rd_data.getFat_rank().get(0).get(0)%>', <%=rd_data.getFat_rank().get(0).get(1)%>, '#FF4943'],
         ['<%=rd_data.getFat_rank().get(1).get(0)%>', <%=rd_data.getFat_rank().get(1).get(1)%>, '#7DCDF2'],
         ['<%=rd_data.getFat_rank().get(2).get(0)%>', <%=rd_data.getFat_rank().get(2).get(1)%>, '#33B1EB'],
		 ['<%=rd_data.getFat_rank().get(3).get(0)%>', <%=rd_data.getFat_rank().get(3).get(1)%>, '#1871CD'],
        ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			legend: { position: "none" },
	        hAxis: {title: '읍/면/동'},
	        vAxis: {title: '비만관 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.PieChart(document.getElementById('fat_rank_chart_div'));
		chart.draw(data, options);
	}
	
	// 파손 랭킹 그래프
	function drawBreakageRankChart() {

		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Element', 'Density', { role: 'style' }],
         ['<%=rd_data.getBreakage_rank().get(0).get(0)%>', <%=rd_data.getBreakage_rank().get(0).get(1)%>, '#FF4943'],
         ['<%=rd_data.getBreakage_rank().get(1).get(0)%>', <%=rd_data.getBreakage_rank().get(1).get(1)%>, '#7DCDF2'],
         ['<%=rd_data.getBreakage_rank().get(2).get(0)%>', <%=rd_data.getBreakage_rank().get(2).get(1)%>, '#33B1EB'],
		 ['<%=rd_data.getBreakage_rank().get(3).get(0)%>', <%=rd_data.getBreakage_rank().get(3).get(1)%>, '#1871CD'],
        ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			legend: { position: "none" },
	        hAxis: {title: '읍/면/동'},
	        vAxis: {title: '파손 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.PieChart(document.getElementById('breakage_rank_chart_div'));
		chart.draw(data, options);
	}
	
	// 역류 랭킹 그래프
	function drawReverseRankChart() {

		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Element', 'Density', { role: 'style' }],
         ['<%=rd_data.getReverse_rank().get(0).get(0)%>', <%=rd_data.getReverse_rank().get(0).get(1)%>, '#FF4943'],
         ['<%=rd_data.getReverse_rank().get(1).get(0)%>', <%=rd_data.getReverse_rank().get(1).get(1)%>, '#7DCDF2'],
         ['<%=rd_data.getReverse_rank().get(2).get(0)%>', <%=rd_data.getReverse_rank().get(2).get(1)%>, '#33B1EB'],
		 ['<%=rd_data.getReverse_rank().get(3).get(0)%>', <%=rd_data.getReverse_rank().get(3).get(1)%>, '#1871CD'],
        ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			legend: { position: "none" },
	        hAxis: {title: '읍/면/동'},
	        vAxis: {title: '역류 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.PieChart(document.getElementById('reverse_rank_chart_div'));
		chart.draw(data, options);
	}
	
	// 부재중 랭킹 그래프
	function drawAbsenceRankChart() {

		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Element', 'Density', { role: 'style' }],
         ['<%=rd_data.getAbsence_rank().get(0).get(0)%>', <%=rd_data.getAbsence_rank().get(0).get(1)%>, '#FF4943'],
         ['<%=rd_data.getAbsence_rank().get(1).get(0)%>', <%=rd_data.getAbsence_rank().get(1).get(1)%>, '#7DCDF2'],
         ['<%=rd_data.getAbsence_rank().get(2).get(0)%>', <%=rd_data.getAbsence_rank().get(2).get(1)%>, '#33B1EB'],
		 ['<%=rd_data.getAbsence_rank().get(3).get(0)%>', <%=rd_data.getAbsence_rank().get(3).get(1)%>, '#1871CD'],
        ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			legend: { position: "none" },
	        hAxis: {title: '읍/면/동'},
	        vAxis: {title: '부재중 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.PieChart(document.getElementById('absence_rank_chart_div'));
		chart.draw(data, options);
	}
	// 누수 상위 데이터 그래프
	function drawUpperLeakRankChart() {
		
		<%textDate2 = temp;%>
		
		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Date', '<%=rd_data.getLeak_rank().get(0).get(0)%>','<%=rd_data.getLeak_rank().get(1).get(0)%>','<%=rd_data.getLeak_rank().get(2).get(0)%>','<%=rd_data.getLeak_rank().get(3).get(0)%>'],
         <% for(int i=0; i<rd_data.getUpper_leak_data().get(0).size(); i++){ %>
         [ '<%=textDate2%>' ,<%=rd_data.getUpper_leak_data().get(0).get(i)%>, <%=rd_data.getUpper_leak_data().get(1).get(i)%>, <%=rd_data.getUpper_leak_data().get(2).get(i)%>, <%=rd_data.getUpper_leak_data().get(3).get(i)%>],
         <%// 시간 더하기
          Date sdate = DateFormat.parse(textDate2);
	   	  cal.setTime(sdate);
	   	  cal.add(Calendar.DATE, 1);
	      textDate2 = DateFormat.format(cal.getTime()); 
	      }%>
		 ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
	        hAxis: {title: '날짜'},
	        vAxis: {title: '누수 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.ColumnChart(document.getElementById('leak_upper_chart_div'));
		chart.draw(data, options);
	}
	
	// 동파 상위 데이터 그래프
	function drawUpperFreezedRankChart() {
		
		<%textDate2 = temp;%>
		
		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Date', '<%=rd_data.getFreezed_rank().get(0).get(0)%>','<%=rd_data.getFreezed_rank().get(1).get(0)%>','<%=rd_data.getFreezed_rank().get(2).get(0)%>','<%=rd_data.getFreezed_rank().get(3).get(0)%>'],
         <% for(int i=0; i<rd_data.getUpper_freezed_data().get(0).size(); i++){ %>
         [ '<%=textDate2%>' ,<%=rd_data.getUpper_freezed_data().get(0).get(i)%>, <%=rd_data.getUpper_freezed_data().get(1).get(i)%>, <%=rd_data.getUpper_freezed_data().get(2).get(i)%>, <%=rd_data.getUpper_freezed_data().get(3).get(i)%>],
         <%// 시간 더하기
          Date sdate = DateFormat.parse(textDate2);
	   	  cal.setTime(sdate);
	   	  cal.add(Calendar.DATE, 1);
	      textDate2 = DateFormat.format(cal.getTime()); 
	      }%>
		 ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
	        hAxis: {title: '날짜'},
	        vAxis: {title: '동파 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.ColumnChart(document.getElementById('freezed_upper_chart_div'));
		chart.draw(data, options);
	}
	
	// 비만관 상위 데이터 그래프
	function drawUpperFatRankChart() {
		
		<%textDate2 = temp;%>
		
		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Date', '<%=rd_data.getFat_rank().get(0).get(0)%>','<%=rd_data.getFat_rank().get(1).get(0)%>','<%=rd_data.getFat_rank().get(2).get(0)%>','<%=rd_data.getFat_rank().get(3).get(0)%>'],
         <% for(int i=0; i<rd_data.getUpper_fat_data().get(0).size(); i++){ %>
         [ '<%=textDate2%>' ,<%=rd_data.getUpper_fat_data().get(0).get(i)%>, <%=rd_data.getUpper_fat_data().get(1).get(i)%>, <%=rd_data.getUpper_fat_data().get(2).get(i)%>, <%=rd_data.getUpper_fat_data().get(3).get(i)%>],
         <%// 시간 더하기
          Date sdate = DateFormat.parse(textDate2);
	   	  cal.setTime(sdate);
	   	  cal.add(Calendar.DATE, 1);
	      textDate2 = DateFormat.format(cal.getTime()); 
	      }%>
		 ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			hAxis: {title: '날짜'},
	        vAxis: {title: '비만관 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}		
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.ColumnChart(document.getElementById('fat_upper_chart_div'));
		chart.draw(data, options);
	}
	
	// 파손 상위 데이터 그래프
	function drawUpperBreakageRankChart() {
		
		<%textDate2 = temp;%>
		
		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Date', '<%=rd_data.getBreakage_rank().get(0).get(0)%>','<%=rd_data.getBreakage_rank().get(1).get(0)%>','<%=rd_data.getBreakage_rank().get(2).get(0)%>','<%=rd_data.getBreakage_rank().get(3).get(0)%>'],
         <% for(int i=0; i<rd_data.getUpper_breakage_data().get(0).size(); i++){ %>
         [ '<%=textDate2%>' ,<%=rd_data.getUpper_breakage_data().get(0).get(i)%>, <%=rd_data.getUpper_breakage_data().get(1).get(i)%>, <%=rd_data.getUpper_breakage_data().get(2).get(i)%>, <%=rd_data.getUpper_breakage_data().get(3).get(i)%>],
         <%// 시간 더하기
          Date sdate = DateFormat.parse(textDate2);
	   	  cal.setTime(sdate);
	   	  cal.add(Calendar.DATE, 1);
	      textDate2 = DateFormat.format(cal.getTime()); 
	      }%>
		 ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			hAxis: {title: '날짜'},
	        vAxis: {title: '파손 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.ColumnChart(document.getElementById('breakage_upper_chart_div'));
		chart.draw(data, options);
	}
	
	// 역류 상위 데이터 그래프
	function drawUpperReverseRankChart() {

		<%textDate2 = temp;%>
		
		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Date', '<%=rd_data.getReverse_rank().get(0).get(0)%>','<%=rd_data.getReverse_rank().get(1).get(0)%>','<%=rd_data.getReverse_rank().get(2).get(0)%>','<%=rd_data.getReverse_rank().get(3).get(0)%>'],
         <% for(int i=0; i<rd_data.getUpper_reverse_data().get(0).size(); i++){ %>
         [ '<%=textDate2%>' ,<%=rd_data.getUpper_reverse_data().get(0).get(i)%>, <%=rd_data.getUpper_reverse_data().get(1).get(i)%>, <%=rd_data.getUpper_reverse_data().get(2).get(i)%>, <%=rd_data.getUpper_reverse_data().get(3).get(i)%>],
         <%// 시간 더하기
          Date sdate = DateFormat.parse(textDate2);
	   	  cal.setTime(sdate);
	   	  cal.add(Calendar.DATE, 1);
	      textDate2 = DateFormat.format(cal.getTime()); 
	      }%>
		 ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			hAxis: {title: '날짜'},
	        vAxis: {title: '역류 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.ColumnChart(document.getElementById('reverse_upper_chart_div'));
		chart.draw(data, options);
	}
	
	// 부재중 상위 데이터 그래프
	function drawUpperAbsenceRankChart() {
		
		<%textDate2 = temp;%>
		
		// Create the data table
		var data = google.visualization.arrayToDataTable([
         ['Date', '<%=rd_data.getAbsence_rank().get(0).get(0)%>','<%=rd_data.getAbsence_rank().get(1).get(0)%>','<%=rd_data.getAbsence_rank().get(2).get(0)%>','<%=rd_data.getAbsence_rank().get(3).get(0)%>'],
         <% for(int i=0; i<rd_data.getUpper_absence_data().get(0).size(); i++){ %>
         [ '<%=textDate2%>' ,<%=rd_data.getUpper_absence_data().get(0).get(i)%>, <%=rd_data.getUpper_absence_data().get(1).get(i)%>, <%=rd_data.getUpper_absence_data().get(2).get(i)%>, <%=rd_data.getUpper_absence_data().get(3).get(i)%>],
         <%// 시간 더하기
          Date sdate = DateFormat.parse(textDate2);
	   	  cal.setTime(sdate);
	   	  cal.add(Calendar.DATE, 1);
	      textDate2 = DateFormat.format(cal.getTime()); 
	      }%>
		 ]);
		
		// Set options for chart.
		var options = {
			colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
			hAxis: {title: '날짜'},
	        vAxis: {title: '부재중 횟수',
	        	minValue : 0,
				viewWindow : {
					min : 0
				}}
		};

		// Instantiate and draw the chart
		var chart = new google.visualization.ColumnChart(document.getElementById('absence_upper_chart_div'));
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<section class="hbox stretch">
		<!-- aside -->

		<aside class="bg-dark aside-md" id="nav">
			<section class="vbox">

				<!-- 모바일 로고,목록 -->
				<header class="dk nav-bar bg-dk-mobile visible-xs">
					<a class="btn btn-link visible-xs"
						data-toggle="class:nav-off-screen" data-target="#nav"> <i
						class="fa fa-bars"></i>
					</a> <a href="../map/map_main.jsp" class="nav-brand "><img
						src="../images/logo-moblie.png" alt="수도검침서비스" /></a>
				</header>
				<!-- //모바일 로고,목록-->

				<!-- 웹,타블렛 로고-->
				<header class="dk nav-bar bg-dk-mobile shift">
					<a href="../map/map_main.jsp" class="nav-brand "><img
						src="../images/logo.png" alt="수도검침서비스" /></a>
				</header>
				<!-- //웹,타블렛 -->

				<!-- 좌측 메뉴 -->
				<section class="scrollable">
					<div class="slim-scroll" data-height="auto"
						data-disabsle-fade-out="true" data-distance="0" data-size="5px">
						<nav class="nav-primary hidden-xs" data-ride="collapse">
							<ul class="nav">
								<li><a href="#" class="dropdown-toggle"> <span
										class="pull-right auto"> <i
											class="fa fa-angle-down text"></i> <i
											class="fa fa-angle-up text-active"></i>
									</span> <span>검침조회</span>
								</a>
									<ul class="nav none dker">
										<li><a href="../read/readDay.jsp">일별 검침조회</a></li>
										<li><a href="../read/readMonth.jsp">월별 검침조회</a></li>
									</ul></li>
								<li><a href="#" class="dropdown-toggle"> <span
										class="pull-right auto"> <i
											class="fa fa-angle-down text"></i> <i
											class="fa fa-angle-up text-active"></i>
									</span> <span>통계분석</span>
								</a>
									<ul class="nav none dker">
										<li><a href="../analysis/analysisDay.jsp">일별 통계</a></li>
										<li><a href="../analysis/analysisMonth.jsp">월별 통계</a></li>
										<li><a href="../analysis/analysisYear.jsp">년별 통계</a></li>
										<li><a href="../analysis/analysisLocal.jsp">지역별 통계 순위</a></li>
									</ul></li>
								<li><a href="#" class="dropdown-toggle"> <span
										class="pull-right auto"> <i
											class="fa fa-angle-down text"></i> <i
											class="fa fa-angle-up text-active"></i>
									</span> <span>리포트</span>
								</a>
									<ul class="nav none dker">
										<li><a href="../report/reportDay.jsp">일간 리포트</a></li>
										<li><a href="../report/reportMonth.jsp">월간 리포트</a></li>
									</ul></li>
								<li><a href="#"> <span class="pull-right auto">
											<i class="fa fa-angle-down text"></i> <i
											class="fa fa-angle-up text-active"></i>
									</span> <span>장애관리</span>
								</a>
									<ul class="nav none dker">
										<li><a href="#">검침기기 상태조회</a></li>
										<li><a href="#">검침값 상태조회</a></li>
										<li><a href="#">통신 상태조회</a></li>
									</ul></li>
								<li><a href="#"> <span class="pull-right auto">
											<i class="fa fa-angle-down text"></i> <i
											class="fa fa-angle-up text-active"></i>
									</span> <span>관리자</span>
								</a>
									<ul class="nav none dker">
										<li><a href="#">로그이력</a></li>
										<li><a href="#">시스템 관리</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</section>
				<!-- //좌측 메뉴 -->
			</section>
		</aside>
		<!-- /.aside -->


		<section id="content">
			<section class="hbox stretch">


				<aside>
					<!-- 상단영역 -->
					<section class="vbox">
						<header class="nav bg-gradient-1 b-b">
							<div class="nav notify-row">
								<!--  start -->
								<ul class="nav top-menu">
									<!-- 누수 start-->
									<li class="dropdown"><a class="dropdown-toggle">
											<img src="../images/water.png" data-toggle="tooltip"
											data-placement="bottom" title="누수"><span
											class="badge bg-danger">1</span>
									</a></li>
									<!-- 누수 end -->
									<!-- 동파 start-->
									<li class="dropdown"><a class="dropdown-toggle">
											<img src="../images/winter.png" data-toggle="tooltip"
											data-placement="bottom" title="동파">
									</a></li>
									<!-- 동파 end -->
									<!-- 비만 start-->
									<li class="dropdown"><a class="dropdown-toggle">
											<img src="../images/obesity.png" data-toggle="tooltip"
											data-placement="bottom" title="비만"><span
											class="badge bg-danger">1</span>
									</a></li>
									<!-- 비만 end -->
									<!-- 파손 start-->
									<li class="dropdown"><a class="dropdown-toggle">
											<img src="../images/damage.png" data-toggle="tooltip"
											data-placement="bottom" title="파손">
									</a></li>
									<!-- 파손 end -->
									<!-- 역류 start-->
									<li class="dropdown"><a class="dropdown-toggle">
											<img src="../images/backwash.png" data-toggle="tooltip"
											data-placement="bottom" title="역류"><span
											class="badge bg-danger">3</span>
									</a></li>
									<!-- 역류 end -->
									<!-- 비만 start-->
									<li class="dropdown"><a class="dropdown-toggle">
											<img src="../images/absence.png" data-toggle="tooltip"
											data-placement="bottom" title="부재중" >
									</a></li>
									<!-- 비만 end -->
								</ul>
								<!--  nd -->
							</div>
							<div class="pull-right m-r-lg m-t-xxs shift">
								<p class="m-t m-b text-primary">
									<i class="fa fa-clock-o"></i> Date: <strong><%=date%></strong>
								</p>
							</div>
						</header>

						<section class="scrollable m-t-xxs">
							<section class="panel b-b-n">
								<!-- 업무영역 start-->

								<!-- title 영역 -->
								<header class="m-b-lg">
									<div
										class="row m-l-none m-r-none m-r-none box-shadow bg-light b-b">
										<div class="col-sm-4">
											<h3 class="m-t m-b-none text-primary font-semibold">지역별
												통계 순위</h3>
											<p class="block text-muted">Water Meter Data Management
												System</p>
										</div>
									</div>
								</header>
								<!-- //title 영역 -->
								<!-- 상세화면-->
								<div class="row padder">
									<div class="col-md-12">
									
									<form action="analysisLocal_backup.jsp" method="post" id=search_form>
											<div class="well">
												<div class="row text-sm">
													<div class="col-sm-4">
														<div class="form-group m-b-none">
															<select name=si class="input-sm form-control input-s-sm inline">
																<option value="인천광역시">인천광역시</option>
															</select>
															<select name=guGun class="input-sm form-control input-s-sm inline">
																<option value="전체" <%if(guGun.equals("전체")) out.print("selected=\"selected\"");%>>전체</option>
																<option value="강화군" <%if(guGun.equals("강화군")) out.print("selected=\"selected\"");%>>강화군</option>
																<option value="계양구" <%if(guGun.equals("계양구")) out.print("selected=\"selected\"");%>>계양구</option>
																<option value="남구" <%if(guGun.equals("남구")) out.print("selected=\"selected\"");%>>남구</option>
																<option value="남동구" <%if(guGun.equals("남동구")) out.print("selected=\"selected\"");%>>남동구</option>
																<option value="동구" <%if(guGun.equals("동구")) out.print("selected=\"selected\"");%>>동구</option>
																<option value="부평구" <%if(guGun.equals("부평구")) out.print("selected=\"selected\"");%>>부평구</option>
															</select>
															
														</div>
													</div>
													<div class="col-sm-4 p-l-none">
														<div class="form-group m-b-none">
															<label class="col-lg-3 control-label">검색일</label>
															<div class="col-lg-7 form-inline">
																<input
																	class="input-sm input-s-sm datepicker-input form-control"
																	type="text" name="sdate" value="${param['sdate']}"
																	data-date-format="yyyy-mm-dd" id="sdate">~<input
																	class="input-sm input-s-sm datepicker-input form-control"
																	type="text" name="edate" value="${param['edate']}"
																	data-date-format="yyyy-mm-dd" id="edate">
															</div>
														</div>
													</div>
													
												</div>
												
												<!-- 검색 버튼-->

												<div class="row">
													<div class="col-sm-12 text-right">
														<button class="btn btn-sm btn-default" id="search">
															<i class="fa fa-search"></i> 검색
														</button>
													</div>
												</div>


												<!-- 검색버튼 -->
											</div>
										</form>
										<section class="panel">
											<header class="panel-heading text-primary font-semibold h5">
												<i class="fa fa-chevron-circle-right"></i> 누수
											</header>
											<div class="row m-t m-b wrapper">
												<div class="col-lg-3">
													<section class="panel">
														<header class="panel-heading">누수 지역별 순위</header>
														<div class="panel-body text-center" id="leak_rank_chart_div"></div>
													</section>
												</div>

												<div class="col-lg-9">
													<section class="panel">
														<header class="panel-heading">누수 평균값 비교</header>
														<div class="panel-body text-center" id="leak_upper_chart_div"></div>
													</section>
												</div>

											</div>

										</section>
									</div>
									<div class="col-md-12">
										<section class="panel">
											<header class="panel-heading text-primary font-semibold h5">
												<i class="fa fa-chevron-circle-right"></i> 동파
											</header>
											<div class="row m-t m-b wrapper">
												<div class="col-lg-3">
													<section class="panel">
														<header class="panel-heading">동파 지역별 순위</header>
														<div class="panel-body text-center" id="freezed_rank_chart_div"></div>
													</section>
												</div>

												<div class="col-lg-9">
													<section class="panel">
														<header class="panel-heading">동파 평균값 비교</header>
														<div class="panel-body text-center" id="freezed_upper_chart_div"></div>
													</section>
												</div>

											</div>

										</section>
									</div>

									<div class="col-md-12">
										<section class="panel">
											<header class="panel-heading text-primary font-semibold h5">
												<i class="fa fa-chevron-circle-right"></i> 비만관
											</header>
											<div class="row m-t m-b wrapper">
												<div class="col-lg-3">
													<section class="panel">
														<header class="panel-heading">비만관 지역별 순위</header>
														<div class="panel-body text-center" id="fat_rank_chart_div"></div>
													</section>
												</div>

												<div class="col-lg-9">
													<section class="panel">
														<header class="panel-heading">비만관 평균값 비교</header>
														<div class="panel-body text-center" id="fat_upper_chart_div"></div>
													</section>
												</div>

											</div>

										</section>
									</div>
									<div class="col-md-12">
										<section class="panel">
											<header class="panel-heading text-primary font-semibold h5">
												<i class="fa fa-chevron-circle-right"></i> 파손
											</header>
											<div class="row m-t m-b wrapper">
												<div class="col-lg-3">
													<section class="panel">
														<header class="panel-heading">파손 지역별 순위</header>
														<div class="panel-body text-center" id="breakage_rank_chart_div"></div>
													</section>
												</div>

												<div class="col-lg-9">
													<section class="panel">
														<header class="panel-heading">파손 평균값 비교</header>
														<div class="panel-body text-center" id="breakage_upper_chart_div"></div>
													</section>
												</div>

											</div>

										</section>
									</div>
									<div class="col-md-12">
										<section class="panel">
											<header class="panel-heading text-primary font-semibold h5">
												<i class="fa fa-chevron-circle-right"></i> 역류
											</header>
											<div class="row m-t m-b wrapper">
												<div class="col-lg-3">
													<section class="panel">
														<header class="panel-heading">역류 지역별 순위</header>
														<div class="panel-body text-center" id="reverse_rank_chart_div"></div>
													</section>
												</div>

												<div class="col-lg-9">
													<section class="panel">
														<header class="panel-heading">역류 평균값 비교</header>
														<div class="panel-body text-center" id="reverse_upper_chart_div"></div>
													</section>
												</div>

											</div>

										</section>
									</div>
									<div class="col-md-12">
										<section class="panel">
											<header class="panel-heading text-primary font-semibold h5">
												<i class="fa fa-chevron-circle-right"></i> 부재중
											</header>
											<div class="row m-t m-b wrapper">
												<div class="col-lg-3">
													<section class="panel">
														<header class="panel-heading">부재중 지역별 순위</header>
														<div class="panel-body text-center" id="absence_rank_chart_div"></div>
													</section>
												</div>

												<div class="col-lg-9">
													<section class="panel">
														<header class="panel-heading">부재중 평균값 비교</header>
														<div class="panel-body text-center" id="absence_upper_chart_div"></div>
													</section>
												</div>
											</div>
										</section>
									</div>
								</div>
							</section>
							<!-- 업무영역 end-->


						</section>
				</aside>
				<!-- /.aside -->

				<!-- Quick menu -->
				<aside class="aside-xs b-l bg-dark">

					<section class="m-t-l">
						<ul class="nav nav-pills">
							<li><a href="#"><i class="fa fa-list icon-lg"
									data-toggle="tooltip" data-placement="top" title="범례"></i></a></li>
							<li><a href="#"><i class="fa fa-save icon-lg"
									data-toggle="tooltip" data-placement="top" title="저장"></i></a></li>
							<li><a href="#"><i class="fa fa-print icon-lg"
									data-toggle="tooltip" data-placement="top" title="인쇄"></i></a></li>
						</ul>
					</section>

				</aside>
				<!-- //Quick menu -->


			</section>
		</section>
</body>
</html>