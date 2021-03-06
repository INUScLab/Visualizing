

<%@page import="visualizing.Mapreport.SummaryReport"%>
<%@page import="visualizing.Mapreport.DongInfo"%>
<%@ page language="java" import="visualizing.Mapreport.*, java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJHzLkYApb-mrj0mz7d8zakkvBuE0IZTE&signed_in=true&libraries=places"></script>

<script type="text/javascript"
	src='https://www.google.com/jsapi?autoload={
	"modules":[{
		"name":"visualization",
		"version":"1",
		"packages":["corechart","controls","table"]
		}]
	}'>
</script>

<meta charset="utf-8" />
<title>::: 수도검침서비스 :::</title>
<meta name="description" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="/Visualizing/css/bootstrap.css"
	type="text/css" />
<link rel="stylesheet" href="/Visualizing/css/font-awesome.min.css"
	type="text/css" />
<link rel="stylesheet" href="/Visualizing/css/font.css" type="text/css"
	cache="false" />
<link rel="stylesheet" href="/Visualizing/css/app.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="js/ie/respond.min.js" cache="false"></script>
    <script src="js/ie/html5.js" cache="false"></script>
    <script src="js/ie/fix.js" cache="false"></script>
  <![endif]-->
<script src="/Visualizing/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/Visualizing/js/bootstrap.js"></script>
<!-- App -->
<script src="/Visualizing/js/app.js"></script>
<script src="/Visualizing/js/app.plugin.js"></script>
<script src="/Visualizing/js/app.data.js"></script>

</head>
<body onload="initialize()">



		<jsp:useBean id="DongInfo" class="visualizing.Mapreport.DongInfo" />
		<jsp:useBean id="DongInfoCtrl"
			class="visualizing.Mapreport.DongInfoCtrl" />
		<jsp:useBean id="SummaryReport"
			class="visualizing.Mapreport.SummaryReport" />
		<jsp:useBean id="SummaryReportCtrl"
			class="visualizing.Mapreport.SummaryReportCtrl" />

		<%
			ArrayList<DongInfo> dongInfoList = DongInfoCtrl.getDongInfoList();
			ArrayList<SummaryReport> summaryReportList = SummaryReportCtrl.getSummaryReportList();
				
			
		%>
		<script type="text/javascript">
var dongInfoList = new Array();

<%for (int i = 0; i < dongInfoList.size(); i++) {%>
dongInfoList.push( {
  gu:"<%=dongInfoList.get(i).getGu()%>",
  dong:"<%=dongInfoList.get(i).getDong()%>",
  lat:"<%=dongInfoList.get(i).getLat()%>",
  lng:"<%=dongInfoList.get(i).getLng()%>",
  leak:"<%=dongInfoList.get(i).getCount_leak()%>",
  absence:"<%=dongInfoList.get(i).getCount_absence()%>",
  freezed:"<%=dongInfoList.get(i).getCount_freezed()%>",
  reverse:"<%=dongInfoList.get(i).getCount_reverse()%>",
  fat:"<%=dongInfoList.get(i).getCount_fat()%>",
  breakage:"<%=dongInfoList.get(i).getCount_breakage()%>",
});
<%}%>

