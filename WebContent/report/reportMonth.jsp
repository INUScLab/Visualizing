<%@page import="visualizing.util.MyUtil"%>
<%@ page import="visualizing.report.DetailDataCtrl"%>
<%@ page import="visualizing.report.DetailData"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="ddctrl" class="visualizing.report.DetailDataCtrl" />

<%
	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String umDong = request.getParameter("umDong");
	String consumerNum = request.getParameter("consumerNum");
	String consumerName = request.getParameter("consumerName");
	String telNumber = request.getParameter("telNumber");
	String meterNum = request.getParameter("meterNum");
	String dateYear = request.getParameter("dateYear");

	// 오늘 날짜 구하기
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
	Date currentDate = new Date ();
	String date = mSimpleDateFormat.format ( currentDate );
	
	SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy", Locale.KOREA);
	Calendar cal = Calendar.getInstance();
	
	if (dateYear == null || dateYear.equals("")){
		dateYear = yearFormat.format(currentDate); 
	}
	if (si == null || si.equals(""))
		si = "인천광역시";
	if (guGun == null || guGun.equals(""))
		guGun = "전체";
	if (umDong == null || umDong.equals(""))
		umDong = "전체";
	if (consumerNum != null)
		if (consumerNum.equals(""))
			consumerNum = null;
	if (consumerName != null)
		if (consumerName.equals(""))
			consumerName = null;
	if (telNumber != null)
		if (telNumber.equals(""))
			telNumber = null;
	if (meterNum != null)
		if (meterNum.equals(""))
			meterNum = null;

	//System.out.println(si + "	" + guGun + "	" + umDong + "	" + consumerNum + "	" +  consumerName + "	" + telNumber + "	" + meterNum + "	" + dateYear);
	
	ArrayList<DetailData> array_list = ddctrl.returnDatas2(si, guGun, umDong, consumerNum, consumerName, telNumber, meterNum, dateYear);
%>

