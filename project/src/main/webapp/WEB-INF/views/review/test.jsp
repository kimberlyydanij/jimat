<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, th, td {
	font_size: x-small;
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>

	<c:forEach var="dto" items="${alist}" varStatus="status" >
		<table>
			<tr>
				<th>review_seq</th>
				<th>review_writer_id</th>
				<th>review_write_date</th>
				<th>review_content</th>
				<th>review_foodstore_seq</th>
				<th>review_good_number</th>
			</tr>
			<tr>
				<td>${alist[status.index].review_seq}</td>
				<td>${alist[status.index].review_writer_id}</td>
				<td>${alist_write_date[status.index]}</td>
				<td>${alist[status.index].review_content}</td>
				<td>${alist[status.index].review_foodstore_seq}</td>
				<td>${alist[status.index].review_good_number}</td>
			<tr>
		</table>
	</c:forEach>
</body>
</html>