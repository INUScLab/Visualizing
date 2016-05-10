<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>

<html>
<head>
<title>WATER FOOTPRINTS VISUALIZING WEB</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js">
	
</script>
<script type="text/javascript">
function sendIt(){
	var f = document.loginF;
	
	if(!f.userId.value){
		alert("id를 입력하세요!");
		f.userId.focus();
		return;
	}
	
	if(!f.userPasswd.value){
		alert("비밀번호를 입력하세요!");
		f.userPasswd.focus();
		return;
	}
	
	f.action = "<%=cp%>/mg/LoginPro.do";
	f.submit();
	
}
</script>
<style>
.body {
	background-color: #E2E2E2;
}

#layout {
	padding-bottom: 70px;
	padding-top: 100px;
	background-color: white;
	border-color: black;
}

#subject {
	font-size: 22px;
	color: #949191;
}
</style>

</head>

<body class="body">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="span6"></div>

		<div class="span6">
			<strong id="subject"><center>WATER FOOTPRINTS VISUALIZING WEB</center></strong>


			<form class="form-horizontal" id="layout" name="loginF" method="post">
				<div class="control-group">
					<label class="control-label" for="inputID">ID</label>
					<div class="controls">
						<input type="text" id="inputID" placeholder="ID" name="userId">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="inputPassword">Password</label>
					<div class="controls">
						<input type="password" id="inputPassword" placeholder="Password" name="userPasswd">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">

						<button class="btn" id="login" onclick="sendIt();">Sign in</button>
					</div>
				</div>
			</form>
		</div>

<%=cp %>




	</div>


</body>
</html>
