<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRANG CHỦ</title>

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
	<c:if test="${list.size()==0}">
		<br>
			<h1 class="center lb-login">
				<s:message code="order_empty" />
			</h1>
			<br>
			<form:form class="center">
				<img
					src="${pageContext.request.contextPath}/images/product_empty.png">
			</form:form>
		</c:if>
		<c:forEach var="o" items="${list}">
			<div class="col-4">
				<div class="item">
					<a
						href="${pageContext.request.contextPath}/home/product/detail/${o.id}.htm">
						<img class="img-product" alt="${o.title}" height="294px"
						src="${pageContext.request.contextPath}/images/${o.imageUrl}">
					</a>
					<div class="info">

						<a
							href="${pageContext.request.contextPath}/home/product/detail/${o.id}.htm">${o.title}</a>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="clear"></div>
	</div>
	<ul class="pagination">
		<c:forEach begin="1" end="${pageNum}" step="1" var="i">
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/home/products/${i}.htm">${i}</a>
			</li>
		</c:forEach>
	</ul>
</body>
</html>