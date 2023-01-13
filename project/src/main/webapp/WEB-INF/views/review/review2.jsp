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
	<form action="reviewlist2.do" method="post">
		<input type="text" name="review_seq" placeholder="리뷰 번호를 입력하세요">
		<input type="submit" value="검색">
	</form>
	
	<c:set var="dto" value="${list_review_number}" />
	<c:set var="date" value="${alist_write_date}" />
	
	<c:if test="${list_review_number != null}">
		<form name="#frm" id="#frm">
			<div class="card p-3 col-lg-9 mt-3" id="comment-body">
				<div class="card p-3 justify-content-start mt-2">
					<div class="row">
						<div class="card-title">
							<h4>방문자 리뷰</h4>
						</div>
					</div>
					<div class="row">
						<div class="profile-body container">
							<div class="comment-widgets d-flex m-b-20">
								<div class="profile column-row mt-3">
									<div class="profile-image">
										<span class="round"><img
											src="/data/images/profile1.png" alt="user" width="80"
											id="user_profile_image" /> </span>
									</div>
									<div class="comment-options mt-3 d-flex justify-content-center">

										<div class="action-icons">
											<a href="#" data-abc="true" id="edit${aList[status.index].review_seq}"><i
												class="fa fa-pencil fa-lg" id="edit${aList[status.index].review_seq}" alt="수정"></i></a>
										</div>

										<!-- 여기 하는 중 -->

										<div class="btn-group" role="group"
											aria-label="Basic checkbox toggle button group" id="i-heart">
											<input type="checkbox" class="btn-check" name="heart"
												id="i-heart" autocomplete="off" /> <label
												class="btn-outline-danger" for="i-heart"> <i
												class="fa fa-heart fa-lg"> </i> </i>
											</label>
										</div>

										<!-- -->
										<p class="ms-1">5</p>
									</div>
								</div>
								<div class="comment-inside p-3 col-2">
									<div class="comment-info column-row">
										<div class="user_info" id="user_nickname">
											<span id="user_nickname">${aList[status.index].review_writer_id}</span>
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
											<span class="date" id="date">${alist_write_date[status.index]}</span>
										</div>
										<div class="comment-tag mt-1 container flex-wrap:wrap">
											<button type="button" class="btn btn-danger">맛</button>
											<button type="button" class="btn btn-warning">가격</button>
										</div>
									</div>
								</div>
								<div class="comment-text mt-3">
									<p id="comment-text">${aList[status.index].review_content}</p>
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
		</form>
	</c:if>
</body>
</html>