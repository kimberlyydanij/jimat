<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
    <script defer src="${path}/resources/js/main.js"></script>
  </head>
  <body>
    <div class="body-wrap container col-12 column-row">
      <div class="row">
      <%-- 메인 메뉴 불러오기 --%>
      <jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
      </div>
      <div class="row">
        <div class="main col-12 mt-2" id="main">
          <div class="main_image">
            <img src="${path}/resources/images/main_img1.png" />
          </div>
        </div>
      </div>
      <div class="row">
        <div class="card-container">
          <div
            class="card border-warning col-12 column-row mt-4"
            id="main-curation"
          >
            <div class="row">
              <div class="curation-body pb-2 container">
                <div class="row">
                  <div class="curation-title mt-3">#분위기</div>
                </div>
                <div class="row">
                  <div class="shop-body container d-flex p-1">
                    <div class="col-1" id="arrow">
                      <a href="#"
                        ><i class="fa-solid fa-angle-left fa-2x"></i>
                      </a>
                    </div>
                    <div class="col-2 p-1">
                      <a href="#"
                        ><img
                          src="${path}/resources/images/test-images/review_images1.jpg"
                          id="shop-thumbnail"
                      /></a>
                      <p class="mt-2 shop-name">업소명</p>
                    </div>
                    <div class="col-2 p-1">
                      <a href="#"
                        ><img
                          src="${path}/resources/images/test-images/review_images2.jpg"
                          id="shop-thumbnail"
                      /></a>
                      <p class="mt-2 shop-name">업소명</p>
                    </div>
                    <div class="col-2 p-1">
                      <a href="#"
                        ><img
                          src="${path}/resources/images/test-images/review_images3.jpg"
                          id="shop-thumbnail"
                      /></a>
                      <p class="mt-2 shop-name">업소명</p>
                    </div>
                    <div class="col-2 p-1">
                      <a href="#"
                        ><img
                          src="${path}/resources/images/test-images/review_images4.jpg"
                          id="shop-thumbnail"
                      /></a>
                      <p class="mt-2 shop-name">업소명</p>
                    </div>
                    <div class="col-2 p-1">
                      <a href="#"
                        ><img
                          src="${path}/resources/images/test-images/review_images4.jpg"
                          id="shop-thumbnail"
                      /></a>
                      <p class="mt-2 shop-name">업소명</p>
                    </div>
                    <div class="col-1" id="arrow">
                      <a href="#"
                        ><i class="fa-solid fa-angle-right fa-2x"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
