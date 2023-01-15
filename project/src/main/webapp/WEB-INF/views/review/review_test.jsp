<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Jimat - Food choice for you</title>
<link href="/css/review.css" type="text/css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

	<form action="reviewform.do" method="post">
		<div class="card p-3 col-lg-9 mt-3" id="comment-body">
			<div class="comment-box-body column-row p-3">
				<div class="comment-box column-row mb-4 column-row">
					<div class="row" id="row1">
						<div class="comment-rating d-flex justify-content-between p-0">
							<div class="title m-0 p-0">
								<p>
								<h4>리뷰 작성하기</h4>
								</p>
							</div>
							<div class="rating flex-row-reverse ms-3">
								<input type="radio" name="rating" value="1" id="1" /> <label
									id="stars" for="1">☆</label> <input type="radio" name="rating"
									value="2" id="2" /> <label id="stars" for="2">☆</label> <input
									type="radio" name="rating" value="3" id="3" /> <label
									id="stars" for="3">☆</label> <input type="radio" name="rating"
									value="4" id="4" /> <label id="stars" for="4">☆</label> <input
									type="radio" name="rating" value="5" id="5" /> <label
									id="stars" for="5">☆</label>
							</div>
							<div class="comment-tag">
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<input type="checkbox" class="btn-check" name="btnradio"
										id="taste" autocomplete="off" /> <label
										class="btn btn-outline-danger" for="taste">#맛</label> <input
										type="checkbox" class="btn-check" name="btnradio" id="price"
										autocomplete="off" /> <label class="btn btn-outline-warning"
										for="price">#가격</label> <input type="checkbox"
										class="btn-check" name="btnradio" id="service"
										autocomplete="off" /> <label class="btn btn-outline-info"
										for="service">#서비스</label> <input type="checkbox"
										class="btn-check" name="btnradio" id="mood" autocomplete="off" />
									<label class="btn btn-outline-primary" for="mood">#분위기</label>
									<input type="checkbox" class="btn-check" name="btnradio"
										id="parking" autocomplete="off" /> <label
										class="btn btn-outline-success" for="parking">#주차</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="row2">
					<div class="comment-area p-0">
						<textarea class="form-control" name="review_content"
							placeholder="리뷰를 입력해주세요" rows="3"></textarea>
					</div>
				</div>
				<div class="row" id="row3">
					<div class="write-buttons mt-3 d-flex justify-content-center">
						<input class="form-control" type="file" id="formFile">
						<button class="btn btn-primary" id="comment-send">작성완료</button>
					</div>
				</div>
			</div>
		</div>
		<input type="text" name="review_writer_id"
			value="${sessionScope.sessionId}" hidden=hidden> <input
			type="text" name="review_foodstore_seq" value="2" hidden=hidden>
		<input type="text" name="review_good_number" value="0" hidden=hidden>
	</form>

	<p>${sessionScope.sessionId}</p>
	<c:set var="sessionid" value="${sessionScope.sessionId}" />
	<c:if test="${aList != null}">
		<c:forEach var="dto" items="${aList}" varStatus="status">
			<input type="text"
				id='review_foodstore_seq${dto.review_foodstore_seq}'
				name="review_foodstore_seq" value="${dto.review_foodstore_seq}"
				hidden=hidden>
			<input type="text" name="review_seq" value="${dto.review_seq}"
				hidden=hidden>
			<div class="card p-3 col-lg-9 mt-3"
				id="comment-body${aList[status.index].review_seq}">
				<div class="card p-3 justify-content-start mt-2">
					<div class="row">
						<div class="card-title">
							<div class="review_title" style="float: left">
								<h4>방문자 리뷰</h4>
							</div>
							<c:if test="${dto.review_writer_id == sessionid}">
								<div class="review_action_btn"
									style="float: right; margin-left: 10px;">
									<a href="review_delete.do?review_delete_num=${dto.review_seq}"><i
										class="fa-regular fa-square-xmark" alt="삭제"></i></a>
								</div>
								<div class="review_action_btn" style="float: right">
									<a
										href="review_update_form.do?review_edit_num=${dto.review_seq}"
										data-abc="true"><i class="fa fa-pencil fa-lg" alt="수정"></i></a>
								</div>
							</c:if>

						</div>
					</div>
					<div class="row">
						<div class="profile-body container">
							<div class="comment-widgets d-flex m-b-20">
								<div class="profile column-row mt-3">
									<div class="profile-image">
										<span class="round"><img
											src="/data/images/profile1.png" alt="user" width="80"
											id="user_profile_image${dto.review_seq}" /> </span>
									</div>
									<div class="comment-options mt-3 d-flex justify-content-center">

										<!-- 여기 하는 중 -->

										<div class="btn-group" role="group"
											aria-label="Basic checkbox toggle button group" id="i-heart">
											<input type="checkbox" class="btn-check" name="heart"
												autocomplete="off" /> <label class="btn-outline-danger"
												for="i-heart"> <i class="fa fa-heart fa-lg"> </i> </i>
											</label>
										</div>

										<!-- -->
										<p class="ms-1">5</p>
									</div>
								</div>
								<div class="comment-inside p-3 col-2">
									<div class="comment-info column-row">
										<div class="user_info">
											<span id="user_nickname${dto.review_seq}">${dto.review_writer_id}</span>
										</div>
										<div class="user-rating d-flex">
											<div class="rating flex-row-reverse">
												<input type="radio" name="rating" value="1" id="1" /><label
													for="1">☆</label> <input type="radio" name="rating"
													value="2" id="2" /><label for="2">☆</label> <input
													type="radio" name="rating" value="3" id="3" /><label
													for="3">☆</label> <input type="radio" name="rating"
													value="4" id="4" /><label for="4">☆</label> <input
													type="radio" name="rating" value="5" id="5" /><label
													for="5">☆</label>
											</div>
										</div>
										<div class="write_date">
											<span class="date" id="date${dto.review_seq}">${alist_write_date[status.index]}</span>
										</div>
										<div class="comment-tag mt-1 container flex-wrap:wrap">
											<button type="button" class="btn btn-danger">맛</button>
											<button type="button" class="btn btn-warning">가격</button>
										</div>
									</div>
								</div>
								<div class="comment-text mt-3">
									<p id="comment-text${dto.review_seq}">${dto.review_content}</p>
								</div>
							</div>
							<div class="row">
								<div class="container d-flex p-3">
									<div class="row">
										<div class="review-images col-3">
											<img src="/data/images/review_images1.jpg" />
										</div>
										<div class="review-images col-3">
											<img src="/data/images/review_images2.jpg" />
										</div>
										<div class="review-images col-3">
											<img src="/data/images/review_images3.jpg" />
										</div>
										<div class="review-images col-3">
											<img src="/data/images/review_images4.jpg" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>

	<div class="pagelist">
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage>1}">
			<a href="review_page.do?currentPage=${pv.startPage-pv.blockPage}">이전</a>
		</c:if>
		<!-- 이전 출력 끝 -->

		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<span> <c:url var="currPage" value="review_page.do">
					<c:param name="currentPage" value="${i}" />
				</c:url> <c:choose>
					<c:when test="${i==pv.currentPage}">
						<a href="${currPage}" class="pagecolor">${i}</a>
					</c:when>
					<c:otherwise>
						<a href="${currPage}">${i}</a>
					</c:otherwise>
				</c:choose>
			</span>
		</c:forEach>
		<!-- 페이지 출력 끝 -->

		<!-- 다음 출력 시작 -->
		<c:if test="${pv.endPage<pv.totalPage}">
			<a href="review_page.do?currentPage=${pv.startPage+pv.blockPage}">다음</a>
		</c:if>
		<!-- 다음 출력 끝 -->
	</div>
</body>
</html>