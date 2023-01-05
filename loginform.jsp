<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<c:set var="REST_API_KEY" value="dc71b825598ec6c58fb2a8f6fd26e952" />
	<c:set var="REDIRECT_URI"
		value="http://localhost:8090/myapp/loginpage.do" />

	<!-- controller KakaoLogin으로 연결 -->
	<a
		href="https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code">
		<img src="images/kakao_login_medium_narrow.png">
	</a>
</body>
</html>