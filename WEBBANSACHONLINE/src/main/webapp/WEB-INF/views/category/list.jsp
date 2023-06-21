<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DANH SÁCH THỂ LOẠI</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js">
</script>
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
	<a href="${pageContext.request.contextPath}/admin/category/add.htm"
		class="btn btnprimary">Add</a>
	<div></div>
	<form method="post"
		action="${pageContext.request.contextPath}/admin/category/dels.htm">

		<input type="submit" value="Delete"
			onclick="return confirm('Are you sure you want to delete these category?')" />
		<br /> ${error} <br />
		<table class="table table-hover border table-striped">
			<tr class="thead-dark">
				<th><input type="checkbox" id="checkBoxAll" /></th>
				<th>ID</th>
				<th>TÊN LOẠI</th>
				<th>SỬA</th>
				<th>XÓA</th>
			</tr>
			<c:forEach items="${list}" var="category">
				<tr>
					<td><input type="checkbox" class="checkboxId"
						value="${category.id}" name="categoryIds" /></td>
					<td>${category.id}</td>
					<td>${category.name}</td>
					<td><a
						href="${pageContext.request.contextPath}/admin/category/edit/${category.id}.htm">
							<img src="${pageContext.request.contextPath}/images/edit.png"
							alt="Edit">
					</a></td>
					<td><a
						onclick="return confirm('Are you sure you want to delete ${category.name}?')"
						href="${pageContext.request.contextPath}/admin/category/del/${category.id}.htm">
							<img src="${pageContext.request.contextPath}/images/trash.png"
							alt="Delete">
					</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>

</body>
</html>