<%@page import="java.util.List"%>
<%@page import="visualizing.util.MyUtil"%>
<%@ page import="visualizing.analysis.AnalysisDataCtrl"%>
<%@ page import="visualizing.analysis.AnalysisData"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="adctrl" class="visualizing.analysis.AnalysisDataCtrl" />

<%
	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String umDong = request.getParameter("umDong");
	String consumerNum = request.getParameter("consumerNum");
	String consumerName = request.getParameter("consumerName");
	String telNumber = request.getParameter("telNumber");
	String meterNum = request.getParameter("meterNum");
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");

	if (sdate == null || sdate.equals(""))		sdate = "2015-01-31";
	if (edate == null || edate.equals(""))		edate = "2015-02-28";
	if (si == null || si.equals(""))			si = "인천광역시";
	if (guGun == null || guGun.equals(""))		guGun = "전체";
	if (umDong == null || umDong.equals(""))	umDong = "전체";
	if (consumerNum != null)if (consumerNum.equals(""))		consumerNum = null;
	if (consumerName != null)if (consumerName.equals(""))	consumerName = null;
	if (telNumber != null)if (telNumber.equals("")) 		telNumber = null;
	if (meterNum != null)if (meterNum.equals(""))			meterNum = null;

	System.out.println(si + "	" + guGun + "	" + umDong + "	" + consumerNum + "	" + consumerName + "	" + telNumber + "	" + meterNum + "	" + sdate + "	" + edate);

	String[] sdates = new String(sdate).split("-");
	String[] edates = new String(edate).split("-");
	
	ArrayList<AnalysisData> array_list = adctrl.returnDatas(si, guGun, umDong, consumerNum, consumerName,
			telNumber, meterNum, sdates[0] , sdates[1], sdates[2], edates[0], edates[1], edates[2]);

	// 오늘 날짜 구하기
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
	Date currentDate = new Date ();
	String date = mSimpleDateFormat.format ( currentDate );
%>

