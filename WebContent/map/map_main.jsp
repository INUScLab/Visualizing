<%@page import="visualizing.Mapreport.SummaryReport"%>
<%@page import="visualizing.Mapreport.DongInfo"%>
<%@ page language="java" import="visualizing.Mapreport.*, java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>

  <script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDJHzLkYApb-mrj0mz7d8zakkvBuE0IZTE"></script>

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
  <script src="/Visualizing/js/pushy.min.js"></script>

</head>
<body onload="initialize(0, 0)">

  <c:if test="${empty sessionScope.id }">
<script type="text/javascript">
	alert("로그인 하세요!");
	location.href="/Visualizing/mg/LoginForm.do";
</script>
</c:if>

<c:if test="${!empty sessionScope.id }">


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

  latelyLeak:"<%=summaryReportList.get(i).getLatelyLeak()%>",
  latelyAbsence:"<%=summaryReportList.get(i).getLatelyAbsence()%>",
  latelyFreezed:"<%=summaryReportList.get(i).getLatelyFreezed()%>",
  latelyReverse:"<%=summaryReportList.get(i).getLatelyReverse()%>",
  latelyFat:"<%=summaryReportList.get(i).getLatelyFat()%>",
  latelyBreakage:"<%=summaryReportList.get(i).getLatelyBreakage()%>",

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
          <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav">
            <i class="fa fa-bars"></i>
          </a>
          <a href="../map/map_main.jsp" class="nav-brand "><img src="../images/logo-moblie.png" alt="수도검침서비스"/></a>
        </header>
        <!-- //모바일 로고,목록-->

     	<!-- 웹,타블렛 로고-->
        <header class="dk nav-bar bg-dk-mobile shift">
          <a href="../map/map_main.jsp" class="nav-brand "><img src="../images/logo.png" alt="수도검침서비스"/></a>
        </header>
        <!-- //웹,타블렛 -->

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
										<li><a href="../analysis/analysisLocal.jsp">지역별 통계
												순위</a></li>
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
		<!-- 주소 검색 -->
      <aside class="aside-lg bg-white b-r-line">
       		<section class="vbox">
                  <form class="navbar-form1 navbar-left no-padder-mobile bg-dk-mobile" role="search">
                  <div class="form-group ">
                    <div class="input-group">
                      <input type="text" class="form-control font-thin no-radius" placeholder="동을 입력해 주세요">
                      <span class="input-group-btn">
                        <button type="submit" class="btn btn-white no-radius"><i class="fa fa-search"></i></button>
                      </span>
                    </div>
                  </div>
                </form>
            <!-- 도로명 주소,지번주소 tab 영역-->
             <header class="header bg-gradient-1 shift">
                <ul class="nav nav-tabs" >
                    <li class="active" style="width:50%;"><a href="#road" data-toggle="tab">도로명 주소</a></li>
                    <li class="" style="width:50%;"><a href="#number" data-toggle="tab">지번주소</a></li>
                </ul>
            </header>
           	<!-- //도로명 주소,지번주소 tab 영역-->

            <section class="scrollable m-t-lg shift">
                  <div class="tab-content">
                  	<!-- 도로명 주소-->
                    <div class="tab-pane active" id="road">
                      <h5 class="bg-gradient-tit">
                          검색결과 <span class="text-black font-semibold">(000 건)</span>
                      </h5>
                      <ul class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                         <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                        <li class="list-group-item">
                          <a href="#" class="clear">
                            <strong class="block">(사단)김시식유적보존회</strong>
                            <small>061-793-4959<br/></small>
                            <small>김시식지 1길 57-6</small>
                          </a>
                        </li>
                      </ul>
                       <h5 class="bg-gradient-tit b-b b-t">
                          검색결과 <span class="text-black font-semibold">(000 건)</span>
                      </h5>
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

            <a href="#" class="spmh spmh_aside_close nclicks(mtw.lwfold)" title="접기">본문 컨텐츠 접기</a>

          </section><!--vbox-->
        </aside>

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
                    <li class="dropdown">
                        <a class="dropdown-toggle" href="#" >
                           <img src="../images/water.png" data-toggle="tooltip" data-placement="bottom" title="누수"><span class="badge bg-danger">6</span>
                        </a>
                    </li>
                    <!-- 누수 end -->
                    <!-- 동파 start-->
                    <li class="dropdown">
                        <a class="dropdown-toggle" href="#">
                            <img src="../images/winter.png" data-toggle="tooltip" data-placement="bottom" title="동파">
                        </a>
                    </li>
                    <!-- 동파 end -->
                    <!-- 비만 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="../images/obesity.png" data-toggle="tooltip" data-placement="bottom" title="비만"><span class="badge bg-warning">7</span>
                        </a>

                    </li>
                    <!-- 비만 end -->
                    <!-- 파손 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="../images/damage.png" data-toggle="tooltip" data-placement="bottom" title="파손">
                        </a>

                    </li>
                    <!-- 파손 end -->
                    <!-- 역류 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="../images/backwash.png" data-toggle="tooltip" data-placement="bottom" title="역류">
                        </a>

                    </li>
                    <!-- 역류 end -->
                     <!-- 비만 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="../images/absence.png" data-toggle="tooltip" data-placement="bottom" title="부재중">
                        </a>

                    </li>
                    <!-- 비만 end -->
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
          <section>

            <div id="map_canvas" style="width: 100%; height: 95%;"></div>
            							<div id="color-interpolation" class="color-interpolation"></div>

            							<script type="text/javascript" src="../js/googlemap.js"></script>


          </section>
          <!-- //지도영역-->
        </section>


          <!-- Quick menu -->
          <aside class="aside-xs b-l bg-dark">

              <section class="m-t-l">
                  <ul class="nav nav-pills">
                    <li><a href="#"><i class="fa fa-list icon-lg" data-toggle="tooltip" data-placement="top" title="범례"></i></a></li>
                    <li><a href="#"><i class="fa fa-save icon-lg" data-toggle="tooltip" data-placement="top" title="저장"></i></a></li>
                    <li><a href="#"><i class="fa fa-print icon-lg" data-toggle="tooltip" data-placement="top" title="인쇄"></i></a></li>
                  </ul>
              </section>

          </aside>
          <!-- //Quick menu -->


     </section>
