<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
span {
	color: red;
	font-style: italic;
}
</style>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</head>
<body>
	<h1 class="center lb-login">
		<s:message code="label.checkout" />
	</h1>
<%-- 
	<table class="table table-hover border table-striped">
		<tr class="thead-dark">
			<th>Title</th>
			<th>Quantity</th>
			<th>Price</th>
			<th>Image</th>
		</tr>
		<c:forEach items="${list}" var="o">
			<tr>
				<td>${o.title}</td>
				<td><input type="number" value="${o.quantity}" name="qty"
					class="qty"></td>
				<td>${o.price}</td>
				<td><img width="70px" src="${o.imageUrl}"></td>
			</tr>
		</c:forEach>
	</table> --%>
	
	<form:form modelAttribute="invoice" 
		action="${pageContext.request.contextPath}/cart/checkout.htm"
		class="form-login" style="margin:auto">
		<div>
			<label><s:message code="label.email" /></label>
			<form:input class="form-control" path="email" />
			<form:errors path="email" />
		</div>

		<div>
			<label><s:message code="label.phone" /></label>
			<form:input class="form-control" path="tel" />
			<form:errors path="tel" />
		</div>

		<div>
			<label><s:message code="label.address" /></label>
			<form:input class="form-control" path="address" />
			<form:errors path="address" />
		</div>

		<div>
			<button class="btn btn-info">
				<s:message code="label.order" />
			</button>
		</div>
		<%-- <div>
			<a href="${pageContext.request.contextPath}/cart/checkout.htm"
				class="btn btn-primary"></a>
		</div> --%>
	</form:form>

</body>
</html>