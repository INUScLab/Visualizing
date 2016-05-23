<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>::: 수도검침서비스 :::</title>
<meta name="description" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="/Visualizing/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="/Visualizing/css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="/Visualizing/css/font.css" type="text/css" cache="false" />
<link rel="stylesheet" href="/Visualizing/css/app.css" type="text/css" cache="false" />
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
<script type="text/javascript">
function sendIt() {
	var f = document.loginF;
	
	f.action = "/Visualizing/mg/LoginPro.do";
	f.submit();
}

</script>
</head>



<body class="bg-login">
	<c:if test="${empty sessionScope.id }">
		<section id="content" style="margin-top: 200px">

			<div id="login-box">
				<header class="m-b-xlg text-center m-t-login">
					<img src="/Visualizing/images/login-logo.png" alt="수도미터검침서비스" />
				</header>


				<form class="bs-example form-horizontal" name="loginF" method="post">
					<div class="form-group">
						<label class="col-lg-3 control-label">ID</label>
						<div class="col-lg-9">
							<input type="id" class="form-control" placeholder="아이디를 입력해 주세요" name="userId" style="width: 250px;">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Password</label>
						<div class="col-lg-9">
							<input type="password" class="form-control" placeholder="비밀번호를 입력해 주세요" name="userPasswd" style="width: 250px;">
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-offset-3 col-lg-9">
							<button type="submit" class="btn btn-s-md btn-info font-semibold" onclick="sendIt();">LOGIN</button>
						</div>
					</div>
				</form>

			</div>
		</section>
		<!-- footer -->
		<footer id="footer">
			<div class="text-center padder clearfix">
				<p>
					<small class="text-white">copyright<br>&copy; 2013
					</small>
				</p>
			</div>
		</footer>
		<!-- / footer -->
	</c:if>

	<c:if test="${!empty sessionScope.id }">

		<script type="text/javascript">
			location.href = "/Visualizing/map/Map.do";
		</script>
	</c:if>
</body>



</body>
</html>
