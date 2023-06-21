<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:message code="home" /></title>

<script
	src="${pageContext.servletContext.contextPath}/js/jquery-1.9.1.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">

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
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<link href="${pageContext.servletContext.contextPath}/css/css3.css"
	rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none;
	margin-top: -5px;
}
</style>

</head>
<body>

	<nav>
		<jsp:include page="menu_user.jsp" />
	</nav>
	<div class="container">
		<br>

		<article>
			<br>
			<jsp:include page="${param.view}" />
		</article>

	</div>
</body>
</html>