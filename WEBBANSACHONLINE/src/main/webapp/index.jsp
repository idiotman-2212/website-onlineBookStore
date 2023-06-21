<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TRANG CHỦ</title>
</head>
<script type="text/javascript">
	function delayer(delay) {
		onLoad = setTimeout(
				'window.location.href = "${pageContext.servletContext.contextPath}/home/products/1.htm"',
				delay);
	}
</script>
<body>

</body>
</html>