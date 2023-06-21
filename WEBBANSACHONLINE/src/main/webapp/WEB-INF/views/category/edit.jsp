<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:message code="title_update_category" /></title>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style type="text/css">
span {
	color: red;
	font-style: italic;
}
</style>
</head>
<body class="body-auth">
	<div class="login">
		<div class="col-ms-8 mx-auto">

			<form:form method="post" modelAttribute="obj" class="form-add-author">

				<h1 class="center lb-login">
					<s:message code="title_update_category" />
				</h1>

				<p>
					<label><s:message code="id_category" /></label>
					<form:input readonly="true" path="id" class="form-control"
						type="text" />
				</p>
				<p>
					<label><s:message code="name_category" /></label>
					<form:input path="name" class="form-control" type="text" />
					<form:errors path="name" />
				</p>
				<p>
					<label><s:message code="parent_category" /></label>
					<form:select path="parent" class="form-control" type="text">
						<form:options items="${map}" />
					</form:select>
				</p>
				<p>
					<button class="btn btn-primary">
						<s:message code="save_category" />
					</button>
				</p>
			</form:form>

		</div>
	</div>

</body>
</html>