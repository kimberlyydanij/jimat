<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
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
      src="https://kit.fontawesome.com/edd4d6d779.js"
      crossorigin="anonymous"
    ></script>
    <link
      href="${path}/resources/css/main.css"
      type="text/css"
      rel="stylesheet"
    />
    <link
      href="${path}/resources/css/curation.css"
      type="text/css"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="body-wrap container mb-2">
      <div class="card border-warning container mt-2" id="main-curation">
        <div class="row">
          <div class="a container d-flex">
            <div
              class="arrow col-1"
              style="transform: 'translate(-'+ (selected-1) * 300+ 'px, 0px)'"
            >
              <button id="arrow-left">
                <i class="fa-solid fa-angle-left fa-3x"></i>
              </button>
            </div>

            <div class="curation-body pb-3 col-11 container column-row">
              <div class="row">
                <div class="curation-title mt-3">#분위기</div>
              </div>

              <div class="row">
                <div class="shop-body container d-flex p-1">
                  <c:forEach items="${aList}" var="aList">
                    <div class="p-1 column-row">
                   	 <div class="shop-thumbnail-container" >
                      <a href="#">
                        <img src="${aList.img_url}" class="shop-thumbnail" }
                      /></a></div>
                      <div><p class="mt-2 shop-name">${aList.foodstore_name}</p></div>
                    </div>
                  </c:forEach>
                </div>
              </div>
            </div>

            <div
              class="arrow col-1"
              style="transform: 'translate(-'+ (selected-1) * 300+ 'px, 0px)'"
            >
              <button id="arrow-left">
                <i class="fa-solid fa-angle-right fa-3x"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
