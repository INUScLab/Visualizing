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
	String[] color = {"#ead0d0", "#f9f5b6", "#1871CD", "#33B1EB", "#7DCDF2", "#FF4943", "#e2b5f4", "#a1d3e2",
			"#ffcc7f", "#e894a8"};
%>



<jsp:useBean id="rdctrl" class="visualizing.analysis.RankDataCtrl" />

<%
	

	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String umdong = request.getParameter("umDong");

	if (si == null || si.equals(""))
		si = "인천광역시";
	if (guGun == null || guGun.equals(""))
		guGun = "강화군";
	if (umdong == null || umdong.equals("") || umdong.equals("전체"))
		umdong = "%";

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

	String startDay = request.getParameter("sdate");
	String endDay = request.getParameter("edate");
	String order = request.getParameter("order");
	if (order == null || order.equals(""))
		order = " avg(consumed)";
	
	
	System.out.println(order+"이다");
	if (startDay == null || startDay == "")
		startDay = edate;

	if (endDay == null || endDay == "")
		endDay = date;

	Date temp2 = mSimpleDateFormat.parse(startDay);
	String temp3 = DateFormat.format(temp2);
	
	Date firstDate = mSimpleDateFormat.parse(startDay);
	Date secondDate = mSimpleDateFormat.parse(endDay);
	
	long calDate = firstDate.getTime() - secondDate.getTime();
	
	long calDateDays = calDate / (24*60*60*1000);
	calDateDays = Math.abs(calDateDays);
	
	

	RankData rd_data = rdctrl.returnDatas(si, guGun, umdong, startDay, endDay, order);
	//for(int i=0;i<10;i++){
	//System.out.println(rd_data.getLessconsumed_code(order).get(1));
	//}
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Load Charts and the corechart package.
	google.charts.load('current', {'packages' : [ 'corechart' ]});



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

									</ul></li>
								<li><a href="#"> <span class="pull-right auto">
											<i class="fa fa-angle-down text"></i> <i
											class="fa fa-angle-up text-active"></i>
									</span> <span>빅데이터 분석</span>
								</a>
									<ul class="nav none dker">
										<li><a href="../biganalysis/analysisLocal.jsp">지역별
												부가서비스 분석</a></li>
										<li><a href="../biganalysis/analysisWateruse.jsp">지역별
												사용량 분석</a></li>
										<li><a href="../biganalysis/Nonwateruse.jsp">장기 미사용자
												정보</a></li>
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


				<aside>
					<!-- 상단영역 -->
					<section class="vbox">
						<header class="nav bg-gradient-1 b-b">
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
											<h3 class="m-t m-b-none text-primary font-semibold">장기 미사용자 정보</h3>
											<p class="block text-muted">Water Meter Data Management
												System</p>
										</div>
									</div>
								</header>
								<!-- //title 영역 -->
								<!-- 상세화면-->
								<div class="row padder">
									<div class="col-md-12">
										<form action="Nonwateruse.jsp" method="post" id=search_form>

											<div class="well">
												<div class="row text-sm">
													<div class="col-sm-4">
														<div class="form-group m-b-none">
															<select name=si
																class="input-sm form-control input-s-sm inline">
																<option value="인천광역시">인천광역시</option>
															</select> <select name=guGun
																class="input-sm form-control input-s-sm inline">
																<option value="전체" <%if (guGun.equals("전체"))
				out.print("selected=\"selected\"");%>>전체</option>
																<option value="강화군"
																	<%if (guGun.equals("강화군"))
				out.print("selected=\"selected\"");%>>강화군</option>
																<option value="계양구"
																	<%if (guGun.equals("계양구"))
				out.print("selected=\"selected\"");%>>계양구</option>
																<option value="남구"
																	<%if (guGun.equals("남구"))
				out.print("selected=\"selected\"");%>>남구</option>
																<option value="남동구"
																	<%if (guGun.equals("남동구"))
				out.print("selected=\"selected\"");%>>남동구</option>
																<option value="동구"
																	<%if (guGun.equals("동구"))
				out.print("selected=\"selected\"");%>>동구</option>
																<option value="부평구"
																	<%if (guGun.equals("부평구"))
				out.print("selected=\"selected\"");%>>부평구</option>
															</select> <select ww=umDong
																class="input-sm form-control input-s-sm inline">
																<option value="전체">전체</option>
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
													
													<div class="col-sm-4 p-l-none">
														<div class="form-group m-b-none">
															<label class="col-lg-3 control-label">정렬 기준</label>
															
																<select name = "order">
																	<option value=" avg(consumed)" <%if (order.equals(" avg(consumed)"))
				out.print("selected=\"selected\"");%>>평균값</option>
																	<option value=" losscount desc" <%if (order.equals(" losscount desc"))
				out.print("selected=\"selected\"");%>>미사용기간</option>
																</select>
															

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

									</div>
									<div class="col-md-12"></div>
								</div>
							</section>
							<!-- 업무영역 end-->

							<section class="panel">
								<div class="table-responsive">

									<table class="table table-striped b-t-blue">
										<thead>
											<tr>
												<th width="80">수용가 명</th>
												<%for(int i=0;i<=calDateDays;i++){
												%>
												<th width="80"><%=rd_data.getLessconsumed_rank().get(i).get(1)%></th>
												<%} %>
												
												<th width="80">평균</th>
												<th width="70">미사용 기간</th>
												

											</tr>
										</thead>
										<tbody>


<!-- 여기 for문 필요 -->
<%System.out.println(Integer.parseInt(rd_data.getLessconsumed_code().get(0).get(1))); %>
											
											<%for(int j=0;j<10;j++){ %>
											<tr>
												<td><%=rd_data.getLessconsumed_code().get(j).get(3)%></td>
												<%
													for (int i = 0; i <= calDateDays; i++) {
														int x = Integer.parseInt(rd_data.getLessconsumed_code().get(j).get(1));
														System.out.println(x+" : x의값");
														int y = (int)calDateDays+1;
														
														int looking = (x * y) - y;
														
												%>

												<td><%=rd_data.getLessconsumed_rank().get(looking+i).get(3)%>
												
													<%System.out.println(rd_data.getLessconsumed_rank().get(looking+i));
													
														}
													%>
												<td><%=rd_data.getLessconsumed_code().get(j).get(2)%></td>
												<td><%=rd_data.getLessconsumed_code().get(j).get(4)%></td>
											</tr>
											<%} %>




										</tbody>
									</table>

								</div>

							</section>


						</section>
				</aside>
				<!-- /.aside -->

				<!-- Quick menu -->
				<aside class="aside-xs b-l bg-dark">


				</aside>
				<!-- //Quick menu -->


			</section>
		</section>
</body>
</html>