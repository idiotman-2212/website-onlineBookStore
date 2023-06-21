<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" charset="utf-8">
<title><s:message code="label.login" /></title>
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
	${message}

	<div class="login">
		<div class="col-ms-8 mx-auto">
			<form:form method="post" class="form-login" modelAttribute="member">
				<h1 class="center lb-login">
					<s:message code="label.login" />
				</h1>
				<br>

				<div>
					<label><s:message code="label.emailorphone" /></label>
					<form:input class="form-control" placeholder="Email" type="text"
						path="email" />
					<form:errors path="email" />
				</div>
				<div>
					<label style="margin-top: 10px;"><s:message code="label.password" /></label>
					<form:input class="form-control" placeholder="Password"
						type="password" path="password" />
					<form:errors path="password" />
				</div>
				<br>
				<div>
					<button class="btn btn-lg btn-primary">
						<s:message code="label.login" />
					</button>
				</div>
				<br>
				<div class="center">
					<a class="btn-register"
						href="${pageContext.request.contextPath}/user/register.htm"><s:message
							code="label.regislink" /></a>
				</div>
				<br>
				<div class="center">
					<a class="btn-register"
						href="${pageContext.request.contextPath}/user/forgot.htm"><s:message
							code="label.forgotpassword" /></a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>