<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집리스트 페이지</title>
</head>
<body>
	<table>
		<tr>
			<th>맛집이름</th>
		</tr>
		<!-- HttpRequestServelet 사용-->
<%-- 		<c:forEach items="${aList}" var="aList"> --%>
<!-- 			<tr> -->
<%-- 				<td><c:url var="path" value="detailpage.do"> --%>
<%-- 						<c:param name="res_num" value="${aList.res_num}" /> --%>
<%-- 					</c:url> <a href="${path}">${aList.foodstore_id}</a></td> --%>
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
		
		
		<!-- aList에 parameter값 받아서 적용 -->
		<c:forEach items="${aList}" var="aList">
			<tr>
				<td><c:url var="path" value="detailpage_aList.do">
						<c:param name="res_num" value="${aList.res_num}" />
					</c:url> <a href="${path}">${aList.foodstore_id}</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>