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
	<div
		class="magazine-body pb-3 col-11 container column-row mt-2 px-0 py-3"
		id="main-magazine">
		<c:set var="count" value="0" />
		<c:forEach items="${aList}" var="aList">
			<c:set var="count" value="${count+1}" />
			<div class="magazine-list-body container d-flex col-12 mx-0 my-3"
				id="list<c:out value='${count}'/>">

				<div class="magazine-list-no mx-1 col-1">
					<c:out value="${count}" />
				</div>
				<div class="magazine-list-thumbnail py-3 m-0 col-3">
					<c:url var="shopDetail_a" value="shopdetail.do">
						<c:param name="shopDetail_num" value="${aList.foodstore_id}" />
					</c:url>
					<a href="${shopDetail_a}"> <img src="${aList.img_url}"
						class="shop-thumbnail" /></a>
				</div>
				<div class="magazine-list-info columns-row col-7 ms-3" >
					<div class="container d-flex magazine-shop-info">
						<div class="mt-2 shop-name col-6">${aList.foodstore_name}</div>
						<div class="shop-category col-5">${aList.food_category}</div>
					</div>
					<div class="shop-tags mt-3 ms-3 col-12">#${aList.tag_age},
						#${aList.tag_gender}, #${aList.tag_store}</div>
					<div class="gogo">
						<p>dd</p>
					</div>
				</div>
				<!--  매거진 리스트 인포 -->
			</div>
			<!-- 매거진리스트바디-->
		</c:forEach>
	</div>
</body>
</html>
