<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Jimat - Food choice for you</title>
<script>
//팝업창에서 부모창을 다른페이지로 이동합니다.
window.opener.location.href="http://localhost:8090/index.do";
self.close();
</script>
</head>
<body>

	<!-- controller LogoutPage 메서드로 연결 -->
	<form method="post">
		<a href="/logoutpage.do"> <input type="button" value="로그아웃"
			alt="logout_button">
		</a>
	</form>

	<!-- controller StopConnection 메서드로 연결 -->
	<form method="post">
		<a href="/stopconnpage.do"> <input type="button" value="연결끊기"
			alt="stop_connection_button">
		</a>
	</form>

</body>
</html>