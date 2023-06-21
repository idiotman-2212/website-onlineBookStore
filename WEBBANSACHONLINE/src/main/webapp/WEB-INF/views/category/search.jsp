<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form class="form-search" method="get"
	action="${pageContext.request.contextPath}/chapter6/home/search.html">
	<input type="text" placeholder="Search Something ..." name="q">
	<button class="btn btn-primary">SEARCH</button>
</form>
<div class="products">
	<c:forEach var="o" items="${list}">
		<div class="col-4">
			<div class="item">
				<img alt="${o.title}"
					src="${pageContext.request.contextPath}/upload/${o.imageUrl}">
				<div class="info">
					<a
						href="${pageContext.request.contextPath}/chapter6/home/detail.html/${o.id}">${o.title}</a>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="clear"></div>
</div>