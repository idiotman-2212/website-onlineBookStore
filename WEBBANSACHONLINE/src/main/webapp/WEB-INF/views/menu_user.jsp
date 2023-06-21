<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var lang = $(this).attr("data-lang");
			$.get("home/about.htm?language=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>

<a href="${pageContext.servletContext.contextPath}/home/products/1.htm"
	class="btn btn-primary ml-5"><s:message code="home_t" /></a>

<a href="${pageContext.servletContext.contextPath}/home/about.htm"
	class=" btn btn-primary"><s:message code="about" /></a>

<a href="#" data-lang="en" class="btn btn-primary"><s:message
		code="label.en" /></a>

<a href="#" data-lang="vi" class=" btn btn-primary"><s:message
		code="label.vi" /></a>


<c:if test="${memberLoginForm == null}">
	<a href="${pageContext.servletContext.contextPath}/user/login.htm"
		class="btn btn-primary"><s:message code="label.login" /></a>

	<a href="${pageContext.servletContext.contextPath}/user/register.htm"
		class="btn btn-primary"><s:message code="label.register" /></a>
</c:if>

<c:if test="${memberLoginForm != null}">
	<a href="${pageContext.servletContext.contextPath}/user/edit.htm"
		class="btn btn-primary"><s:message code="edit_user" /></a>

	<a href="${pageContext.servletContext.contextPath}/user/logout.htm"
		class="btn btn-primary"><s:message code="label.logout" /></a>

	<a href="${pageContext.servletContext.contextPath}/user/invoices.htm"
		class="btn btn-primary"><s:message code="label.order" /></a>

</c:if>

<a href="${pageContext.servletContext.contextPath}/cart/index.htm"
	class="btn btn-primary"> <img width="32px"
	src="${pageContext.request.contextPath}/images/cart.png"> <c:if
		test="${cartNumber != 0}">
		<span class='badge badge-warning' id='lblCartCount'>${cartNumber}</span>
	</c:if>
</a>

<form class="form-search mr-5" method="get"
	action="${pageContext.request.contextPath}/home/search.htm">
	<input type="text" placeholder="<s:message code="search" /> Something ..." name="q">
	<button class="btn btn-danger"><s:message code="search" /></button>
</form>