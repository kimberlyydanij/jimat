<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="review_dto" value="${review_dto}" />
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
<script>
	$(document).ready(
			function() {
				
				let review_radio_list= $('input[type=radio]');
				
				let review_tag_point = '<c:out value = "${review_dto.review_tag}" />';

				
				for(let i=0; i<review_radio_list.length; i++){
					if(review_radio_list.eq(i).attr('value') == review_tag_point) {
						review_radio_list.eq(i).attr('checked', 'checked');
					};
				};
				
				let review_rating_point = '<c:out value = "${review_dto.review_rating}" />';
				
				for(let i=0; i<review_radio_list.length; i++){
					if(review_radio_list.eq(i).attr('value') == review_rating_point) {
						review_radio_list.eq(i).attr('checked', 'checked');
					};
				};
				
				$('#comment-send').click(
						function() {
							$('[name=review_content]').val(
									$('[name=review_content]').val().replace(
											/\n/gi, '<br>'));
							$('#frm').attr('action', 'review_update.do')
									.submit();
						});
				$('#formFile').change(function() {
					if (this.files[0].size > 1000000000) {
						alert('1GB 이하만 첨부할 수 있습니다.');
						$('#formFile').val('');
						return false;
					}
				});
				
			});
</script>
</head>
<body>
	<form id="frm" method="post" enctype="multipart/form-data">
		<div class="card p-3 col-11 mt-5 review-update-body" id="comment-body">
			<div class="comment-box-body column-row p-3">
				<div class="comment-box column-row mb-4 column-row">
					<div class="row" id="row1">
						<div class="comment-rating d-flex justify-content-between p-0">
							<div class="title m-0 p-0">
								<h4>리뷰 작성하기</h4>
							</div>
							<div class="rating flex-row-reverse ms-3">
								<input type="radio" name="review_rating" value="5" id="5" /> <label
									id="stars" for="5">☆</label> <input type="radio"
									name="review_rating" value="4" id="4" /> <label id="stars"
									for="4">☆</label> <input type="radio" name="review_rating"
									value="3" id="3" /> <label id="stars" for="3">☆</label> <input
									type="radio" name="review_rating" value="2" id="2" /> <label
									id="stars" for="2">☆</label> <input type="radio"
									name="review_rating" value="1" id="1" /> <label id="stars"
									for="1">☆</label>
							</div>
							<div class="comment-tag">
								<div class="btn-group" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="review_tag"
										id="taste" autocomplete="off" value="맛" /> <label
										class="btn btn-outline-danger" for="taste">#맛</label> <input
										type="radio" class="btn-check" name="review_tag" id="price"
										autocomplete="off" value="가격" /> <label
										class="btn btn-outline-warning" for="price">#가격</label> <input
										type="radio" class="btn-check" name="review_tag" id="service"
										autocomplete="off" value="서비스" /> <label
										class="btn btn-outline-info" for="service">#서비스</label> <input
										type="radio" class="btn-check" name="review_tag" id="mood"
										autocomplete="off" value="분위기" /> <label
										class="btn btn-outline-primary" for="mood">#분위기</label> <input
										type="radio" class="btn-check" name="review_tag" id="parking"
										autocomplete="off" value="주차" /> <label
										class="btn btn-outline-success" for="parking">#주차</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="row2">
					<div class="comment-area p-0">
						<textarea class="form-control" name="review_content" rows="3">${review_dto.review_content}</textarea>
					</div>
				</div>
				<div class="row" id="row3">
					<div class="write-buttons mt-3 d-flex justify-content-center">
						<input class="form-control" type="file" id="formFile"
							name="filename" accept="image/jpg,image/png,image/jpeg">
						<button class="btn btn-primary" id="comment-send">수정완료</button>
					</div>
				</div>
			</div>
		</div>
		<input type="text" name="review_writer_id"
			value="${review_dto.review_writer_id}" hidden=hidden> <input
			type="text" name="review_seq" value="${review_dto.review_seq}"
			hidden=hidden> <input type="text" name="review_foodstore_seq"
			value="${review_dto.review_foodstore_seq}" hidden=hidden>
	</form>
</body>
</html>