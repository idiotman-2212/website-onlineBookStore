<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="utf-8">
<title>Sign In|Sign up</title>
<style type="text/css">
span {
	color: red;
	font-style: italic;
}
</style>
<script src="../js/jquery-1.9.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
</head>
<body class="body-login">
	<div class="login">
		<div class="col-ms-8 mx-auto">
			<form:form method="post" class="form-login" modelAttribute="member">
				<h1 class="center lb-login">
					<s:message code="label.forgotpassword" />
				</h1>
				<br>
				<div>
					<label><s:message code="label.email" /></label>
					<form:input type="email" class="form-control" placeholder="Email" path="email" />
					<form:errors path="email" />
				</div>

				<br>
				<br>

				<div class="center">
					<button class="btn btn-lg btn-primary">
						<s:message code="label.resetpw" />
					</button>
				</div>

				<br>

				<div class="center">
					<a class="btn-register"
						href="${pageContext.request.contextPath}/user/login.htm"><s:message
							code="label.login" /></a>
				</div>

				<br>

				<div class="center">
					<a class="btn-register"
						href="${pageContext.request.contextPath}/user/register.htm"><s:message
							code="label.regislink" /></a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>