<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions"%>
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
      crossorigin="anonymous"
    />
    <script
      src="https://code.jquery.com/jquery-3.6.3.min.js"
      integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://kit.fontawesome.com/edd4d6d779.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=952441bca7c2877c20d98599bb8b06bd"
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
    <link
      href="${path}/resources/css/food.css"
      type="text/css"
      rel="stylesheet"
    />
    <script defer src="${path}/resources/js/main.js"></script>
    <!--   <script defer src="${path}/resources/js/gps.js"></script> -->
    <script defer src="${path}/resources/js/map.js"></script>
  </head>
  <body>
    <div class="body-wrap container col-12 column-row">
      <%-- 메인 메뉴 불러오기 --%>
      <jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
    </div>

    <div class="map_wrap col-12 container">
      <div id="map"></div>

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
    
      <div class="menu_wrap">
        <ul id="placesList">
          <div class="row row-cols-2 shop-list justify-content-between">
            <c:forEach
              var="aList"
              items="${aList}"
              varStatus="status"
              begin="1"
              end="14"
            >
              <div class="shop-list-body col container d-flex p-0 mb-3">
                <div class="row">
                  <div class="shop-list-info cols-7 columns-row">
                      <div class="container d-flex">
                        <div class='row'>
                        <div
                          class="markerbg marker_<c:out value='${status.count}'/>"
                          id="marker_<c:out value='${status.count}'/>"
                        ></div>
                        <div class="shop-list-title">
                          <p class="shop-list-title">${aList.foodstore_name}</p>
                        </div> 
                    </div>
                    <div></div>
                        <p class="shop-list-category">${aList.food_category}</p>
                        <p class="shop-list-address">${aList.address}</p>
                        <p class="shop-list-phone">${aList.store_num}</p>
                        <p class="shop-list-working">${aList.working_time}</p>
                  </div>
                  <!--end shop-list-info-->
                </div>
                <!-- end row -->
                <div class="shop-list-img cols-4">
                  <c:url var="shopDetail_a" value="shopdetail.do">
                    <c:param
                      name="shopDetail_num"
                      value="${aList.foodstore_id}"
                    />
                  </c:url>
                  <a href="${shopDetail_a}">
                    <img src="${aList.img_url}" class="shop-thumbnail"
                  /></a>
                </div>
                <!--  end shop list-img -->
              </div>
              <!--  end shop list body -->
            </div></c:forEach>
          </div>
        </ul>
      </div>
      <div id="pagination"></div>
    </div>

    <script defer src="${path}/resources/js/map.js"></script>
    <script type="text/javascript">
      //displayPlaces(<c:out value="${param.keyword}" />);
    </script>
  </body>
</html>
