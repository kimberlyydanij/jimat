<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Jimat - Food choice for you</title>
<link href="resources/css/review.css" type="text/css" rel="stylesheet" />
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
	<p>sessionId = ${sessionScope.sessionId}</p>
	<c:set var="sessionid" value="${sessionScope.sessionId}" />
	<c:if test="${aList != null}">
		<c:forEach var="dto" items="${aList}" varStatus="status">
			<form method="post" enctype="multipart/form-data">
				<input type="text"
					id='review_foodstore_seq${dto.review_foodstore_seq}'
					name="review_foodstore_seq" value="${dto.review_foodstore_seq}"
					hidden=hidden> <input type="text" name="review_seq"
					value="${dto.review_seq}" hidden=hidden>
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
										<c:url var="currReview_del" value="review_delete.do">
											<c:param name="review_delete_num" value="${dto.review_seq}" />
										</c:url>
										<a href="${currReview_del}"><i
											class="fa-regular fa-square-xmark" alt="삭제"></i></a>
									</div>
									<div class="review_action_btn" style="float: right">
										<c:url var="currReview_upt" value="review_update_form.do">
											<c:param name="review_edit_num" value="${dto.review_seq}" />
										</c:url>
										<a href="${currReview_upt}" data-abc="true"><i
											class="fa fa-pencil fa-lg" alt="수정"></i></a>
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
										<div
											class="comment-options mt-3 d-flex justify-content-center">

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
												<c:choose>
													<c:when test="${dto.review_tag == '맛'}">
														<button type="button" class="btn btn-danger">맛</button>
													</c:when>
													<c:when test="${dto.review_tag == '가격'}">
														<button type="button" class="btn btn-warning">가격</button>
													</c:when>
													<c:when test="${dto.review_tag == '서비스'}">
														<button type="button" class="btn btn-info">서비스</button>
													</c:when>
													<c:when test="${dto.review_tag == '분위기'}">
														<button type="button" class="btn btn-primary">분위기</button>
													</c:when>
													<c:otherwise>
														<button type="button" class="btn btn-success">주차</button>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
									<div class="comment-text mt-3">
										<p id="comment-text${dto.review_seq}">${dto.review_content}</p>
									</div>
								</div>
								<c:if test="${!empty dto.review_upload}">
									<div class="row">
										<div class="container d-flex p-3">
											<div class="row">
												<div class="review-images col-3">
													<img src="resources/images/reviews/${dto.review_upload}" />
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</form>
		</c:forEach>
	</c:if>

</body>
</html>