</section>
</c:if>

<!-- 팝업창 default = 숨김 -->
<div class="modal-dialog" id="modal-dialog" style="width:850px; height:350px;">
	<div class="modal-content" id="modal-content" style="width:850px; height:350px">
		<div class="modal-header">

			<h4 class="modal-title">인천광역시 남구 숭의 1~3동</h4>
		</div>

		<div class="modal-body">
			<div class="panel wrapper">

				<div class="row">
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">50<small
								class="text-muted">건</small></span> <small class="text-muted h5">누수</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">55<small
								class="text-muted">건</small></span> <small class="text-muted h5">동파</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">비만</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">파손</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">역류</small>
						</a>
					</div>
					<div class="col-xs-2 text-center">
						<a href="#"> <span class="m-b-xs h4 block">0<small
								class="text-muted">건</small></span> <small class="text-muted h5">부재중</small>
						</a>
					</div>
				</div>
			</div>

			<div class="row m-t m-b">
				<div class="col-lg-4">
					<section class="panel">
						<header class="panel-heading">사용량비교</header>
						<div class="panel-body text-center">
							<img src="../images/chart-1.jpg">
						</div>
					</section>
				</div>

				<div class="col-lg-4">
					<section class="panel">
						<header class="panel-heading">일주일 사용량 비교</header>
						<div class="panel-body text-center">
							<img src="../images/chart-2.jpg">
						</div>
					</section>
				</div>

				<div class="col-lg-4">
					<section class="panel">
						<header class="panel-heading">3월달 부가서비스 발생횟수</header>
						<div class="panel-body text-center">
							<img src="../images/chart-3.jpg">
						</div>
					</section>
				</div>

			</div>


		</div>
	</div>

</div>
<!-- /.modal-content -->


<script type="text/javascript">
$("#modal-dialog").hide();
</script>

</body>
</html>
