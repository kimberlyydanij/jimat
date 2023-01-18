<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>

<link href="${path}/resources/css/main.css" type="text/css"
	rel="stylesheet" />
<link href="${path}/resources/css/shopDetail.css" type="text/css"
	rel="stylesheet" />

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=952441bca7c2877c20d98599bb8b06bd&amp;libraries=library"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/main/4.4.8/kakao.js"></script>
<script>
var shopLati="<c:out value="${adto.latitude}" />";
var shopLong="<c:out value="${adto.longitude}" />";
</script>

<script defer src="${path}/resources/js/main.js"></script>

</head>

<body>
	<c:set var="adto" value="${adto}" />
	<div class="body-wrap container col-12 column-row">
		<div class="row">
			<%-- 메인 메뉴 불러오기 --%>
			<jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
		</div>

            <%-- shop-detail wrap --%>
		<div class="row">
			<div class="shop-detail-wrap col-12 mt-2 ms-3 column-row"
				id="shop-detail-wrap">
				<div class="row">
					<div class="shop-detail-header container d-flex">
            <%-- shop-left --%>
						<div class="col-9 container shop-left column-row py-2 px-0 ms-0 me-0">
							<div class="shop-main-image">
								<img src="${adto.img_url}"/>
							</div>
							<div class="shop-info-body column-row p-4">
								<div class="row">
									<div class="shop-info d-flex">
										<div class="shop-name col-7 pe-3">
											<!-- 업소 이름 -->
											<p id="shop-name"><c:out value="${adto.foodstore_name}"/></p>
										</div>
										<div class="col-3 shop-category">
											<!-- 1차/2차 카테고리 -->
											<p id="shop-category"><c:out value="${adto.food_category}"/></p>
										</div>
										<div class="d-flex col-2" id='div-shop-rating'>
											<div>
												<p id="shop-rating"><c:out value="${adto.rating}"/></p>
											</div>
											<div class="bookmark p-2">
												<input type="checkbox" class="btn-check" id="shop-bookmark"
													autocomplete="off" /> <label class="btn btn-bookmark"
													for="shop-bookmark"><i
													class="fa-solid fa-heart fa-2x"></i> </label>
											</div>
										</div>
									</div>
								</div>
								<div class="shop-info-detail d-flex mt-1">
									<div class="shop-address">
										<p id="shop-address"><c:out value="${adto.address}"/></p>
										<p id="shop-phone"><c:out value="${adto.store_num}"/></p>
									</div>
									<div class="shop-etc">
										<p id="shop-close"><c:out value="${adto.working_time}"/></p>
								</div>
							</div>
						</div>
					</div>

                    <%-- shop-right --%>
                    <div class="col-3 container shop-right column-row py-2 px-0 ms-0 me-0">
							<div class="shop-map" id="staticMap"></div>
							<div class="shop-menu column-low mt-3 p-3" id="shop-menu">
								<div class="row">
									<p id="shop-menu">메뉴</p>
								</div>
								<div class="d-flex">
									<div class="col-9" id="shop-menu-detail">
										<c:forTokens items="${adto.menu_NameSearch}" delims="," var="menu"> 
										 <p id="shop-menu-detail">
											${menu}
										</p>
										</c:forTokens></div>
									<div class="col-3" id="shop-menu-price">
										<c:forTokens items="${adto.menu_PriceSearch}" delims="/" var="price"> 
										 <p id="shop-menu-detail">
											${price}
										</p>
										</c:forTokens>
									</div>
								</div>
							</div>
						</div>
			</div>
		</div>
</div>
	<div class="row m-0">
		<%-- 리뷰 불러오기 --%>
		<jsp:include page="/WEB-INF/views/mainPage/review.jsp"></jsp:include>
	</div>

	</div>
	<script defer src="${path}/resources/js/shopDetailMap.js?v=2"></script>
</body>
</html>
