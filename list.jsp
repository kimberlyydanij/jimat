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
		<c:forEach items="${aList}" var="dto">
			<tr>
				<td><c:url var="path" value="detailpagemap.do">
						<c:param name="latitude" value="${dto.latitude}" />
						<c:param name="longitude" value="${dto.longitude}" />
					</c:url> <a href="${path}">${dto.res}</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>