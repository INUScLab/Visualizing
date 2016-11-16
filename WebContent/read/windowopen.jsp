<%@ page import="visualizing.analysis.RankDataCtrl"%>
<%@ page import="visualizing.analysis.RankData"%>
<%@ page import="visualizing.read.ReadDataCtrl"%>
<%@ page import="visualizing.read.ReadData"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<jsp:useBean id="rdctrl" class="visualizing.analysis.RankDataCtrl" />
<jsp:useBean id="rctrl" class="visualizing.read.ReadDataCtrl" />

<%
   String si = request.getParameter("si");
   String guGun = request.getParameter("guGun");
   String umDong = request.getParameter("umDong");
   String consumerNum = request.getParameter("consumerNum");
   String consumerName = request.getParameter("consumerName");
   String telNumber = request.getParameter("telNumber");
   String meterNum = request.getParameter("meterNum");
   String[] str = request.getParameterValues("str");
   String searchDate = request.getParameter("searchDate");

   String code = request.getParameter("code");
   String detail = request.getParameter("detail");
   String number = request.getParameter("number");
   String meter_num = request.getParameter("meter_num");
   String meter_type = request.getParameter("meter_type");
   String meter_status = request.getParameter("meter_status");
   String d_date = request.getParameter("d_date");
   String consumed = request.getParameter("consumed");
   
   if (si == null || si.equals(""))
      si = "인천광역시";
   if (guGun == null || guGun.equals(""))
      guGun = "강화군";

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
   
    RankData rd_data = rdctrl.returnCodeDatas(code, edate, date);
   
   System.out.println(rd_data.getTest().get(0).get(0));
   
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
   // Load Charts and the corechart package.
   google.charts.load('current', {'packages' : [ 'corechart' ]});

   // 랭킹 그래프 로드
   google.charts.setOnLoadCallback(Consumed);

   
   // 부재중 상위 데이터 그래프
   function Consumed() {
      
      <%textDate2 = temp;%>
      
      // Create the data table
      var data = google.visualization.arrayToDataTable([
          ['Date', '<%=rd_data.getTest().get(0).get(0)%>'],
            <% for(int i=0; i<rd_data.getUpper_consumed_data().get(0).size(); i++){ %>
            [ '<%=textDate2%>' ,<%=rd_data.getUpper_consumed_data().get(0).get(i)%>],
         <%// 시간 더하기         
          Date sdate = DateFormat.parse(textDate2);
           cal.setTime(sdate);
           cal.add(Calendar.DATE, 1);
         textDate2 = DateFormat.format(cal.getTime()); 
         }%>
       ]);
      
      // Set options for chart.
      var options = {
         colors: ['#FF4943', '#7DCDF2','#33B1EB', '#1871CD'],
         hAxis: {title: '날짜'},
           vAxis: {title: '소비량',
              minValue : 0,
            viewWindow : {
               min : 0
            }}
      };

      // Instantiate and draw the chart
      var chart = new google.visualization.LineChart(document.getElementById('Consumed'));
      chart.draw(data, options);
   }
</script>
</head>
<body>
   <section class="hbox stretch">
      


      <section id="content">
         <section class="hbox stretch">


            <aside>
               <!-- 상단영역 -->
               <section class="vbox">


                  <section class="scrollable m-t-xxs">
                     <section class="panel b-b-n">
                        <!-- 업무영역 start-->

                        <!-- title 영역 -->
                        <header class="m-b-lg">
                           <div
                              class="row m-l-none m-r-none m-r-none box-shadow bg-light b-b">
                              <div class="col-sm-4">
                              
                              
                              <!--  
                                 <h3 class="m-t m-b-none text-primary font-semibold">지역별
                                    통계 순위 ( <%// 시간 더하기
                                      cal.setTime(currentDate);
                                         cal.add(Calendar.DATE, -6);
                                       textDate = DateFormat.format(cal.getTime()); %>   
                                        <%=textDate%>
                                         <% textDate = DateFormat.format(currentDate); 
                                       %> ~ <%=textDate%> )</h3>
                                       
                                       
                                 <p class="block text-muted">Water Meter Data Management
                                    System</p>
                                    -->
                                    
                                    
                              </div>
                           </div>
                        </header>
                        <!-- //title 영역 -->
                        <!-- 상세화면-->
                        <div class="row padder">
                           <div class="col-md-12">
                              <section class="panel">
                                 <header class="panel-heading text-primary font-semibold h5">
                                    <i class="fa fa-chevron-circle-right"></i> 상세정보
                                 </header>
                                 
                                 
                                 <table class="table table-striped b-t-blue" border="1">
                                 <tr>
                                    <td> 번호</td>
                                      <td> <%=code %></td>
                                     <td> 수용가명</td>
                                    <td> <%=detail %></td>
                                 </tr>
                                 
                                 <tr>
                                    <td> 지시부번호</td>
                                      <td> <%=number %></td>
                                     <td> 미터번호</td>
                                    <td> <%=meter_num %></td>
                                 </tr>
                                 
                                  <tr>
                                    <td> 미터타입</td>
                                      <td> <%=meter_type %></td>
                                     <td> 미터상태</td>
                                    <td> <%=meter_status %></td>
                                 </tr>
                                 
                                  <tr>
                                    <td> 검침일</td>
                                      <td> <%=d_date %></td>
                                     <td> 검침값</td>
                                    <td> <%=consumed %></td>
                                 </tr>
                                 </table>
                                 
                                 <div class="row m-t m-b wrapper">
                                    <div class="col-lg-3">
                                       <section class="panel">
                                          <header class="panel-heading">그래프</header>
                                          <div class="panel-body text-center" id="Consumed"></div>
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



         </section>
      </section>
</body>
</html>                   