<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:remove var="id" scope="session"/>