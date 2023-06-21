<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DANH SÁCH TÁC GIẢ</title>
<style type="text/css">
span {
	color: red;
	font-style: italic;
}
</style>
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

<script type="text/javascript">
	$(document).ready(function() {
		$('#checkBoxAll').click(function() {
			if ($(this).is(":checked"))
				$('.checkboxId').prop('checked', true);
			else
				$('.checkboxId').prop('checked', false);
		});
	});
</script>
</head>
<body>
	<a href="${pageContext.request.contextPath}/admin/author/add.htm"
		class="btn btnprimary">Add</a>
	<div></div>
	<form method="post"
		action="${pageContext.request.contextPath}/admin/author/dels.htm">

		<input type="submit" value="Delete"
			onclick="return confirm('Are you sure you want to delete these authors?')" />
		<br /> ${error} <br />
		<table class="table table-hover border table-striped">
			<tr class="thead-dark">
				<th><input type="checkbox" id="checkBoxAll" /></th>
				<th>ID</th>
				<th>TÊN TÁC GIẢ</th>
				<th>SỬA</th>
				<th>XÓA</th>
			</tr>
			<c:forEach items="${list}" var="author">
				<tr>
					<td><input type="checkbox" class="checkboxId"
						value="${author.id}" name="authorIds"/></td>
					<td>${author.id}</td>
					<td>${author.name}</td>
					<td><a
						href="${pageContext.request.contextPath}/admin/author/edit/${author.id}.htm">
							<img src="${pageContext.request.contextPath}/images/edit.png"
							alt="Edit">
					</a></td>
					<td><a
						onclick="return confirm('Are you sure you want to delete ${author.name}?')"
						href="${pageContext.request.contextPath}/admin/author/del/${author.id}.htm">
							<img src="${pageContext.request.contextPath}/images/trash.png"
							alt="Delete">
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>

</body>
</html>