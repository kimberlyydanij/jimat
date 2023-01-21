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

		<img src="${path}/resources/images/magazinemain.png">

		<div class="row">
			<div class="magazine-body col-12 ms-3 d-flex">
				<div class="row">
					<div class="magazine-item" id="korean-drink">
						<a href="#"><img
							src="${path}/resources/images/korean-drink.png"></a>
					</div>
					<div class="magazine-item" id="garosu">
						<a href="#"><img src="${path}/resources/images/garosu.png"></a>
					</div>
				</div>
				<div class="row">
					<div class="6 magazine-item" id="macandcheese">
						<a href="#"><img
							src="${path}/resources/images/macandcheese
				.png"></a>
					</div>
					<div class="6 magazine-item" id="porkcutlet">
						<a href="#"><img src="${path}/resources/images/porkcutlet.png"></a>
					</div>
				</div>
			</div>
		</div>


		<!-- 
              <div class="row">
                <c:forEach items="${aList}" var="aList" begin="0" end="0">
	              <div class="category-tag mt-3">#${aList.foodcategory}</div>
	            </c:forEach>
              </div>

              <div class="row" id="row_container_0">
                <div class="shop-body container d-flex p-1">
                  <c:set var="count" value="0" />
                  <c:forEach items="${aList}" var="aList">
                    <c:set var="count" value="${count+1}" />
                    <div class="p-1 column-row" id="shop-thumbnail-body-0-<c:out value="${count}" />">
                   	 <div class="shop-thumbnail-container" >
                   	 <c:url var="shopDetail_a" value="shopdetail.do">
                   	 	<c:param name="shopDetail_num" value="${aList.foodstore_id}" />
                   	 </c:url>
                      <a href="${shopDetail_a}">
                        <img src="${aList.img_url}" class="shop-thumbnail" /></a></div>
                      <div><p class="mt-2 shop-name">${aList.foodstore_name}</p></div>
                    </div>
                  </c:forEach>
                </div>
  -->

	</div>
	</div>
</body>
</html>