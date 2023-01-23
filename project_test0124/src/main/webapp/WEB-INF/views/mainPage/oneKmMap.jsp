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
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<link href="${path}/resources/css/main.css" type="text/css"
	rel="stylesheet" />
<script defer src="${path}/resources/js/oneKmMap.js"></script>
<script defer src="${path}/resources/js/main.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=952441bca7c2877c20d98599bb8b06bd&amp;libraries=LIBRARY"></script>
<script charset="UTF-8"
	src="https://t1.daumcdn.net/mapjsapi/js/main/4.4.8/kakao.js"></script> 
</head>
<body>
	<div class="body-wrap container col-12 column-row">
		<div class="row">
			<%-- 메인 메뉴 불러오기 --%>
			<jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
		</div>
		<%-- 지도 메인 불러오기 --%>
		<div class="row">
			<div class="main container col-12 column-row mt-2 ms-3">
				<div class="main-body containercol-md-12 d-flex">
					<div class="main-menu col-2 ms-2">
						<div class="title container d-flex mt-4">
							<div class="title-bullet"
								style="background-color: rgb(251, 201, 68);"></div>
							<div id="title">이용자층</div>
						</div>
						<ul class="people-group mt-2">
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="age-10" /> 10대
									</label>
								</div>
							</li>
							<li>
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="age-20" /> 20대
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="age-30" /> 30대
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="age-40" /> 40대
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="age-50" /> 50대
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="age-60" /> 60대
									</label>
								</div>
							</li>
						</ul>
						<ul class="gender-group d-flex mt-1">
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="radio" id="male" name="gender" />
										남성
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="radio" id="female" name="gender" />
										여성
									</label>
								</div>
							</li>
						</ul>
						<div class="hr col-9">
							<hr />
						</div>
						<div class="title container d-flex mt-2">
							<div class="title-bullet"
								style="background-color: rgb(234, 99, 99);"></div>
							<div id="title">카테고리</div>
						</div>
						<ul class="category-group d-flex mt-2">
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-delivery" />
										배달
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-meal" /> 밥집
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-cafe" /> 카페
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-pub" /> 술집
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-gogi" /> 고기
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-seafood" />
										횟집
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-korean" />
										한식
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-china" /> 중식
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-japan" /> 일식
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-west" /> 양식
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-buffet" />
										부페
									</label>
								</div>
							</li>
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="cate-snack" /> 분식
									</label>
								</div>
							</li>
						</ul>
						<div class="hr col-9">
							<hr />
						</div>
						<div class="title container d-flex mt-2">
							<div class="title-bullet"
								style="background-color: rgb(10, 199, 206);"></div>
							<div id="title">편의시설</div>
						</div>
						<ul class="convenience-group d-flex mt-2">
							<li class="filter-button">
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="conve-parking" />
										주차
									</label>
								</div>
							</li>
							<li>
								<div class="filter-button-click-container">
									<label> <input type="checkbox" id="conve-valet" /> 발렛
									</label>
								</div>
							</li>
					</div>

					<div class="map-body column-row col-10 ms-2">
						<div class="map-main" id="map"></div>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
