<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:message code="label.editTitle" /></title>
<style type="text/css">
span {
	color: red;
	font-style: italic;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">

</head>

<body>
	<%-- action="${pageContext.request.contextPath}/admin/user/edit/${member.id}.htm" --%>

	<form:form method="post"
		action="${pageContext.request.contextPath}/admin/user/edit.htm"
		modelAttribute="member" class="form-login" style="margin:auto">

		<div>
			<input type="hidden" name="id" value="${member.id}">
		</div>
		<div>
			<input type="hidden" name="addeddate" value="${member.addeddate}">
		</div>
		<div>
			<label><s:message code="label.username" /></label> <input
				class="form-control" name="username" type="text"
				value="${member.username}">
			<form:errors path="username" />
		</div>

		<div>
			<label><s:message code="label.email" /></label> <input
				class="form-control" name="email" value="${member.email}"
				type="email">
			<form:errors path="email" />
		</div>

		<div>
			<label><s:message code="label.password" /></label> <input type="password"
				class="form-control" name="password" path="password"
				value="${member.password}">
			<form:errors path="password" />
		</div>

		<div>
			<label><s:message code="label.phone" /></label> <input type="number"
				class="form-control" name="tel" value="${member.tel}">
			<form:errors path="tel" />
		</div>

		<br>

		<div>
			<label class="mr-2"><s:message code="label.gender" /></label> <input
				type="radio" name="gender" value="0" class="ml-3"
				${member.gender==0?'checked':''} />
			<s:message code="label.male" />
			<input value="1" type="radio" name="gender" class="ml-3"
				${member.gender==1?'checked':''} />
			<s:message code="label.female" />
			<br>
		</div>

		<br>

		<div>
			<button class="btn btn-primary btn-lg">
				<s:message code="label.update" />
			</button>
		</div>

	</form:form>

</body>
</html>