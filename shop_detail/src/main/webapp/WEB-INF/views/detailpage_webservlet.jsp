<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%
String lat = request.getParameter("latitude");
String lng = request.getParameter("longitude");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85e3a2b784700813659ca3ae8da46d29"></script>
</head>
<body>
	<div id="staticMap" style="width: 350px; height: 350px"></div>
	<script>
	var lat =<%=lat%>;
	var lng =<%=lng%>;
	</script>
</body>
</html>