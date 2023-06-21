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
</c:if>

<!--  employee-->
<a href="${pageContext.servletContext.contextPath}/admin/authors.htm"
	class="btn btn-primary"><s:message code="authors" /></a>

<a href="${pageContext.servletContext.contextPath}/admin/categories.htm"
	class="btn btn-primary"><s:message code="categories" /></a>

<!-- Admin -->
<c:if test="${roleLogin.getId() == 1}">
	<a href="${pageContext.servletContext.contextPath}/admin/users.htm"
		class="btn btn-primary"><s:message code="users" /></a>
</c:if>

<a href="${pageContext.servletContext.contextPath}/admin/products.htm"
	class="btn btn-primary"><s:message code="products" /></a>
