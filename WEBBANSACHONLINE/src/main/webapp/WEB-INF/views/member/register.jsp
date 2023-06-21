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
</head>
<body class="body-login">
	<div class="login">
		<div class="col-ms-8 mx-auto">

			<form:form modelAttribute="member" method="post"
				action="${pageContext.request.contextPath}/user/register.htm"
				class="form-login">
				<h1 class="center lb-login">
					<s:message code="label.register" />
				</h1>

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


				<div>
					<label class="mr-2"><s:message code="label.gender" /></label> <input
						type="radio" name="gender" value="0" checked class="ml-3">
					<s:message code="label.male" />
					<input value="1" type="radio" name="gender" class="ml-3">
					<s:message code="label.female" />
				</div>


				<div>
					<button class="btn btn-primary btn-lg">
						<s:message code="label.register" />
					</button>
				</div>

				<br>
				<div class="center">
					<a class="btn-register center" style="margin: 20"
						href="${pageContext.request.contextPath}/user/login.htm"><s:message
							code="label.login" /></a> <a class="btn-register "
						href="${pageContext.request.contextPath}/user/forgot.htm"><s:message
							code="label.forgotpassword" /></a>
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>