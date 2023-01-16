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
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
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
    <script defer src="${path}/resources/js/imgscroll.js?v=19"></script>
  </head>
  <body>
    <div class="body-wrap container col-12 column-row">
      <%-- 메인 메뉴 불러오기 --%>
      <div class="row">
      <jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
      </div>
      <%-- 메인 이미지 불러오기 --%>
      <div class="row">
        <div class="main col-12 mt-2 ms-3"  id="main">
          <div class="main_image">
            <img src="${path}/resources/images/main_img1.png" />
          </div>
        </div>
      </div>
      <%-- 큐레이션 불러오기 --%>
      <div class="row">
      <jsp:include page="/WEB-INF/views/curation/curationrow.jsp"></jsp:include>
      </div>  
      
  </body>
</html>
