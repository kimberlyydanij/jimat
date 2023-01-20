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

<script defer src="${path}/resources/js/main.js"></script>

</head>

<body>
	<div class="header container d-flex col-12 mt-4" id="main-menu-body">
		<div class="logo col-2">

			<a href="javascript: main();"><img
				src="${path}/resources/images/logo.png" id="logo_img" /></a>
		</div>
		<div class="header-menu column-row col-10">
			<div class="row">
				<div class="login mt-3">
					<div class="row">
						<div class="login-button justify-content-end">
							<span> <c:choose>
									<c:when test="${empty sessionScope.sessionId}">
										<button type="button" class="btn btn-secondary btn-log" id="login"
											value="로그인" onclick="popup_login();">로그인</button>
									</c:when>
									<c:otherwise>
										<form method="post" class=login-button>				
										 	<a href="/logoutpage.do"> 
											<button type="button" class="btn btn-secondary btn-log" id="logout"
											value="로그아웃">로그아웃</button>	
											</a>
										</form>
									</c:otherwise>
								</c:choose>
							</span>
						</div>
					</div>
				</div>
				<nav class="navbar navbar-expand-lg navbar-mainmenu bg-warning col-10 mt-3">
					<div class="container-fluid">
						<div class="collapse navbar-collapse" id="navbarColor03">
							<ul class="navbar-nav me-auto">
								<li class="nav-item"><a class="nav-link main-home" 
									href="javascript: main();">Home </a></li>
								<li class="nav-item" ><a class="nav-link  menu-teamVita500" 
									href="javascript: teamVita500();">Team
										Vita500</a></li>
								<li class="nav-item"><a class="nav-link menu-curation"
									href="javascript: curation()">맛집추천</a></li>
							<!--  <li class="nav-item"><a class="nav-link menu-oneKmMap"
									href="javascript: oneKmMap()">반경1km</a></li> -->	
								<li class="nav-item menu-magazine"><a class="nav-link menu-magazine"
									href="javascript: magazine();">Magazine</a></li>
								<li class="nav-item"><a class="nav-link menu-myPage"
									href="javascript: myPage();">My Page</a></li>
								<li class="nav-item"><a class="nav-link menu-map"
									href="javascript: map();">임시_상세맵</a>
								</li>
							</ul>
							<form class="d-flex" onsubmit="searchPlaces(); return false">
								<input class="form-control me-sm-4" type="search"
									placeholder="검색어를 입력하세요" id="keyword" />
								<button class="btn btn-secondary my-2 my-sm-0" type="submit" >
								Search</button>		
							</form>
						</div>
					</div>
				</nav>
			</div>
		</div>
		</div>
		
		<script defer src="${path}/resources/js/map.js"></script>
</body>
</html>
