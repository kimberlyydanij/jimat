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
<link href="${path}/resources/css/map.css" type="text/css"
	rel="stylesheet" />
<link href="${path}/resources/css/food.css" type="text/css"
	rel="stylesheet" />
<script defer src="${path}/resources/js/main.js"></script>
<!--   <script defer src="${path}/resources/js/gps.js"></script> -->
<script defer src="${path}/resources/js/map.js"></script>
<script defer src="${path}/resources/js/map.body.js"></script>
</head>
<body>

	<div class="body-wrap container col-12 column-row">
		<%-- 메인 메뉴 불러오기 --%>
		<div class="row">
			<jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
		</div>

		<%-- 메인 지도 불러오기 --%>
		<div class="map_wrap col-12 mt-2 ms-3">
			<div id="map"></div>
		</div>
		<!--   style="display: block; margin: 0 auto; width: 60%; height: 99%; position: relative; overflow: hidden;">-->

		<div class="shop-body col-12 container m-3">
			<!-- <c:out value="${fn:length(aList)}" /> -->
			<div class="row row-cols-2">
				<c:forEach var="aList" items="${aList}" varStatus="status" begin="1"
					end="10">
					<div class="shop-list-body col container d-flex p-2">

						<div class="row">

							<div class="shop-list-info cols-7 columns-row">
								<div class="row">
									<div class=" container d-flex">
										<div class="markerbg marker_">aaa</div>
										<div class="shop-list-title">
											<p class="shop-list-title">${aList.foodstore_name}<p>
										</div>
									</div>
								</div>
		
																	<p class="shop-list-category"> ${aList.food_category}</p>
								<p class="shop-list-address">${aList.address}</p>
								<p class="shop-list-phone">${aList.store_num}</p>
								<p class="shop-list-working">${aList.working_time}</p>
							</div>
						</div>
						<div class="shop-list-img cols-4">

							<c:url var="shopDetail_a" value="shopdetail.do">
							<c:param name="shopDetail_num" value="${aList.foodstore_id}" />
							</c:url>
							<a href="${shopDetail_a}"> <img src="${aList.img_url}"
									class="shop-thumbnail" /></a>
							
						</div>
					</div>
				
				</c:forEach>
			</div>
		</div>
	</div>
	<script defer src="${path}/resources/js/map.js"></script>
	<script type="text/javascript">
		//displayPlaces(<c:out value="${param.keyword}" />);
	</script>
</body>
</html>