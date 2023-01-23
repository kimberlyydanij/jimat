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
	<link href="${path}/resources/css/curation.css" type="text/css"
	rel="stylesheet" />
<script defer src="${path}/resources/js/main.js"></script>
<!--   <script defer src="${path}/resources/js/gps.js"></script> -->
<script defer src="${path}/resources/js/map.js"></script>
</head>
  <body>
    <div class="body-wrap container mb-2 ms-3">
      <div class="card border-warning container mt-2 b" id="main-curation">
        <div class="row">
          <div class="a container d-flex">
            <div class="arrow col-1" onclick="img_scroll(3, 100);">
              <button id="arrow-left">
                <i class="fa-solid fa-angle-left fa-3x"></i>
              </button>
            </div>
 
            <div class="curation-body pb-3 col-11 container column-row">
              <div class="row">
                <c:forEach items="${aList3}" var="aList" begin="0" end="0">
	              <div class="curation-title mt-3">#${aList.food_category}</div>
	            </c:forEach>
              </div>

              <div class="row" id="row_container_3">
                <div class="shop-body container d-flex p-1">
                  <c:set var="count" value="0" />
                  <c:forEach items="${aList3}" var="aList">
                    <c:set var="count" value="${count+1}" />
                    <div class="p-1 column-row" id="shop-thumbnail-body-3-<c:out value="${count}" />">
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
              </div>
            </div>  
          
            <div class="arrow col-1">
              <button id="arrow-left" onclick="img_scroll(3, -100);">
                <i class="fa-solid fa-angle-right fa-3x"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
