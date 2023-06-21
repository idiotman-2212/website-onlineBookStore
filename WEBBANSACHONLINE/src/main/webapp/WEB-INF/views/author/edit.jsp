<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:message code="titleAuthor" /></title>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">

</head>
<body>
	<div class="login">
		<div class="col-ms-8 mx-auto">

			<form method="post" class="form-login">
				<h1 class="center lb-login">
					<s:message code="titleAuthor" />
				</h1>

				<div>
					<label><s:message code="id_author" /></label> <input
						class="form-control" type="text" readonly="true" name="name"
						value="${o.id}">
				</div>

				<br>

				<div>
					<label><s:message code="name_author" /></label> <input
						class="form-control" type="text" name="name" value="${o.name}">
				</div>

				<br>

				<div class="center">
					<button class="btn btn-lg btn-primary">
						<s:message code="btn_save_auth" />
					</button>
				</div>

			</form>
		</div>
	</div>
</body>
</html>