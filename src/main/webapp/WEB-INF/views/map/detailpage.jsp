<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLDecoder" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>${foodstore_name}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<link href="css/main.css" type="text/css" rel="stylesheet" />
<link href=css/shopDetail.css " type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=952441bca7c2877c20d98599bb8b06bd&amp;libraries=LIBRARY"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/main/4.4.8/kakao.js"></script>
</head>
<body>
	<div class="body-wrap container col-12 column-row">
		<div class="row">
			<div class="shop-detail-wrap col-12 mt-2 ms-3 column-row"
				id="shop-detail-wrap">
				<div class="row">
					<div class="shop-detail-header container d-flex">
						<div
							class="col-9 container shop-left column-row py-2 px-0 ms-0 me-0">
							<div class="shop-main-image">
								<img src='${img_url}' id="shop-main-image" />
							</div>
							<div class="shop-info-body column-row p-4">
								<div class="row">
									<div class="shop-info d-flex">
										<div class="shop-name col-7 pe-3">
											<!-- 업소 이름 -->
											<p id="shop-name">${foodstore_name}</p>
										</div>
										<div class="col-3 shop-category">
											<!-- 1차/2차 카테고리 -->
											<p id="shop-category">${food_category}</p>

										</div>
										<div class="d-flex col-2" id='div-shop-rating'>
											<div>
												<p id="shop-rating">${rate}</p>
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
										<p id="shop-address">${address}</p>
										<p id="shop-phone">${store_num}</p>
									</div>
									<div class="shop-etc">
										<p id="shop-close">${working_time}</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-4 shop-right column-row p-2 mx-0">
							<div class="shop-map" id="staticMap"></div>
							<div class="shop-menu column-low mt-3 p-3" id="shop-menu">
								<div class="row">
									<p id="shop-menu" style="text-align: center">메뉴</p>
								</div>
								<div class="d-flex">
									<div class="col-9" id="shop-menu-detail">
										<c:forTokens var="item" items="${menu_namesearch}" delims=",">
											<p style=" text-overflow:ellipsis;  overflow:hidden;  white-space:nowrap; margin: 0px; text-align: left;font-size: 1rem;">${item}</p>
										</c:forTokens>
									</div>
									<div class="col-3" id="shop-menu-price">
										<c:forTokens var="item" items="${menu_pricesearch}" delims="/">
											<p style="margin: 0px; text-align: right;font-size: 1rem;">${item}</p>
										</c:forTokens>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var lat = '${latitude}';
		var lng = '${longitude}';
	</script>
	<script src=js/detail_page.js></script>
</body>
</html>
