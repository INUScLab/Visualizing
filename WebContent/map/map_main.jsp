<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%-- 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="Visualizing/css/rootCSS.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/header.css">
 --%>
 
 <head>
  <meta charset="utf-8" />
  <title>::: 수도검침서비스 :::</title>
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="/Visualizing/css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="/Visualizing/css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="/Visualizing/css/font.css" type="text/css" cache="false" />
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
<body>
<c:if test="${empty sessionScope.id }">
로그인 하시유
</c:if>

<c:if test="${!empty sessionScope.id }">

<div>

  <section class="hbox stretch">
    <!-- aside -->

    <aside class="bg-dark aside-md" id="nav">
      <section class="vbox">
      
     	<!-- 모바일 로고,목록 -->
        <header class="dk nav-bar bg-dk-mobile visible-xs">
          <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav">
            <i class="fa fa-bars"></i>
          </a>
          <a href="index.html" class="nav-brand "><img src="/Visualizing/images/logo-moblie.png" alt="수도검침서비스"/></a>
        </header>
        <!-- //모바일 로고,목록-->

     	<!-- 웹,타블렛 로고-->
        <header class="dk nav-bar bg-dk-mobile shift">
          <a href="index.html" class="nav-brand "><img src="/Visualizing/images/logo.png" alt="수도검침서비스"/></a>
        </header>
        <!-- //웹,타블렛 -->
        		
        <!-- 좌측 메뉴 -->
        <section class="scrollable">
        	<div class="slim-scroll" data-height="auto" data-disabsle-fade-out="true" data-distance="0" data-size="5px">
             	<nav class="nav-primary hidden-xs" data-ride="collapse">
                  <ul class="nav">
                    <li>
                      <a href="#" class="dropdown-toggle">
                        <span class="pull-right auto">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>검침조회</span>
                      </a>
                      <ul class="nav none dker">                
                        <li>
                          <a href="#">시간별 검침조회</a>
                        </li>
                        <li>
                          <a href="#">일별 검침조회</a>
                        </li>
                        <li>
                          <a href="#">월별 검침조회</a>
                        </li>
                      </ul>
                    </li>
                    <li>
                      <a href="#" class="dropdown-toggle">
                        <span class="pull-right auto">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>통계분석</span>
                      </a>
                      <ul class="nav none dker">                
                        <li>
                          <a href="/Visualizing/analysis/SearchDay.do">일별 통계</a>              
                        </li>
                        <li>
                          <a href="/Visualizing/analysis/SearchMonth.do">월별 통계</a>
                        </li>
                        <li>
                          <a href="/Visualizing/analysis/SearchYear.do">년별 통계</a>                    
                        </li>
                        <li>
                          <a href="analysis/local-analysis.html">지역별 통계 순위</a>
                        </li>
                      </ul>
                    </li>
                    <li>
                      <a href="#" class="dropdown-toggle">
                        <span class="pull-right auto">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>리포트</span>
                      </a>
                      <ul class="nav none dker">                
                        <li>
                          <a href="/Visualizing/report/SearchDay.do">일간 리포트</a>                    
                        </li>
                        <li>
                          <a href="/Visualizing/report/SearchWeek.do">주간 리포트</a>              
                        </li>
                        <li>
                          <a href="/Visualizing/report/SearchMonth.do">월간 리포트</a>
                        </li>
                      </ul>
                    </li>
                    <li>
                      <a href="#">
                        <span class="pull-right auto">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>장애관리</span>
                         </a>
                        <ul class="nav none dker">                
                           <li>
                              <a href="#">검침기기 상태조회</a>                    
                           </li>
                           <li>
                              <a href="#">검침값 상태조회</a>              
                           </li>
                           <li>
                              <a href="#">통신 상태조회</a>
                           </li>
                        </ul>
                    </li>
                    <li>
                      <a href="#">
                        <span class="pull-right auto">
                          <i class="fa fa-angle-down text"></i>
                          <i class="fa fa-angle-up text-active"></i>
                        </span>
                        <span>관리자</span>
                        </a>
                        <ul class="nav none dker">                
                           <li>
                              <a href="#">로그이력</a>                    
                           </li>
                           <li>
                              <a href="#">시스템 관리</a>              
                           </li>
                        </ul>

                    </li>
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
                           <img src="/Visualizing/images/water.png" data-toggle="tooltip" data-placement="bottom" title="누수"><span class="badge bg-danger">6</span>
                        </a>
                    </li>
                    <!-- 누수 end -->
                    <!-- 동파 start-->
                    <li class="dropdown">
                        <a class="dropdown-toggle" href="#">
                            <img src="/Visualizing/images/winter.png" data-toggle="tooltip" data-placement="bottom" title="동파">
                        </a>
                    </li>
                    <!-- 동파 end -->
                    <!-- 비만 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="/Visualizing/images/obesity.png" data-toggle="tooltip" data-placement="bottom" title="비만"><span class="badge bg-warning">7</span>
                        </a>

                    </li>
                    <!-- 비만 end -->
                    <!-- 파손 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="/Visualizing/images/damage.png" data-toggle="tooltip" data-placement="bottom" title="파손">
                        </a>

                    </li>
                    <!-- 파손 end -->
                    <!-- 역류 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="/Visualizing/images/backwash.png" data-toggle="tooltip" data-placement="bottom" title="역류">
                        </a>

                    </li>
                    <!-- 역류 end -->
                     <!-- 비만 start-->
                    <li  class="dropdown">
                        <a class="dropdown-toggle" href="#">
							<img src="/Visualizing/images/absence.png" data-toggle="tooltip" data-placement="bottom" title="부재중">
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

					<!-- 지도영역--> 
          <section class="panel m-t-xxs" style="background-image: url(/Visualizing/images/map-sample.jpg);height:900px;" >
          		<div class="dot">
                <div class="centraldot"></div>
                <div class="wave"></div>
                <div class="wave2"></div>
              </div>
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



</div>

</c:if>
</body>
</html>