var summaryReportList = new Array();
<%for (int i = 0; i < summaryReportList.size(); i++) {%>
summaryReportList.push( {
  gu:"<%=summaryReportList.get(i).getGuGun()%>",
  dong:"<%=summaryReportList.get(i).getUmDong()%>",
  detail:"<%=summaryReportList.get(i).getDetail()%>",
  lat:"<%=summaryReportList.get(i).getLat()%>",
  lng:"<%=summaryReportList.get(i).getLng()%>",
  consumed:"<%=summaryReportList.get(i).getConsumed()%>",
  predicted:"<%=summaryReportList.get(i).getPredicted()%>",

  leak:"<%=summaryReportList.get(i).getLeak()%>",
  absence:"<%=summaryReportList.get(i).getAbsence()%>",
  freezed:"<%=summaryReportList.get(i).getFreezed()%>",
  reverse:"<%=summaryReportList.get(i).getReverse()%>",
  fat:"<%=summaryReportList.get(i).getFat()%>",
  breakage:"<%=summaryReportList.get(i).getBreakage()%>",

  day1:"<%=summaryReportList.get(i).getDay1()%>",
  day2:"<%=summaryReportList.get(i).getDay2()%>",
  day3:"<%=summaryReportList.get(i).getDay3()%>",
  day4:"<%=summaryReportList.get(i).getDay4()%>",
  day5:"<%=summaryReportList.get(i).getDay5()%>",
  day6:"<%=summaryReportList.get(i).getDay6()%>",
  day7:"<%=summaryReportList.get(i).getDay7()%>",

  countLeak:"<%=summaryReportList.get(i).getCountLeak()%>",
  countAbsence:"<%=summaryReportList.get(i).getAbsence()%>",
  countFreezed:"<%=summaryReportList.get(i).getFreezed()%>",
  countReverse:"<%=summaryReportList.get(i).getCountReverse()%>",
  countFat:"<%=summaryReportList.get(i).getCountFat()%>",
  countBreakage:"<%=summaryReportList.get(i).getCountBreakage()%>",

});
		<%}%>
			
		</script>

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
											<li><a href="../analysis/analysisYear.jsp">연별 통계</a></li>
											
										</ul></li>
									<li><a href="#"> <span class="pull-right auto">
												<i class="fa fa-angle-down text"></i> <i
												class="fa fa-angle-up text-active"></i>
										</span>  <span>빅데이터 분석</span>
									</a>
										<ul class="nav none dker">
											<li><a href="../biganalysis/analysisLocal.jsp">지역별 부가서비스 분석</a></li>
											<li><a href="../biganalysis/analysisWateruse.jsp">지역별 사용량 분석</a></li>
											<li><a href="../biganalysis/Nonwateruse.jsp">장기 미사용자 정보</a></li>
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
										</span> <span>관리자</span>
									</a>
										<ul class="nav none dker">
											<li><a href="../log_administor/log.jsp">로그이력</a></li>
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
					<!-- 주소 검색 -->
					<aside class="aside-lg bg-white b-r-line" id="sidebar" style="display:none">
						<section class="vbox">
							<div
								class="navbar-form1 navbar-left no-padder-mobile bg-dk-mobile"
								role="search">

								<div class="form-group ">
									<div class="input-group">
										<input type="text" class="form-control font-thin no-radius"
											id="searchbox" placeholder="동을 입력해 주세요"
											onkeypress="if(event.keyCode==13) {codeAddress();}">
										<span class="input-group-btn" onclick="codeAddress()">
											<button class="btn btn-white no-radius"
												onclick="codeAddress()">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
							<!-- 도로명 주소,지번주소 tab 영역-->
							<header class="header bg-gradient-1 shift">
								<ul class="nav nav-tabs">
									<li class="active" style="width: 100%;"><a href="#road"
										data-toggle="tab">수용가 주소</a></li>

								</ul>
							</header>
							<!-- //도로명 주소,지번주소 tab 영역.. 검색결과 갯수를 for로 늘림?    -->

							<section class="scrollable m-t-lg shift">
								<div class="tab-content">
									<!-- 도로명 주소-->
									<div class="tab-pane active" id="road">
										<h5 class="bg-gradient-tit">
											검색결과 <span class="text-black font-semibold" id='searchResultCount'></span>
										</h5>

										<ul
											class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border" id ="ui-list-group" >

										</ul>


										<!-- 
										
										<h5 class="bg-gradient-tit b-b b-t">
											검색결과 <span class="text-black font-semibold">(000 건)</span>
										</h5>
										 -->
									</div>
									<!-- //도로명 주소 -->
									<!-- 지번주소 -->
									<div class="tab-pane" id="number">
										<div class="text-center wrapper">
											<i class="fa fa-spinner fa fa-spin fa fa-large"></i>
										</div>
									</div>
									<!-- //지번주소 -->

								</div>

							</section>

							

						</section>
						<!--vbox-->
					</aside>
					
					<a href="#" class="spmh spmh_aside_open" title="fold" onclick="hide()" style="left: 14.5em;" id="hidebutton" nclicks(mtw.lwfold)>본문 컨텐츠 접기</a>
					

					<!-- 상단영역 -->
					<section class="vbox">
						<header class="nav bg-gradient-1 b-b">
							<div class="nav notify-row">
								<!--  start -->
								<ul class="nav top-menu">
									<!--
                	<li class="shift"><a href="#subNav" data-toggle="class:hide" class="btn active"><i class="fa fa-chevron-right text fa fa-large font-size-m"></i><i class="fa fa-chevron-left text-active fa fa-large font-size-m"></i></a></li>
                  -->
									<!-- 누수 start-->
									<li class="dropdown" onclick="leak_clicked()"><a class="dropdown-toggle" href="#">
											<img src="../images/water.png" data-toggle="tooltip"
											data-placement="bottom" title="누수" id="img_leak" class="color"> <span
											class="badge bg-danger" id="overusedimage"></span>
									</a></li>
									<!-- 누수 end -->
									<!-- 동파 start-->
									<li class="dropdown" onclick="freezed_clicked()"><a class="dropdown-toggle" href="#">
											<img src="../images/winter.png" data-toggle="tooltip"
											data-placement="bottom" title="동파" id="img_freeze" class="color"> <span
											class="badge bg-danger" id="freezeimage"></span>
									</a></li>
									<!-- 동파 end -->
									<!-- 비만 start-->
									<li class="dropdown" onclick="fat_clicked()"><a class="dropdown-toggle" href="#">
											<img src="../images/obesity.png" data-toggle="tooltip"
											data-placement="bottom" title="비만" id="img_fat" class="color"> <span
											class="badge bg-danger" id="fatimage"></span>
									</a></li>
									<!-- 비만 end -->
									<!-- 파손 start-->
									<li class="dropdown" onclick="break_clicked()"><a class="dropdown-toggle" href="#">
											<img src="../images/damage.png" data-toggle="tooltip"
											data-placement="bottom" title="파손" id="img_break" class="color"> <span
											class="badge bg-danger" id="breakimage"></span>
									</a></li>
									<!-- 파손 end -->
									<!-- 역류 start-->
									<li class="dropdown" onclick="reverse_clicked()"><a class="dropdown-toggle" href="#">
											<img src="../images/backwash.png" data-toggle="tooltip"
											data-placement="bottom" title="역류" id="img_reverse" class="color"> <span
											class="badge bg-danger" id="reverseimage"></span>
									</a></li>
									<!-- 역류 end -->
									<!-- 부재중 start-->
									<li class="dropdown" onclick="absence_clicked()"><a class="dropdown-toggle" href="#">
											<img src="../images/absence.png" data-toggle="tooltip"
											data-placement="bottom" title="부재중" id="img_absence" class="color"> <span
											class="badge bg-danger" id="absenceimage"></span>
									</a></li>
									<!-- 부재중 end -->
								</ul>
								<!--  nd -->
							</div>

							<%
								java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
									String today = formatter.format(new java.util.Date());
							%>
							<div class="pull-right m-r-lg m-t-xxs shift">
								<p class="m-t m-b text-primary">
									<i class="fa fa-clock-o"></i> Date: <strong><%=today%></strong>
								</p>
							</div>
						</header>

						<!-- 지도영역-->
						<script type="text/javascript" src="../js/googlemap.js"></script>
						<section class="panel m-t-xxs" id="map_canvas">
							<div id="color-interpolation" class="color-interpolation"></div>

							<div class="panel-body"></div>
						</section>


						<!-- 
						<section>

							<div id="map_canvas" style="width: 100%; height: 95%;"></div>

							<script type="text/javascript" src="../js/googlemap.js"></script>


						</section>
						 -->
						<!-- //지도영역-->
						<div id="element_to_pop_up">
							<a class="b-close">x</a>
								<div class="modal-dialog" id="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title" id="modal-title"></h4>
										</div>

										<div class="modal-body">
											<div class="panel wrapper">

												<div class="row">
													<div class="col-xs-2 text-center">
														<a href="#"> <span class="m-b-xs h4 block"
															id="blockLeak"></span> <small class="text-muted h5">누수</small>
														</a>
													</div>
													<div class="col-xs-2 text-center">
														<a href="#"> <span class="m-b-xs h4 block"
															id="blockFreezed"></span> <small class="text-muted h5">동파</small>
														</a>
													</div>
													<div class="col-xs-2 text-center">
														<a href="#"> <span class="m-b-xs h4 block"
															id="blockFat"></span> <small class="text-muted h5">비만</small>
														</a>
													</div>
													<div class="col-xs-2 text-center">
														<a href="#"> <span class="m-b-xs h4 block"
															id="blockBreakage"></span> <small class="text-muted h5">파손</small>
														</a>
													</div>
													<div class="col-xs-2 text-center">
														<a href="#"> <span class="m-b-xs h4 block"
															id="blockReverse"></span> <small class="text-muted h5">역류</small>
														</a>
													</div>
													<div class="col-xs-2 text-center">
														<a href="#"> <span class="m-b-xs h4 block"
															id="blockAbsence"></span> <small class="text-muted h5">부재중</small>
														</a>
													</div>
												</div>
											</div>
											<div class="row m-t m-b">
												<div class="col-lg-4">
													<section class="panel">
														<header class="panel-heading">사용량비교</header>
														<div class="panel-body text-center" id="info_graph">
														</div>
													</section>
												</div>

												<div class="col-lg-4">
													<section class="panel">
														<header class="panel-heading">일주일 사용량 비교</header>
														<div class="panel-body text-center" id="info_history">
														</div>
													</section>
												</div>
<!-- 
												<div class="col-lg-4">
													<section class="panel">
														<header class="panel-heading">지난달 부가서비스 발생횟수</header>
														<div class="panel-body text-center" id="info_service">
														</div>
													</section>
												</div>
												 -->
											</div>
											
										</div>
									</div>
								</div>
						</div>
					</section>


					<!-- Quick menu -->
					<aside class="aside-xs b-l bg-dark">

					</aside>
					<!-- //Quick menu -->


				</section>

			</section>
			</section>




</body>
</html>
