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
      href="${path}/resources/css/review.css"
      type="text/css"
      rel="stylesheet"
    />

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
  </head>
  <body>
    <div class="card p-3 container ms-2 mt-2" id="comment-body">
      <div class="comment-box-body col-11 column-row p-2">
        <div class="comment-box column-row mb-4 column-row">
          <div class="row" id="row1">
            <div class="comment-rating d-flex justify-content-between p-0">
              <div class="title m-0 mt-2 pt-1">
                <h4>리뷰 작성하기</h4>
              </div>
              <div class="rating flex-row-reverse ms-3 pt-2" id="write-rating">
                <input type="radio" name="rating" value="1" id="1" />
                <label id="stars" for="1">☆</label>
                <input type="radio" name="rating" value="2" id="2" />
                <label id="stars" for="2">☆</label>
                <input type="radio" name="rating" value="3" id="3" />
                <label id="stars" for="3">☆</label>
                <input type="radio" name="rating" value="4" id="4" />
                <label id="stars" for="4">☆</label>
                <input type="radio" name="rating" value="5" id="5" />
                <label id="stars" for="5">☆</label>
              </div>
              <div class="comment-tag">
                <div class="btn mt-0">
                  <input
                    type="checkbox"
                    class="btn-check"
                    name="btnradio"
                    id="taste"
                    autocomplete="off"
                  />
                  <label class="btn btn-outline-danger" for="taste">#맛 </label>
                  <input
                    type="checkbox"
                    class="btn-check"
                    name="btnradio"
                    id="price"
                    autocomplete="off"
                  />
                  <label class="btn btn-outline-warning" for="price"
                    >#가격</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    name="btnradio"
                    id="service"
                    autocomplete="off"
                  />
                  <label class="btn btn-outline-info" for="service"
                    >#서비스</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    name="btnradio"
                    id="mood"
                    autocomplete="off"
                  />
                  <label class="btn btn-outline-primary" for="mood"
                    >#분위기</label
                  >
                  <input
                    type="checkbox"
                    class="btn-check"
                    name="btnradio"
                    id="parking"
                    autocomplete="off"
                  />
                  <label class="btn btn-outline-success" for="parking"
                    >#주차</label
                  >
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row" id="row2">
          <div class="comment-area p-0">
            <textarea
              class="form-control"
              placeholder="리뷰를 입력해주세요"
              rows="3"
            ></textarea>
          </div>
        </div>
        <div class="row" id="row3">
          <div class="write-buttons mt-3 d-flex justify-content-center">
            <input class="form-control" type="file" id="formFile" />
            <button type="button" class="btn btn-primary" id="comment-send">
              작성완료
            </button>
          </div>
        </div>
      </div>

      <div class="card p-3 justify-content-start mt-2">
        <div class="row">
          <div class="card-title">
            <h4>방문자 리뷰</h4>
          </div>
        </div>
        <div class="row"></div>
      </div>
    </div>
  </body>
</html>
