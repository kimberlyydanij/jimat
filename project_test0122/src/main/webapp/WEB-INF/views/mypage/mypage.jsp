<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>Jimat - Food choice for you</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/edd4d6d779.js"
	crossorigin="anonymous"></script>
<link href="${path}/resources/css/main.css" type="text/css"
	rel="stylesheet" />
<link href="${path}/resources/css/mypage.css" type="text/css"
	rel="stylesheet" />
<script defer src="${path}/resources/js/main.js"></script>
<!--   <script defer src="${path}/resources/js/gps.js"></script> -->
<script defer src="${path}/resources/js/imgscroll.js?v=19"></script>
<script>
	$(document).ready(function() {
		alert("load on");
		$('#edit').click(function() {
			alert("check");
			$('#update_div').html('<input type="text" id="update_input" maxlength="8" style="width:130px;"/>');
			alert($('#update_div').attr("id"));
			$('#edit').html('<button type="button" data-abc="true" id="update_button"><i class="fa fa-pencil fa-lg"></i></button>');
			alert($('#update_button').attr("id"));
			alert("check2");
		});
		
		$('#update_button').click(function() {
			alert("update_div.val() : " + $('#update_div').val());
			$.ajax({
				type:"post",
				url:"kakao_update.do",
				data: {k_id : '$<c:out value="${sessionScope.sessionId}" />',
					k_nickname : $('#update_div').val()},
				success:function(){
					alert("수정 성공");
				}
			})		
		});
	});
</script>
</head>
<body>
	<div class="body-wrap container col-12 column-row">
		<%-- 메인 메뉴 불러오기 --%>
		<div class="row">
			<jsp:include page="/WEB-INF/views/mainPage/mainMenu.jsp"></jsp:include>
		</div>
		<%-- my-page --%>
		<c:choose>
			<c:when test="${!empty sessionScope.sessionId}">
				<div class="row">
					<div class="mypage-main col-8 container d-flex mt-2"
						id="mypage-main">
						<div class="mypage-body col-6 container column-row me-2">
							<div class="row">
								<p>내 정보</p>
								<hr />
							</div>
							<div class="mypage-profile p-4 my-2">
								<c:choose>
									<c:when test="${!empty sessionScope.session_image}">
										<img class="my-4" src="${sessionScope.session_image}" />
									</c:when>
									<c:otherwise>
										<img class="my-4"
											src="${path}/resources/images/test-images/profile1.png" />
									</c:otherwise>
								</c:choose>
								<div class="row container d-flex mt-2">
									<div class="col-4">
										<p>닉네임</p>
									</div>
									<div class="container column-row col-8 m-0 p-0">
										<div class="container d-flex">
											<div id="update_div" class="mypage-name col-10 m-0 p-0">${sessionScope.session_nickname}</div>
											<div class="action-icons col-2">
												<button type="button" data-abc="true" id="edit"><i
													class="fa fa-pencil fa-lg"></i></button>
											</div>
										</div>
										<div class="mypage-join-type ms-2">카카오톡 계정으로 가입</div>
									</div>
								</div>
							</div>
							<div class="container d-flex mt-4">
								<div class="col-6  mypage-withdrawal">
									<form action="kakao_delete.do" method="post">
										<input type="submit" value="회원탈퇴" />
									</form>
								</div>
								<div class="col-6 mypage-logout">
									<form action="logoutpage.do">
										<input type="submit" value="로그아웃" />
									</form>
								</div>
							</div>
						</div>

						<%-- mybookmark --%>
						<div class="mybookmark-body col-6 container column-row ms-2">
							<div class="row">
								<p class="mybookmark-body-title">내가 찜한 맛집</p>
								<hr />
							</div>
							<div class="mybookmark-wrap mt-2 p-0">
								<div class="mybookmark-container d-flex py-3 my-2">
									<div class="mybookmark-img col-3 m-0 p-0">
										<img
											src="${path}/resources/images/test-images/review_images1.jpg">
									</div>
									<div class="mybookmark-shopinfo col-8 ps-2">
										<p class="mybookmark-shopinfo mt-2">가게이름</p>
										<p class="mybookmark-shopinfo-cate">카테고리</p>
									</div>
									<div class="mybookmark-shopbookmark col-2 p-0 m-0">
										<input type="checkbox" class="btn-check" id="shop-bookmark1"
											autocomplete="off" /> <label
											class="btn btn-bookmark m-0 p-0" for="shop-bookmark1"><i
											class="fa-solid fa-heart fa-2x"> </i> </label>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<p>로그인 시 이용할 수 있는 페이지입니다.</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
