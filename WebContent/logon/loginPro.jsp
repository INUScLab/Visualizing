<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="lg" class="sclab.db.Login"/>
<%

String id = request.getParameter("userId");
String passwd = request.getParameter("userPasswd");

int check = 0;
String result = lg.checkId(id,passwd);
if (result != null && result.equals("0")){
	check = 1;
	/*System.out.print("check=1");*/
} else {
	check=0;
	//return "/index.jsp";
	/*System.out.print("check=0");*/
 }

request.setAttribute("check", new Integer(check));
request.setAttribute("id", id);
%>
<c:if test="${check == 1 }">
	<c:set var="id" value="${id }" scope="session" />
	<script>
		window.location.href="/Visualizing/map/map_main.jsp";
	</script>
</c:if>
<c:if test="${check == 0 }">
	<script>
		alert('로그인에 실패했습니다.');
		window.location.href="/Visualizing/logon/loginForm.jsp";
	</script>
	
</c:if>



