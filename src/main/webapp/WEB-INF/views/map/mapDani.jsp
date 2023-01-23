<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Jimat - Food choice for you</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=903a4aeed7d052f1bba36783e3f8632e"></script>
<script defer src="${path}/resources/js/map.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<link href="${path}/resources/css/main.css" type="text/css"
	rel="stylesheet" />

<link href="${path}/resources/css/map1.css" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<div class="body-wrap container col-12 mt-2 column-row">
		<div class="row">
			<%-- 메인 메뉴 불러오기 --%>
			<jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
		</div>
		<div class="row p-0">
			<div class="map-wrap container col-12 p-0 d-flex">
				<div class="map-list col-3 column-row">
					<hr />
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
				<div class="map-main container d-flex p-0 col-9">
					<div id="map"></div>

				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
