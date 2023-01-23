<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>Jimat - Food choice for you</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=903a4aeed7d052f1bba36783e3f8632e"
    ></script>
    <script defer src="${path}/resources/js/map.js"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous"
    />
    <script
      src="https://kit.fontawesome.com/edd4d6d779.js"
      crossorigin="anonymous"
    ></script>
    <link
      href="${path}/resources/css/main.css"
      type="text/css"
      rel="stylesheet"
    />
    <link
      href="${path}/resources/css/map.css"
      type="text/css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="body-wrap container col-12 column-row">
      <div class="row">
        <%-- 메인 메뉴 불러오기 --%>
        <jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
      </div>
	
      <div class="row">
        <div id="option">
          <form onsubmit="searchPlaces(); return false">
            <span>검색:</span>
            <input type="text" value="강남구" id="keyword" size="100" />
            <button type="submit">검색하기</button>
          </form>
        </div>
      </div>
      <div class="map_wrap">
        <div
          id="map"
          style="
            display: block;
            margin: 0 auto;
            width: 60%;
            height: 99%;
            position: relative;
            overflow: hidden;
          "
        ></div>

        <!-- 지도타입 컨트롤 div 입니다 -->
        <div class="custom_typecontrol radius_border">
          <span
            id="btnRoadmap"
            class="selected_btn"
            onclick="setMapType('roadmap')"
            >지도</span
          >
          <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">
            스카이뷰</span
          >
        </div>

        <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
        <div class="custom_zoomcontrol radius_border">
          <span onclick="zoomIn()"
            ><img
              src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
              alt="확대"
          /></span>
          <span onclick="zoomOut()"
            ><img
              src="http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
              alt="축소"
          /></span>
        </div>
      </div>
      <div id="menu_wrap" class="bg_white">
        <hr />
        <ul id="placesList"></ul>
        <div id="pagination"></div>
      </div>
    </div>
  </body>
</html>
