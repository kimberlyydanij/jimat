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
	<c:set var="LOGOUT_REDIRECT_URI"
		value="http://localhost:8090/myapp/kakaologin.do" />

		<!-- controller LogoutPage 메서드로 연결 -->
		<form method="post">
			<a href="http://localhost:8090/myapp/logoutpage.do">
				<input type="button" value="로그아웃" alt="logout_button">
			</a>
		</form>
		
		<!-- controller StopConnection 메서드로 연결 -->
		<form method="post">
			<a href="http://localhost:8090/myapp/stopconnpage.do">
				<input type="button" value="연결끊기" alt="stop_connection_button">
			</a>
		</form>

</body>
</html>