<%	//페이징 처리 관련
	MyUtil myUtil = new MyUtil();

	String pageNum = request.getParameter("pageNum");
	int currentPage = 1; //현재 페이지 default로 1
	
	if(pageNum != null) //넘어온 값이 있을때
		currentPage = Integer.parseInt(pageNum); //현재 페이지에 넘어온 값을 넣음
	
	int dataCount = array_list.size(); //전체 데이터를 개수를 구해서
	
	int numPerPage = 10; //1페이지에 10개 씩
	int totalPage = myUtil.getPageCount(numPerPage, dataCount); //필요한 페이지 개수를 알아옴
	
	if(currentPage > totalPage) //현재 페이지가  전체 페이지 개수보다 많으면
		currentPage = totalPage; //현재 페이지에 마지막 페이지를 넣기
	
	int start = (currentPage-1)*numPerPage+1; // 전체 데이터 개수중에 어디 부분을 출력할지 시작
	int end = currentPage*numPerPage; //끝
	
	if (end > array_list.size()){ // 마지막 페이지의 데이터 개수가 numPerPage보다 작을때 데이터의 오버 접근을 막기
		end = array_list.size();
	}
	
	List<DetailData> lists = ddctrl.getList(start, end, array_list); //출력할 데이터 만큼 받아오기.
	
	String listUrl = "/Visualizing/report/reportMonth.jsp";
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);//페이징에 관련 된 태그들을 생성
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
<Script src="../js/csv_down.js"></script>
<script type="text/javascript">
	function pagePass (page) {
		//페이징 버튼에서 사용하는 함수
		f = document.pagePassF;
		f.action = "/Visualizing/report/reportMonth.jsp?pageNum="+page;
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
											<h3 class="m-t m-b-none text-primary font-semibold">월간
												리포트</h3>
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
										<form action="reportMonth.jsp" method="post" id=search_form>
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
															<select name=umDong class="input-sm form-control input-s-sm inline">
																<option value="전체">전체</option>
															</select>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-group m-b-none">
															<select name=dateYear class="input-sm form-control input-s-sm inline">
																<option value="2015" <%if(dateYear.equals("2015")) out.print("selected=\"selected\"");%>>2015년</option>
																<option value="2016" <%if(dateYear.equals("2016")) out.print("selected=\"selected\"");%>>2016년</option>
																<option value="2017" <%if(dateYear.equals("2017")) out.print("selected=\"selected\"");%>>2017년</option>
															</select>
														</div>
													</div>
													<div class="col-sm-4 p-l-none">
														<div class="form-group m-b-none">
															<label class="col-lg-3 control-label">수용가번호</label>
															<div class="col-lg-7">
																<input type="text" class="form-control" name="consumerNum" value="${param['consumerNum']}">
															</div>
														</div>
													</div>
												</div>
												<div class="row text-sm">

													<div class="col-sm-4 p-l-none">
														<div class="form-group">
															<label class="col-lg-3 control-label">수용가명</label>
															<div class="col-lg-7">
																<input type="text" class="form-control" name="consumerName" value="${param['consumerName']}">
															</div>
														</div>
													</div>
													<div class="col-sm-4 p-l-none">
														<div class="form-group">
															<label class="col-lg-3 control-label">지시부번호</label>
															<div class="col-lg-7">
																<input type="text" class="form-control" name="telNumber" value="${param['telNumber']}">
															</div>
														</div>
													</div>
													<div class="col-sm-4 p-l-none">
														<div class="form-group">
															<label class="col-lg-3 control-label">미터번호</label>
															<div class="col-lg-7">
																<input type="text" class="form-control" name="meterNum" value="${param['meterNum']}">
															</div>
														</div>
													</div>
												</div>
												<!-- 검색 버튼-->
												<div class="row ">
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
													<i class="fa fa-chevron-circle-right"></i> <%=dateYear + "년 "%>
												</header>
												<table class="table table-striped b-t-blue"
													style="width: 2500px;">
													<thead>
														<tr>
															<th width="70">수용가번호</th>
															<th width="70">수용가명</th>
															<th width="70">지시부번호</th>
															<th width="60">미터번호</th>
															<th width="60">미터타입</th>
															<th width="50">검침년</th>
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
														<%
															for (DetailData dd : lists) {
														%>
														<tr>
															<td><%=dd.getCode()%></td>
															<td><%=dd.getDetail()%></td>
															<td><%=dd.getNumber()%></td>
															<td><%=dd.getMeter_num()%></td>
															<td><%=dd.getMeter_type()%></td>
															<td><%=dateYear%></td>
															<td><%=dd.getTotal_consumed()%></td>
															<%
																for (String a : dd.getConsumed_days()) {
															%>
															<td><%=a%></td>
															<%
																}

																	for (int j = 12 - dd.getConsumed_days().length; j > 0; j--) {
															%>
															<td>0.00</td>
															<%
																}
															%>
														</tr>
														<%
															}
														%>
													</tbody>
												</table>
												
												<script>
														var searchedData = [ ];
														
														<%for (DetailData dd : array_list) {
															int i=0;
														%>
															searchedData.push( {
																code:"<%=dd.getCode()%>",
																detail:"<%=dd.getDetail()%>",
																number:"<%=dd.getNumber()%>",
																meternum:"<%=dd.getMeter_num()%>",
																metertype:"<%=dd.getMeter_type()%>",
																term:"<%=dateYear%>",
																consume:"<%=dd.getTotal_consumed()%>",
																<% for (String a : dd.getConsumed_days()) {
																	i++;
																%>
																	month<%=i%>:"<%=a%>",	
																<%}
																for (int j = 31 - dd.getConsumed_days().length; j > 0; j--) {
																	i++;
																%>
																	month<%=i%>:"0.00",
																<%}%>
															});
														
														<%}%>
													</script>
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
															<input type="hidden" name="dateYear" value="${param['dateYear']}">
															<input type="hidden" name="dateMonth" value="${param['dateMonth']}">
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


									</div>
								</div>
								<!-- 검색조건 -->
								<!-- //검색조건 -->


							</section>
						</section>

					</section>
				</aside>
				<!-- /.aside -->

				<!-- Quick menu -->
				<aside class="aside-xs b-l bg-dark">

					<section class="m-t-l">
						<ul class="nav nav-pills">
							<li><a href="#" onclick="download_csv_reportMonth('월별리포트')"><i class="fa fa-save icon-lg"
									data-toggle="tooltip" data-placement="top" title="저장"></i></a></li>
						</ul>
					</section>

				</aside>
				<!-- //Quick menu -->


			</section>
		</section>
</body>
</html>


