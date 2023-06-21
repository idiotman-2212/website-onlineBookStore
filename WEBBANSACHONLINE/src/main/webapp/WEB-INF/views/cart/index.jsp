<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:message code="cart_title" /></title>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
	<c:if test="${list.size()==0}">
		<br>

		<h1 class="center lb-login">
			<s:message code="order_empty" />
		</h1>
		<br>
		<br>
		<form:form class="center">
			<img src="${pageContext.request.contextPath}/images/cart_null.png">
		</form:form>
	</c:if>
	<c:if test="${list.size()!=0}">
		<table class="table table-bordered">
			<tr>
				<th><s:message code="name_book" /></th>
				<th><s:message code="quantity" /></th>
				<th><s:message code="price_book" /></th>
				<th><s:message code="image_book" /></th>
				<th><s:message code="del_book" /></th>
			</tr>
			<c:forEach items="${list}" var="o">

				<tr>
					<td>${o.title}</td>


					<td><input value="${o.quantity}" class="${o.productId}">

					</td>

					<td>${o.price} VNĐ</td>

					<td><img width="70px"
						src="${pageContext.request.contextPath}/images/${o.imageUrl}"></td>

					<td><a
						onclick="return confirm('Are you sure you want to delete this ${o.title} from cart?')"
						href="${pageContext.request.contextPath}/cart/del/${o.id}.htm">
							<img src="${pageContext.request.contextPath}/images/trash.png"
							alt="Delete" />
					</a></td>
				</tr>
			</c:forEach>
		</table>
		<p>
			<a href="${pageContext.request.contextPath}/cart/checkout.htm"
				class="btn btn-primary"><s:message code="label.checkout" /></a>
		</p>
		<script
			src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/btn_add.js"></script>
	</c:if>
</body>
</html>