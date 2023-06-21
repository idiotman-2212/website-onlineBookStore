<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In|Sign up</title>
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
<body class="body-create-employee">

	<div class="login">
		<div class="col-ms-8 mx-auto">

			<form:form modelAttribute="member" method="post"
				action="${pageContext.request.contextPath}/admin/user/add.htm"
				class="form-create-employee">
				<h1 class="center lb-login">
					<s:message code="label.newstaff" />
				</h1>
				<br>

				<div>
					<label><s:message code="label.username" /></label>
					<form:input placeholder="User name" class="form-control"
						type="text" path="username" />
					<form:errors path="username" />
				</div>

				<div>
					<label><s:message code="label.email" /></label>
					<form:input type="email" class="form-control" placeholder="Email"
						path="email" />
					<form:errors path="email" />
				</div>

				<div>
					<label><s:message code="label.password" /></label>
					<form:input class="form-control" type="password"
						placeholder="Password" path="password" />
					<form:errors path="password" />
				</div>

				<div>
					<label><s:message code="label.phone" /></label>
					<form:input type="number" class="form-control" placeholder="Phone"
						path="tel" />
					<form:errors path="tel" />
				</div>

				<br>

				<div>
					<label class="mr-2"><s:message code="label.gender" /></label> <input
						type="radio" name="gender" value="0" checked class="ml-3">
					<s:message code="label.male" />
					<input value="1" type="radio" name="gender" class="ml-3">
					<s:message code="label.female" />
					<br>
				</div>

				<br>

				<div>
					<button class="btn btn-primary btn-lg">
						<s:message code="label.createacc" />
					</button>
				</div>

				<br>

				<div class="center">
					<a class="btn btn-outline-success"
						href="${pageContext.request.contextPath}/admin/user/add.htm">
						<s:message code="label.rewrite" />
					</a> <a href="${pageContext.request.contextPath}/admin/users.htm"
						class="btn btn-outline-danger"> <s:message
							code="label.cancel" />
					</a>
				</div>

				<br>
			</form:form>
		</div>
	</div>

</body>
</html>