<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jimat - Food choice for you</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<link
      href="${path}/resources/css/login.css"
      type="text/css"
      rel="stylesheet"
    />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<c:set var="REST_API_KEY" value="dc71b825598ec6c58fb2a8f6fd26e952" />
	<c:set var="REDIRECT_URI" value="http://localhost:8090/myapp/loginpage.do" />
	

	<div class="body-wrap m-1 p-4 columns-row mt-3">
		<br />
		<div class="login_info my-2" >
			<img src="${path}/resources/images/KakaoTalk_login_comment1.png" />
		</div>
		<div class="login_btn my-5">

			<!-- controller KakaoLogin으로 연결 -->
			<a class="kakao_btn"
				href="https://kauth.kakao.com/oauth/authorize?client_id=${REST_API_KEY}&redirect_uri=${REDIRECT_URI}&response_type=code ">
				<img src="${path}/resources/images/kakao_login_medium_narrow.png">
			</a>

		</div>
		<div class="login_info my-5">
			<img src="${path}/resources/images/KakaoTalk_login_comment2.png" />
		</div>
	</div>
</body>

</body>
</html>