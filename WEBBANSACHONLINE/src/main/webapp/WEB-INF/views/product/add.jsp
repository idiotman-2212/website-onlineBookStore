<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><s:message code="add_new_book" /></title>

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

<script type="text/javascript">
	function onDelete(username) {
		var seft = this;
		if (username) {
			swal(
					{
						title : "XÓA",
						text : "Bạn muốn xóa" + username
								+ " này ra khỏi hệ thông!",
						type : "warning",
						showCancelButton : true,
						confirmButtonColor : "#DD6B55",
						confirmButtonText : "Xóa",
						cancalButtonText : "Hủy",
						closeOnConfirm : false
					},
					function() {
						$
								.post(
										'${pageContext.request.contextPath}/admin/account/delete',
										{
											username : username
										},
										function(res) {
											console.log(res);
											swal(
													{
														title : 'THÔNG BÁO',
														type : res.errorCode == 0 ? 'success'
																: 'error',
														text : res.message
													}, function() {
														window.location
																.reload();
													}
											);
										});
					});
		}
	}
</script>
</head>
<body>
	<div class="login">
		<div class="col-ms-8 mx-auto">

			<form:form method="post" class="form-add-author"
				modelAttribute="product" enctype="multipart/form-data">

				<h1 class="center lb-login">
					<s:message code="add_new_book" />
				</h1>

				<br>

				<div>
					<form:input hidden="true" class="form-control" type="text"
						path="id" />
				</div>

				<div>
					<label><s:message code="name_book" /></label> <br>
					<form:input class="form-control" type="text" path="title" />
					<form:errors path="title" />
				</div>

				<div>
					<label><s:message code="isbn" /></label> <br>
					<form:input class="form-control" type="text" path="isbn" />
					<form:errors path="isbn" />
				</div>

				<div>
					<label><s:message code="price_book" /></label> <br>
					<form:input class="form-control" type="text" path="price" />
					<form:errors path="price" />
				</div>

				<div>
					<label><s:message code="page_book" /></label> <br>
					<form:input class="form-control" type="text" path="pages" />
					<form:errors path="pages" />
				</div>

				<div>
					<form:input hidden="true" path="imageUrl" />
				</div>

				<p>
					<label><s:message code="image_book" /></label> <br> <input
						type="file" name="f"  accept="image/png, image/jpeg">
					<form:errors path="imageUrl" />
				</p>

				<p>
					<button class="btn btn-lg btn-primary">
						<s:message code="btn_save_auth" />
					</button>
					<form:errors path="imageUrl" />
				</p>
				<c:if test="${name != null}">
					<img width="150px"
						src="${pageContext.request.contextPath}/images/${name}">

				</c:if>
				<br>

				<div class="center">
					<a class="btn btn-outline-success"
						href="${pageContext.request.contextPath}/admin/product/add.htm">
						<s:message code="label.rewrite" />
					</a> <a href="${pageContext.request.contextPath}/admin/products.htm"
						class="btn btn-outline-danger"> <s:message code="label.cancel" />
					</a>
				</div>

			</form:form>

		</div>
	</div>

</body>
