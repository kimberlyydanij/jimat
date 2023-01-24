<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Jimat - Food choice for you</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<link href="${path}/resources/css/magazine.css" type="text/css"
	rel="stylesheet" />
</head>
<body>
	<div class="body-wrap container col-12 column-row">
		<%-- 메인 메뉴 불러오기 --%>
		<div class="row">
			<jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
		</div>

		<a href="javascript: magazine();">
		<img id="magazine-top"
			src="${path}/resources/images/magazine-main.png">
		</a>
		
		<div
			class="magazine-body pb-3 col-11 container column-row mt-2 px-0 py-3"
			id="main-magazine">
			<div class="row row-cols-2">
			<c:set var="count" value="0" />
			<c:forEach items="${aList}" var="aList">
				<c:set var="count" value="${count+1}" />
				
				<div class="col magazine-list-body container d-flex my-2 p-0"
					id="list<c:out value='${count}'/>">
					<div class="magazine-list-thumbnail col-3">
						<c:url var="shopDetail_a" value="shopdetail.do">
							<c:param name="shopDetail_num" value="${aList.foodstore_id}" />
						</c:url>
						<a href="${shopDetail_a}"> <img src="${aList.img_url}"
							class="shop-thumbnail" /></a>
					</div>
					<div class="magazine-list-info columns-row col-8 ms-3 mt-2">
						<div class="shop-name mt-4">${aList.foodstore_name}</div>
						<div class="shop-tags mt-4">#${aList.tag_age},
							#${aList.tag_gender}, #${aList.tag_store}</div>
						<div class="shop-area mt-2">${aList.area}</div>
					</div>
					<!--  매거진 리스트 인포 -->
				</div>
				<!-- 매거진리스트바디-->
			</c:forEach>
		</div>
		</div>
</body>
</html>
