<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/btn_add.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
	<br>

	<h1 class="center lb-login">
		<s:message code="list_order_detail" />
	</h1>
	<br>
	<form>
		<table class="table table-hover border  table-bordered ">
			<tr class="table-info">
				<th >ID</th>
				<th>Product ID</th>
				<th>Title</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Image</th>
			</tr>
			<c:forEach items="${list}" var="o">

				<tr>

					<td>${o.id}</td>

					<td>${o.productId}</td>

					<td>${o.title}</td>

					<td>${o.quantity}</td>

					<td><fmt:formatNumber value="${o.price}" type="currency" /></td>

					<td><img width="70px"
						src="${pageContext.request.contextPath}/images/${o.imageUrl}"></td>

				</tr>
			</c:forEach>
		</table>

	</form>
</body>
</html>
