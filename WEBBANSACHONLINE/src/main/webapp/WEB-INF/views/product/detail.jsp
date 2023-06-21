<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">


<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var pathname = window.location.pathname;
			/* alert(pathname); */
			var lang = $(this).attr("data-lang");
			$.get(pathname + "?language=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>

</head>
<body>
	<div class="products">
		<br>
		<div class="col-4">
			<img src="${pageContext.request.contextPath}/images/${o.imageUrl}"
				height="294px">
		</div>
		<div class="col-8">
			<h3>${o.title}</h3>
			<p>
				<s:message code="isbn" />
				: <b>${o.isbn}</b>
			</p>
			<p>
				<s:message code="page_book" />
				: <b>${o.pages}</b>
			</p>
			<p>
				<s:message code="price_book" />
				: <b>${o.price} VNĐ</b>
			</p>

			<form method="post"
				action="${pageContext.request.contextPath}/cart/add.htm">

				<input type="hidden" value="${o.id}" name="productId"> <input
					type="number" name="quantity" value="1"> <br>
				<button class="btn btn-primary mt-3">
					<s:message code="add_cart" />
				</button>
			</form>

			<br>
		</div>
		<br>
	</div>

</body>
</html>