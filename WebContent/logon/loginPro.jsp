<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:if test="${check == 1 }">
	<c:set var="id" value="${id }" scope="session" />
	<script>
		window.location.href="<%=cp%>/map/Map.do";
	</script>
</c:if>
<c:if test="${check == 0 }">
	<script>
		alert('로그인에 실패했습니다.');
		window.location.href="<%=cp%>/mg/LoginForm.do";
	</script>
	
</c:if>



