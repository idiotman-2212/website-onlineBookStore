<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.servletContext.contextPath}/js/jquery-1.9.1.min.js">
</script>

<script
	src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js">
</script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css">

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
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<link href="css/css2.css" rel="stylesheet" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.mySlides {
	display: none;
	margin-top: -5px;
}
.custom-button {
    background-color: #4CAF50; /* Màu nền */
    color: white; /* Màu chữ */
    border: none; /* Loại bỏ viền */
    padding: 10px 20px; /* Kích thước padding */
    font-size: 16px; /* Cỡ chữ */
    cursor: pointer; /* Chỉ số cho con trỏ */
    border-radius: 4px; /* Bo góc */
}

.custom-button:hover {
    background-color: #45a049; /* Màu nền khi di chuột qua */
}
</style>
</head>
<body>
<nav>
		<!-- <div class="container"> -->
		<jsp:include page="menu_user.jsp" />
		<!-- 	</div> -->
	</nav>
	<div class="container">
		<br>
		<header>
			<div>
				<img height="333" width="1100" class="mySlides header"
					src="${pageContext.servletContext.contextPath}/images/image1.png">
				<img class="mySlides" height="333" width="1100"
					src="${pageContext.servletContext.contextPath}/images/image2.jpg">
				<img class="mySlides" height="333" width="1100"
					src="${pageContext.servletContext.contextPath}/images/image4.jpg">
				<button class="custom-button w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
				<button class="custom-button w3-display-right" onclick="plusDivs(1)">&#10095;</button>
			</div>

			<script>
				var slideIndex = 1;
				showDivs(slideIndex);
				function plusDivs(n) {
					showDivs(slideIndex += n);
				}
				function showDivs(n) {
					var i;
					var x = document.getElementsByClassName("mySlides");
					if (n > x.length) {
						slideIndex = 1
					}
					if (n < 1) {
						slideIndex = x.length
					}
					for (i = 0; i < x.length; i++) {
						x[i].style.display = "none";
					}
					x[slideIndex - 1].style.display = "block";
				}
			</script>
		</header>



		<article>
			<br>
			<jsp:include page="${param.view}" />
		</article>

		<aside>
			<br>

			<h2 class="center lb-login">
				<s:message code="categories" />
			</h2>

			<ul>
				<c:forEach items="${category}" var="o">
					<c:if test="${o.parent eq 0}">
						<li>${o.name}</li>
						<ul>
							<c:forEach items="${category}" var="child">
								<c:if test="${child.parent eq o.id}">
									<li><a
										href="${pageContext.request.contextPath}/home/browse/${child.id}.htm">${child.name}</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</c:if>
				</c:forEach>
			</ul>


		</aside>

	</div>
	<div>
		<footer>
			<div class="w3l-middlefooter-sec">
				<div class="container py-md-5 py-sm-4 py-3">
					<div class="row footer-info w3-agileits-info">
						<!-- footer categories -->
						<!-- //footer categories -->
						<!-- quick links -->
						<div class="col-md-3 col-sm-6 footer-grids mt-sm-0 mt-4">
							<h3 class="text-white font-weight-bold mb-3">Quick Links</h3>
							<ul>
								<li class="mb-3"><a href="home/about.htm">ABOUT US</a></li>
								<li class="mb-3"><a href="contact.html">Contact Us</a></li>
								<li class="mb-3"><a href="help.html">Help</a></li>
								<li class="mb-3"><a href="faqs.html">Faqs</a></li>
								<li class="mb-3"><a href="terms.html">Terms of use</a></li>
								<li><a href="privacy.html">Privacy Policy</a></li>
							</ul>
						</div>
						<div class="col-md-3 col-sm-6 footer-grids mt-md-0 mt-4">
							<h3 class="text-white font-weight-bold mb-3">Get in Touch</h3>
							<ul>
								<li class="mb-3"><i class="fas fa-map-marker"></i> 97 Đường Man Thiện, Phường Hiệp Phú, Thành Phố Thủ Đức</li>
								<li class="mb-3"><i class="fas fa-mobile"></i> +84 988 919
									701</li>
								<li class="mb-3"><i class="fas fa-phone"></i> +84 365 899
									252</li>
								<li class="mb-3"><i class="fas fa-phone"></i> +84 326 917
									158</li>
								<li class="mb-3"><i class="fas fa-envelope-open"></i> <a
									href="mailto:phisuper2310@gmail.com"> phisuper2310@gmail.com</a></li>
								<li class="mb-3"><i class="fas fa-envelope-open"></i> <a
									href="mailto:tranvietanh1803@gmail.com"> tranvietanh1803@gmail.com</a></li>
								<li class="mb-3"><i class="fas fa-envelope-open"></i> <a
									href="mailto:dienchau45@gmail.com"> dienchau45@gmail.com</a></li>
							</ul>
						</div>
					</div>
					<!-- //quick links -->
				</div>
			</div>
		</footer>
	</div>
</body>
</html>