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
				<th>number</th>
				<th>seq_number</th>
				<th>writer_id</th>
				<th>write_date</th>
				<th>update_date</th>
				<th>content</th>
				<th>main_number</th>
				<th>read_count_number</th>
				<th>tag_number</th>
				<th>good_number</th>
				<th>upload_number</th>
			</tr>
			<tr>
				<td>${alist[status.index].review_number}</td>
				<td>${alist[status.index].review_seq_number}</td>
				<td>${alist[status.index].review_writer_id}</td>
				<td>${alist_write_date[status.index]}</td>
				<td>${alist_update_date[status.index]}</td>
				<td>${alist[status.index].review_content}</td>
				<td>${alist[status.index].review_main_number}</td>
				<td>${alist[status.index].review_read_count_number}</td>
				<td>${alist[status.index].review_tag_number}</td>
				<td>${alist[status.index].review_good_number}</td>
				<td>${alist[status.index].review_upload_number}</td>
			<tr>
		</table>
	</c:forEach>
</body>
</html>