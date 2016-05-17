<%@ page import="visualizing.analysis.AnalysisDataCtrl"%>
<%@ page import="visualizing.analysis.AnalysisData"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="kr">
<head>
  <meta charset="utf-8" />
  <title>::: 수도검침서비스 :::</title>
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="../css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="../css/font.css" type="text/css" cache="false" />
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
										<li><a href="reportDay.jsp">일간 리포트</a></li>
										<li><a href="reportMonth.jsp">월간 리포트</a></li>
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
            <div class="pull-right m-r-lg m-t-xxs shift">
            	<p class="m-t m-b text-primary"><i class="fa fa-clock-o"></i> Date: <strong>2016-04-28</strong></p>
            </div>
          </header>

          <section class="scrollable m-t-xxs">
            <section class="panel b-b-n">
 											<!-- 업무영역 start--> 

        		<!-- title 영역 -->
         		<header class="m-b-lg">
            <div class="row m-l-none m-r-none m-r-none box-shadow bg-light b-b">
              <div class="col-sm-4">
                <h3 class="m-t m-b-none text-primary font-semibold">지역별 통계 순위</h3>
                <p class="block text-muted">Water Meter Data Management System </p>
              </div>
             </div>
           	</header>
            <!-- //title 영역 -->
           <!-- 상세화면-->
            <div class="row padder">
								<div class="col-md-12">          
                  <section class="panel">
 										<header class="panel-heading text-primary font-semibold h5"><i class="fa fa-chevron-circle-right"></i> 누수</header>                 
                   <div class="row m-t m-b wrapper">
                          <div class="col-lg-3">
                            <section class="panel">
                              <header class="panel-heading">누수 지역별 순위</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-1.jpg" class="img-responsive">
                              </div>
                            </section>
                        </div>
      
                          <div class="col-lg-9">
                            <section class="panel">
                              <header class="panel-heading">누수 평균값 비교</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-4.jpg" class="img-responsive">
                              </div>
                            </section>
                        </div>      
          
                   </div>

                 </section>
                </div>
								<div class="col-md-12">          
                  <section class="panel">
 										<header class="panel-heading text-primary font-semibold h5"><i class="fa fa-chevron-circle-right"></i> 동파</header>                 
                   <div class="row m-t m-b wrapper">
                          <div class="col-lg-3">
                            <section class="panel">
                              <header class="panel-heading">동파 지역별 순위</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-1.jpg" class="img-responsive">
                              </div>
                            </section>
                        </div>
      
                          <div class="col-lg-9">
                            <section class="panel">
                              <header class="panel-heading">동파 평균값 비교</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-4.jpg" class="img-responsive">
                              </div>
                            </section>
                        </div>      
          
                   </div>

                 </section>
                </div>
                
 								<div class="col-md-12">          
                  <section class="panel">
 										<header class="panel-heading text-primary font-semibold h5"><i class="fa fa-chevron-circle-right"></i> 부재중</header>                 
                   <div class="row m-t m-b wrapper">
                          <div class="col-lg-3">
                            <section class="panel">
                              <header class="panel-heading">부재중 지역별 순위</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-1.jpg" class="img-responsive">
                              </div>
                            </section>
                        </div>
      
                          <div class="col-lg-9">
                            <section class="panel">
                              <header class="panel-heading">부재중 평균값 비교</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-4.jpg" class="img-responsive">
                              </div>
                            </section>
                        </div>      
          
                   </div>

                 </section>
                </div>
                
								<div class="col-md-12">          
                  <section class="panel">
 										<header class="panel-heading text-primary font-semibold h5"><i class="fa fa-chevron-circle-right"></i> 사용량 예측</header>                 
                   <div class="row m-t m-b wrapper">
                          <div class="col-lg-3">
                            <section class="panel">
                              <header class="panel-heading">사용량 예측 지역별 순위</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-1.jpg" class="img-responsive">
                              </div>
                            </section>
                        </div>
      
                          <div class="col-lg-9">
                            <section class="panel">
                              <header class="panel-heading">사용량 예측 평균값 비교</header>
                              <div class="panel-body text-center">
                                <img src="../images/chart-4.jpg" class="img-responsive">
                              </div>
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
                    <li><a href="#"><i class="fa fa-list icon-lg" data-toggle="tooltip" data-placement="top" title="범례"></i></a></li>
                    <li><a href="#"><i class="fa fa-save icon-lg" data-toggle="tooltip" data-placement="top" title="저장"></i></a></li>
                    <li><a href="#"><i class="fa fa-print icon-lg" data-toggle="tooltip" data-placement="top" title="인쇄"></i></a></li>
                  </ul>
              </section>

          </aside>
          <!-- //Quick menu -->


     </section>
</section>
 

</body>
</html>