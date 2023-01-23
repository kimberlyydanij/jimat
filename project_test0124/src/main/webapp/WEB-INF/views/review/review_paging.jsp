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

	<div class="pagelist" style="text-align:center">
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage>1}">
			<a href="shopdetail.do?shopDetail_num=${review_foodstore_seq}?currentPage=${pv.startPage-pv.blockPage}">이전</a>
		</c:if>
		<!-- 이전 출력 끝 -->

		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<span> <c:url var="currPage" value="shopdetail.do?shopDetail_num=${review_foodstore_seq}">
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
			<a href="review_page.do?shopDetail_num=${review_foodstore_seq}?currentPage=${pv.startPage+pv.blockPage}">다음</a>
		</c:if>
		<!-- 다음 출력 끝 -->
	</div>
</body>
</html>