<%
	MyUtil myUtil = new MyUtil();

	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	
	if(pageNum != null) //넘어온 값이 있을때
		currentPage = Integer.parseInt(pageNum);
	
	int dataCount = array_list.size();
	
	int numPerPage = 10;
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	if(currentPage > totalPage)
		currentPage = totalPage;
	
	int start = (currentPage-1)*numPerPage;
	int end = currentPage*numPerPage;
	
	if (end > array_list.size()){
		end = array_list.size();
	}
	
	List<AnalysisData> lists = adctrl.getList(start, end, array_list);
	
	String listUrl = "/Visualizing/analysis/SearchDay.do";
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);	
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
<script type="text/javascript">
	window.onload = function() {
		<%String gugun;
			if (request.getParameter("guGun") == null)
				gugun = "전체";
			else
				gugun = request.getParameter("guGun");%>
		search_form.guGun.value = "<%=gugun%>";
		
		<%String s;
			if (request.getParameter("sdate") == null)
				s = "2015-01-31";
			else
				s = request.getParameter("sdate");%>
		search_form.sdate.value = "<%=s%>";
		
		<%String e;
			if (request.getParameter("edate") == null)
				e = "2015-02-28";
			else
				e = request.getParameter("edate");%>
		search_form.edate.value = "<%=e%>";
		
	};
	
	function pagePass (page) {
		f = document.pagePassF;
		f.action = "/Visualizing/analysis/SearchDay.do?pageNum="+page;
		f.submit();
		
		return true;
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


				<aside>
					<!-- 상단영역 -->
					<section class="vbox">
						<header class="nav bg-gradient-1 b-b">
							<div class="nav notify-row">
								<!--  start -->
								<ul class="nav top-menu">
									<!-- 누수 start-->
									<li class="dropdown"><a class="dropdown-toggle" href="#">
											<img src="../images/water.png" data-toggle="tooltip"
											data-placement="bottom" title="누수"><span
											class="badge bg-danger">6</span>
									</a></li>
									<!-- 누수 end -->
									<!-- 동파 start-->
									<li class="dropdown"><a class="dropdown-toggle" href="#">
											<img src="../images/winter.png" data-toggle="tooltip"
											data-placement="bottom" title="동파">
									</a></li>
									<!-- 동파 end -->
									<!-- 비만 start-->
									<li class="dropdown"><a class="dropdown-toggle" href="#">
											<img src="../images/obesity.png" data-toggle="tooltip"
											data-placement="bottom" title="비만"><span
											class="badge bg-warning">7</span>
									</a></li>
									<!-- 비만 end -->
									<!-- 파손 start-->
									<li class="dropdown"><a class="dropdown-toggle" href="#">
											<img src="../images/damage.png" data-toggle="tooltip"
											data-placement="bottom" title="파손">
									</a></li>
									<!-- 파손 end -->
									<!-- 역류 start-->
									<li class="dropdown"><a class="dropdown-toggle" href="#">
											<img src="../images/backwash.png" data-toggle="tooltip"
											data-placement="bottom" title="역류">
									</a></li>
									<!-- 역류 end -->
									<!-- 비만 start-->
									<li class="dropdown"><a class="dropdown-toggle" href="#">
											<img src="../images/absence.png" data-toggle="tooltip"
											data-placement="bottom" title="부재중">
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
											<h3 class="m-t m-b-none text-primary font-semibold">일별
												통계</h3>
											<p class="block text-muted">Water Meter Data Management
												System</p>
										</div>
									</div>
								</header>
								<!-- //title 영역 -->
								<!-- 상세화면-->
								<div class="row padder">
									<div class="col-md-12">

										<!-- 검색조건 -->
										<form action="analysisDay.jsp" method="post" id=search_form>
											<div class="well">
												<div class="row text-sm">
													<div class="col-sm-4">
														<div class="form-group m-b-none">
															<select name=si class="input-sm form-control input-s-sm inline">
																<option value="인천광역시">인천광역시</option>
															</select>
															<select name=guGun class="input-sm form-control input-s-sm inline">
																<option value="전체">전체</option>
																<option value="강화군">강화군</option>
																<option value="계양구">계양구</option>
																<option value="남구">남구</option>
																<option value="남동구">남동구</option>
																<option value="동구">동구</option>
																<option value="부평구">부평구</option>
															</select>
															<select name=umDong class="input-sm form-control input-s-sm inline">
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
																	data-date-format="dd-mm-yyyy">~<input
																	class="input-sm input-s-sm datepicker-input form-control"
																	type="text" name="edate" value="${param['edate']}"
																	data-date-format="dd-mm-yyyy">
															</div>
														</div>
													</div>
													<div class="col-sm-4 p-l-none">
														<div class="form-group m-b-none">
															<label class="col-lg-3 control-label">수용가번호</label>
															<div class="col-lg-7">
																<input type="text" class="form-control"
																	name="consumerNum" value="${param['consumerNum']}">
															</div>
														</div>
													</div>
												</div>
												<div class="row text-sm">
													<div class="col-sm-4 p-l-none">
														<div class="form-group">
															<label class="col-lg-3 control-label">수용가명</label>
															<div class="col-lg-7">
																<input type="text" class="form-control"
																	name="consumerName" value="${param['consumerName']}">
															</div>
														</div>
													</div>
													<div class="col-sm-4 p-l-none">
														<div class="form-group">
															<label class="col-lg-3 control-label">지시부번호</label>
															<div class="col-lg-7">
																<input type="text" class="form-control" name="telNumber"
																	value="${param['telNumber']}">
															</div>
														</div>
													</div>
													<div class="col-sm-4 p-l-none">
														<div class="form-group">
															<label class="col-lg-3 control-label">미터번호</label>
															<div class="col-lg-7">
																<input type="text" class="form-control" name="meterNum"
																	value="${param['meterNum']}">
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
										<!-- //검색조건 -->

										<section class="panel">
											<div class="table-responsive">
												<header class="panel-heading text-primary font-semibold h5">
													<i class="fa fa-chevron-circle-right"></i>
													<%=sdate + " ~ " + edate%>
												</header>
												<table class="table table-striped b-t-blue">
													<thead>
														<tr>
															<th>번호</th>
															<th>수용가명</th>
															<th>지시부번호</th>
															<th>미터번호</th>
															<th>미터타입</th>
															<th>검침기간</th>
															<th>총사용량</th>
															<th>일수</th>
															<th>일 평균사용량</th>
														</tr>
													</thead>
													<tbody>
														<%
															for (AnalysisData ad : lists) {
														%>
														<tr>
															<td><%=ad.getCode()%></td>
															<td><%=ad.getDetail()%></td>
															<td><%=ad.getNumber()%></td>
															<td><%=ad.getMeter_num()%></td>
															<td><%=ad.getMeter_type()%></td>
															<td><%=ad.getTerm()%></td>
															<td><%=ad.getTotal_consumed()%></td>
															<td><%=ad.getCount()%></td>
															<td><%=ad.getAvg_consumed()%></td>

														</tr>
														<%
															}
														%>
													</tbody>
												</table>
											</div>
											<footer class="panel-footer">
												<div class="row">
													<div class="col-sm-3 hidden-xs">
													</div>
													<div class="col-sm-6 text-center text-center">
															<input type="hidden" name="s_name" />
															<form action="" method="post" name="pagePassF">
															<input type="hidden" name="si" value="${param['si']}">
															<input type="hidden" name="guGun" value="${param['guGun']}">
															<input type="hidden" name="umDong" value="${param['umDong']}">
															<input type="hidden" name="sdate" value="${param['sdate']}">
															<input type="hidden" name="edate" value="${param['edate']}">
															<input type="hidden" name="consumerNum" value="${param['consumerNum']}">
															<input type="hidden" name="consumerName" value="${param['consumerName']}">
															<input type="hidden" name="telNumber" value="${param['telNumber']}">
															<input type="hidden" name="meterNum" value="${param['meterNum']}">
																<ul class="pagination pagination-sm m-t-none m-b-none">
																	<%=pageIndexList %>
																</ul>
															</form>
													</div>
													<div class="col-sm-3 text-right hidden-xs">
													</div>

												</div>
											</footer>
										</section>
							</section>
						</section>

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