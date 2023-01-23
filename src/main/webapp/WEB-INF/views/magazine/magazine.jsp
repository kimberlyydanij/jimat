<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Jimat - Food choice for you</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@400;600&display=swap"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=952441bca7c2877c20d98599bb8b06bd"></script>
<link href="${path}/resources/css/main.css" type="text/css"
	rel="stylesheet" />
<link href="${path}/resources/css/magazine.css" type="text/css"
	rel="stylesheet" />

<script defer src="${path}/resources/js/main.js"></script>
<!--   <script defer src="${path}/resources/js/gps.js"></script> -->
<script defer src="${path}/resources/js/map.js"></script>
</head>
<body>
	<div class="body-wrap container col-12 column-row">
		<%-- 메인 메뉴 불러오기 --%>
		<div class="row">
			<jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
		</div>

		<img id="magazine-top"
			src="${path}/resources/images/magazine-main.png">

		<div class="row">
			<div class="magazine-body col-12 ms-3 d-flex">
				<div class="container colums-row">

					<div class="magazine-item" id="korean-drink">
						<a href="magazine-korea-drink.do"><img
							src="${path}/resources/images/korean-drink.png"></a>
					</div>
					<div class="magazine-item" id="garosu">
						<a href="magazine-garosu.do"><img
							src="${path}/resources/images/garosu.png"></a>
					</div>
				</div>
				<div class="container colums-row">
					<div class="magazine-item" id="macandcheese">
						<a href="magazine-macandcheese.do"><img
							src="${path}/resources/images/macandcheese
				.png"></a>
					</div>
					<div class="magazine-item" id="porkcutlet">
						<a href="magazine-porkcutlet.do"><img
							src="${path}/resources/images/porkcutlet.png"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script defer src="${path}/resources/js/map.js"></script>
</body>
</html>