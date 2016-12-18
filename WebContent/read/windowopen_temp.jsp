<%@ page import="java.util.*"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// windowopen.jsp에는 readDay.jsp에서
	// code, detail, number,meter_num, meter_type, meter status, d_date, consumed가 넘어 온다.
	String code = request.getParameter("code");
	String detail = request.getParameter("detail");
	String number = request.getParameter("number");
	String meter_num = request.getParameter("meter_num");
	String meter_type = request.getParameter("meter_type");
	String meter_status = request.getParameter("meter_status");
	String d_date = request.getParameter("d_date");
	String consumed = request.getParameter("consumed");

	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");
	String sdate_m = request.getParameter("sdate_m");
	String edate_m = request.getParameter("edate_m");
	String stime = request.getParameter("stime");
	String etime = request.getParameter("etime");
	String selectPage = request.getParameter("page");

	// 어느 페이지로 부터 불려졌는지 알기 위함
	String wherefrom = request.getParameter("wherefrom");
	System.out.println(wherefrom);
	if (wherefrom == null)
		wherefrom = "null";

	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat(
			"yyyy-MM-dd", Locale.KOREA);
	Date currentDate = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(currentDate);
	cal.add(Calendar.DATE, -6);
	if (sdate == null)
		sdate = mSimpleDateFormat.format(cal.getTime());
	if (edate == null)
		edate = mSimpleDateFormat.format(currentDate);
	
	SimpleDateFormat mSimpleDateFormat_m = new SimpleDateFormat(
			"yyyy-MM", Locale.KOREA);
	cal.setTime(currentDate);
	cal.add(Calendar.MONTH, -6);
	if (sdate_m == null)
		sdate_m = mSimpleDateFormat_m.format(cal.getTime());
	if (edate_m == null)
		edate_m = mSimpleDateFormat_m.format(currentDate);
	
	if (request.getParameter("stime") == null)
		stime = "0";
	if (request.getParameter("etime") == null)
		etime = "10";

	//임시
	if (code == null)
		code = "1";

	System.out.println("<windowopen>");
	System.out.println(code);
	System.out.println(sdate);
	System.out.println(edate);
	System.out.println(sdate_m);
	System.out.println(edate_m);
	System.out.println(selectPage);
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

</head>
<body>
	<section id="content">
		<section class="hbox stretch">
			<!-- 상단영역 -->
			<section class="scrollable m-t-xxs">
				<section class="panel b-b-n">
					<!-- 업무영역 start-->
					<!-- =============================상세정보================================-->
					<div class="row padder">
						<div class="col-md-12">
							<section class="panel">
								<header class="panel-heading text-primary font-semibold h5">
									<i class="fa fa-chevron-circle-right"></i> 상세정보
								</header>
								<table class="table table-striped b-t-blue" border="1">
									<tr>
										<td>수용가번호</td>
										<td><%=code%></td>
										<td>수용가명</td>
										<td><%=detail%></td>
									</tr>

									<tr>
										<td>지시부번호</td>
										<td><%=number%></td>
										<td>미터번호</td>
										<td><%=meter_num%></td>
									</tr>

									<tr>
										<td>미터타입</td>
										<td><%=meter_type%></td>
										<td>미터상태</td>
										<td><%=meter_status%></td>
									</tr>

									<tr>
										<td>검침일</td>
										<td><%=d_date%></td>
										<td>검침값</td>
										<td><%=consumed%></td>
									</tr>
								</table>
							</section>
						</div>
					</div>
					<!-- =============================탭바와 그래프================================-->
					<div class="row padder">
						<div class="col-md-12">
							<section class="panel">
								<header class="panel-heading text-primary font-semibold h5">
									<ul class="nav nav-tabs" role="tablist">
										<li role="presentation" class="active"><a
											href="windowopen_temp.jsp?code=<%=code%>&detail=<%=detail%>&number=<%=number%>&meter_num=<%=meter_num%>&meter_type=<%=meter_type%>&meter_status=<%=meter_status%>&d_date=<%=d_date%>&consumed=<%=consumed%>&page=time">시간대별</a></li>
										<li role="presentation"><a
											href="windowopen_temp.jsp?code=<%=code%>&detail=<%=detail%>&number=<%=number%>&meter_num=<%=meter_num%>&meter_type=<%=meter_type%>&meter_status=<%=meter_status%>&d_date=<%=d_date%>&consumed=<%=consumed%>&page=day">일별</a></li>
										<li role="presentation"><a
											href="windowopen_temp.jsp?code=<%=code%>&detail=<%=detail%>&number=<%=number%>&meter_num=<%=meter_num%>&meter_type=<%=meter_type%>&meter_status=<%=meter_status%>&d_date=<%=d_date%>&consumed=<%=consumed%>&page=month">월별</a></li>
									</ul>
								</header>
							</section>
						</div>
					</div>
					<div class="tab-content">
						<!-- ====시간별==== -->
						<%
							if (selectPage.equals("time")) {
						%>
						<div id="timely">
							<jsp:include page="timeTable_temp.jsp" flush="false">
								<jsp:param name="code" value="<%=code%>" />
								<jsp:param name="sdate" value="<%=sdate%>" />
								<jsp:param name="edate" value="<%=edate%>" />
								<jsp:param name="stime" value="<%=stime%>" />
								<jsp:param name="etime" value="<%=etime%>" />
								<jsp:param name="sdate_m" value="<%=sdate_m%>" />
								<jsp:param name="edate_m" value="<%=edate_m%>" />
							</jsp:include>
						</div>
						<%
							}
						%>

						<!-- ====일별==== -->
						<%
							if (selectPage.equals("day")) {
						%>
						<div id="daily">
							<jsp:include page="dayTable_temp.jsp" flush="false">
								<jsp:param name="code" value="<%=code%>" />
								<jsp:param name="sdate" value="<%=sdate%>" />
								<jsp:param name="edate" value="<%=edate%>" />
								<jsp:param name="sdate_m" value="<%=sdate_m%>" />
								<jsp:param name="edate_m" value="<%=edate_m%>" />
							</jsp:include>
						</div>
						<%
							}
						%>

						<!-- ====월별==== -->

						<%
							if (selectPage.equals("month")) {
						%>
						<div id="monthly">
							<jsp:include page="monthTable_temp.jsp" flush="false">
								<jsp:param name="code" value="<%=code%>" />
								<jsp:param name="sdate" value="<%=sdate%>" />
								<jsp:param name="edate" value="<%=edate%>" />
								<jsp:param name="sdate_m" value="<%=sdate_m%>" />
								<jsp:param name="edate_m" value="<%=edate_m%>" />
							</jsp:include>

						</div>
						<%
							}
						%>
					</div>
				</section>
			</section>
		</section>
	</section>
</body>
</html>