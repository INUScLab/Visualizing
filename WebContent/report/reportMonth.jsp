<%@ page contentType="text/html; charset=UTF-8" %>
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
          <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen" data-target="#nav">
            <i class="fa fa-bars"></i>
          </a>
          <a href="../index.html" class="nav-brand "><img src="../images/logo-moblie.png" alt="수도검침서비스"/></a>
        </header>
        <!-- //모바일 로고,목록-->

     	<!-- 웹,타블렛 로고-->
        <header class="dk nav-bar bg-dk-mobile shift">
          <a href="../index.html" class="nav-brand "><img src="../images/logo.png" alt="수도검침서비스"/></a>
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
                          <a href="../analysis/day-analysis.html">일별 통계</a>              
                        </li>
                        <li>
                          <a href="../analysis/month-analysis.html">월별 통계</a>
                        </li>
                        <li>
                          <a href="../analysis/year-analysis.html">년별 통계</a>                    
                        </li>
                        <li>
                          <a href="../analysis/local-analysis.html">지역별 통계 순위</a>
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
                          <a href="day-report.html">일간 리포트</a>                    
                        </li>
                        <li>
                          <a href="week-report.html">주간 리포트</a>              
                        </li>
                        <li>
                          <a href="month-report.html">월간 리포트</a>
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
                <h3 class="m-t m-b-none text-primary font-semibold">일일 리포트</h3>
                <p class="block text-muted">Water Meter Data Management System </p>
              </div>
             </div>
           	</header>
            <!-- //title 영역 -->
            <!-- 상세화면-->
            <div class="row padder">
							<div class="col-md-12">
                
                   <!-- 검색조건 -->
                    <div class="well">
                     <div class="row text-sm">
                    
                      <div class="col-sm-4">
                      <div class="form-group m-b-none">
                        <select class="input-sm form-control input-s-sm inline">
                          <option value="0">인천광역시</option>
                        </select>   
                        <select class="input-sm form-control input-s-sm inline">
                          <option value="0">구,군</option>
                          <option value="1">남동구</option>
                          <option value="2">북구</option>
                        </select> 
                        <select class="input-sm form-control input-s-sm inline">
                          <option value="0">읍,면,동</option>
                        </select>
                        </div>        
                      </div>  
                      <div class="col-sm-4">
                       <div class="form-group m-b-none">
                        <select class="input-sm form-control input-s-sm inline">
                          <option value="0">2015년</option>
                        </select> 
                        <select class="input-sm form-control input-s-sm inline">
                          <option value="0">01월</option>
                        </select>
                        </div>
                      </div>                        
                      <div class="col-sm-4 p-l-none">

                        <div class="form-group m-b-none">
                          <label class="col-lg-3 control-label">수용가번호</label>
                          <div class="col-lg-7">
                            <input type="text" class="form-control">
                          </div>
                        </div>

                       </div>
										 </div>
                     <div class="row text-sm">
                    
                      <div class="col-sm-4 p-l-none">
                        <div class="form-group">
                          <label class="col-lg-3 control-label">수용가명</label>
                          <div class="col-lg-7">
                            <input type="text" class="form-control">
                          </div>
                        </div>       
                      </div>  
                      <div class="col-sm-4 p-l-none">
                        <div class="form-group">
                          <label class="col-lg-3 control-label">지시부번호</label>
                          <div class="col-lg-7">
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>                        
                      <div class="col-sm-4 p-l-none">

                        <div class="form-group">
                          <label class="col-lg-3 control-label">미터번호</label>
                          <div class="col-lg-7">
                            <input type="text" class="form-control">
                          </div>
                        </div>

                       </div>
											</div>
                       <!-- 검색 버튼-->
                      <div class="row ">

                        <div class="col-sm-12 text-right">
                          <button class="btn btn-sm btn-default"><i class="fa fa-search"></i> 검색</button>
                        </div>
											</div>
                      <!-- 검색버튼 -->
                    </div>
                    <!-- //검색조건 -->  
                                 
                  <section class="panel">
                    <div class="table-responsive">
                   	  <header class="panel-heading text-primary font-semibold h5"><i class="fa fa-chevron-circle-right"></i> 2016년 3월 (중간 타이틀 샘플)</header>
                   	  <table class="table table-striped b-t-blue" style="width:2500px;">
                        <thead>
                          <tr>
                            <th width="5">번호</th>
                            <th width="70">수용가명</th>
                            <th width="70">지시부번호</th>
                            <th width="60">미터번호</th>
                            <th width="60">미터타입</th>
                            <th width="50">사용량</th>
                            <th width="10">01월</th>
                            <th width="10">02월</th>
                            <th width="10">03월</th>
                            <th width="10">04월</th>
                            <th width="10">05월</th>
                            <th width="10">06월</th>
                            <th width="10">07월</th>
                            <th width="10">08월</th>
                            <th width="10">09월</th>
                            <th width="10">10월</th>
                            <th width="10">11월</th>
                            <th width="10">12월</th>
                            </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            <td>10</td>
                            </tr>
                          <tr>
                              <td>9</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>8</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>7</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>6</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>5</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>4</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>3</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>2</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                          <tr>
                              <td>1</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              <td>&nbsp;</td>
                              </tr>
                        </tbody>
                      </table> 
                    </div>
                    <footer class="panel-footer">
                      <div class="row">
                        <div class="col-sm-3 hidden-xs">
                          <button class="btn btn-sm btn-primary">목록</button>                  
                        </div>
                        <div class="col-sm-6 text-center text-center">                
                          <ul class="pagination pagination-sm m-t-none m-b-none">
                            <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                          </ul>
                        </div>
                        <div class="col-sm-3 text-right hidden-xs">
                          <button class="btn btn-sm btn-primary">글쓰기</button>
                        </div>
                        
                      </div>
                    </footer>
                  </section>
              
              
                </div>
               </div>
                   <!-- 검색조건 --><!-- //검색조건 -->
              
              
              </section>
          </section>

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