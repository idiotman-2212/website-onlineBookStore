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


</head>
<body>
	<div class="products">

		<c:if test="${list.size()==0}">
			<br>

			<h1 class="center lb-login">
				<s:message code="no_search" />
			</h1>
			<br>
			<br>
			<form:form class="center">
				<img
					src="${pageContext.request.contextPath}/images/search_not_found.png">
			</form:form>
		</c:if>
		<c:forEach var="o" items="${list}">
			<div class="col-4">
				<div class="item">
					<img alt="${o.title}" height="294px"
						src="${pageContext.request.contextPath}/images/${o.imageUrl}">
					<div class="info">
						<a
							href="${pageContext.request.contextPath}/home/product/detail/${o.id}.htm">${o.title}</a>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="clear"></div>
	</div>

</body>
</html>