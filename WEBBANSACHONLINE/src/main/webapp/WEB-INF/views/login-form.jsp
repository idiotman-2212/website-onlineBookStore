<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:message code="label.register" /></title>
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

<link href="${pageContext.servletContext.contextPath}/css/css3.css"
	rel="stylesheet" />

<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var pathname = window.location.pathname;
			var lang = $(this).attr("data-lang");
			$.get(pathname + "?language=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>
<body>
	<nav>
		<jsp:include page="menu_user.jsp" />
	</nav>

	<div class="container">

		<article>
			<jsp:include page="${param.view}" />
		</article>

	</div>
</body>
</html>