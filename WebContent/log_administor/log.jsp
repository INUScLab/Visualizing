<%@ page import="visualizing.analysis.RankDataCtrl"%>
<%@ page import="visualizing.analysis.RankData"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="visualizing.log_administor.adminlog"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Integer data_start_num = 0;
	Integer data_end_num = 10; // 데이터 오바되면 접근 되는 문제 수정필요.
	String page_start_num = request.getParameter("page_start_num");

	String si = request.getParameter("si");
	String guGun = request.getParameter("guGun");
	String umDong = request.getParameter("umDong");
	String consumerNum = request.getParameter("consumerNum");
	String consumerName = request.getParameter("consumerName");
	String telNumber = request.getParameter("telNumber");
	String meterNum = request.getParameter("meterNum");
	String dateYear = request.getParameter("dateYear");
	String dateMonth = request.getParameter("dateMonth");
	String dateDay = request.getParameter("dateDay");
	String searchDate;

	String[] str = request.getParameterValues("status");

	// 오늘 날짜 구하기
	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	Date currentDate = new Date();
	String date = mSimpleDateFormat.format(currentDate);

	SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy", Locale.KOREA);
	SimpleDateFormat monthFormat = new SimpleDateFormat("MM", Locale.KOREA);
	SimpleDateFormat dayFormat = new SimpleDateFormat("dd", Locale.KOREA);
	Calendar cal = Calendar.getInstance();

	if (dateYear == null || dateYear.equals("")) {
		dateYear = yearFormat.format(currentDate);
	}
	if (dateMonth == null || dateMonth.equals("")) {
		dateMonth = monthFormat.format(currentDate);
	}
	if (dateDay == null || dateDay.equals("")) {
		dateDay = dayFormat.format(currentDate);
	}

	searchDate = dateYear + "-" + dateMonth + "-" + dateDay;

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

	if (page_start_num == null) {
		page_start_num = "1";
	}

	System.out.println(si + "   " + guGun + "   " + umDong + "   " + consumerNum + "   " + consumerName + "   "
			+ telNumber + "   " + meterNum + "   " + searchDate);
%>


<jsp:useBean id="rdctrl" class="visualizing.analysis.RankDataCtrl" />
<jsp:useBean id="log" class="visualizing.log_administor.adminlog_ctrl" />

<%
	//logData 가져오기
	ArrayList<adminlog> z = new ArrayList<adminlog>();
	z = log.getLog();

	for (int i = 0; i < z.size(); i++) {
		System.out.println(z.get(i).getDayandtime());
	}
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
<!-- 저장버튼 클릭시 csv다운로드 -->
<script src="../js/csv_down.js"></script>
<!-- datepicker -->
<script src="../js/datepicker/bootstrap-datepicker.js"></script>
<!--구글 그래프 그리기-->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

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
											<h3 class="m-t m-b-none text-primary font-semibold">관리자
												접속 로그 이력</h3>
											<p class="block text-muted">Water Meter Data Management
												System</p>
										</div>
									</div>
								</header>
								<!-- //title 영역 -->
								<!-- 상세화면-->
								<div class="row padder">
									<div class="col-md-12"></div>


								</div>
								<section class="panel">
									<div class="table-responsive">

										<table class="table table-striped b-t-blue">
											<thead>
												<tr>
													<th width="80">번호</th>
													<th width="200">일시</th>
													<th width="200">아이디</th>
													<th width="100">관리자명</th>
													<th width="200">IP</th>
													<th width="100">비고</th>

												</tr>
											</thead>
											<tbody>
												<!--  for문 있어야함 date 차이만큼 로그 받아오는 쿼리작성 -->
												<%
													for (int i = 0; i < z.size(); i++) {
												%>
												<tr>
													<td><%=z.get(i).getNum()%></td>
													<td><%=z.get(i).getDayandtime()%></td>
													<td><%=z.get(i).getId()%></td>
													<td>관리자</td>
													<td><%=z.get(i).getIp()%></td>
													<td>로그인</td>
												</tr>
												<%
													}
												%>


											</tbody>
										</table>

										<script>
							var searchedData = [ ];
						
						console.log(<%=z.size()%>);
						
						<%for (int i = 0; i < z.size(); i++) {%>
						searchedData.push( {
							number:"<%=z.get(i).getNum()%>",
							date:"<%=z.get(i).getDayandtime()%>",
							id:"<%=z.get(i).getId()%>",
							ip:"<%=z.get(i).getIp()%>
											"

													});
										<%}%>
											console.log(searchedData);
										</script>
									</div>

								</section>
							</section>
						</section>
						<!-- 업무영역 end-->

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