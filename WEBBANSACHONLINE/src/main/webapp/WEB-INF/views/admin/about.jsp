<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/css.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
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
<body>
	<div class="container">
		<br> <img alt=""
			src="https://i.imgur.com/h0aHIXL.jpg" />

		<br>
		<div class="center">
			<h1 style="color: #ff3300;">GIỚI THIỆU</h1>
		</div>
		<div class="center">
			<p>
				<s:message code="about_us" />
			</p>
		</div>

		<%-- <div data-mesh-internal="true">
			<div id="mediairc2azfx3inlineContent-gridContainer"
				data-mesh-internal="true">
				<div data-packed="true"
					style="top:; bottom:; left:; right:; width: 980px; height: auto; position:; pointer-events: none"
					class="txtNew" id="comp-iobcwlcd">
					<h4 class="font_4"
						style="font-size: 89px; line-height: 1.1em; text-align: center;">
						<span style="color: #ff3300;"><span
							style="font-weight: bold;"><span
								style="font-family: libre baskerville, serif;">ABOUT US</span></span></span>
					</h4>
				</div>
				<div
					style="top:; bottom:; left:; right:; width: 447px; height: 286px; position:"
					title="" data-is-responsive="false" data-display-mode="fill"
					data-content-padding-horizontal="30"
					data-content-padding-vertical="30" data-exact-height="286"
					class="style-jncf3jq6" id="comp-j5oc06mn">
					<div style="width: 417px; height: 256px" id="comp-j5oc06mnlink"
						class="style-jncf3jq6link">
						<div class="style-jncf3jq6_wrap">
							<wix-image style="width:417px;height:256px;top:0;left:0"
								data-has-bg-scroll-effect=""
								data-image-info="{&quot;imageData&quot;:{&quot;type&quot;:&quot;Image&quot;,&quot;id&quot;:&quot;dataItem-j5oc06ow&quot;,&quot;metaData&quot;:{&quot;pageId&quot;:&quot;c1dmp&quot;,&quot;isPreset&quot;:false,&quot;schemaVersion&quot;:&quot;2.0&quot;,&quot;isHidden&quot;:false},&quot;title&quot;:&quot;&quot;,&quot;uri&quot;:&quot;e1d3ad_847e8795af444a0f9e1a019d67ca1c1e~mv2_d_5511_3761_s_4_2.jpg&quot;,&quot;description&quot;:&quot;&quot;,&quot;width&quot;:5511,&quot;height&quot;:3761,&quot;alt&quot;:&quot;IMG_1561.jpg&quot;,&quot;crop&quot;:{&quot;x&quot;:0,&quot;y&quot;:117,&quot;width&quot;:5511,&quot;height&quot;:3526},&quot;name&quot;:&quot;IMG_1561.jpg&quot;,&quot;displayMode&quot;:&quot;fill&quot;},&quot;containerId&quot;:&quot;comp-j5oc06mn&quot;,&quot;displayMode&quot;:&quot;fill&quot;}"
								id="comp-j5oc06mnimg" class="style-jncf3jq6img"> <img
								id="comp-j5oc06mnimgimage"
								style="object-position: 50% 50%; width: 417px; height: 256px; object-fit: cover"
								alt="IMG_1561.jpg" data-type="image" itemProp="image"
								src="https://s26162.pcdn.co/wp-content/uploads/2018/12/11-bookstores-6-three-lives-2.w710.h473.2x.jpg" /></wix-image>
						</div>
						<b class="style-jncf3jq6_one"></b><b class="style-jncf3jq6_two"></b><b
							class="style-jncf3jq6_three"></b>
					</div>
				</div>
				<div data-packed="true"
					style="top:; bottom:; left:; right:; width: 379px; height: auto; position:; pointer-events: none"
					class="txtNew" id="comp-k0dzwglv">
					<p class="font_7" style="font-size: 15px;">
						<span style="font-size: 15px;"><span
							style="font-style: normal;"><span
								style="font-family: helvetica-w01-roman, helvetica-w02-roman, helvetica-lt-w10-roman, sans-serif;"><span
									style="font-weight: 400;"><span style="color: #000d1a;">Jean
											Devine acquired the store in June of 2017.&nbsp; Prior to
											this, she spent 35 years in management, sales, and
											operations.&nbsp; She had dreamed of owning a bookstore for
											more than 20 years. When you visit us, it&#39;s likely that
											you&#39;ll also&nbsp;get to know her two dogs, Simon and
											Grace. &nbsp;</span></span></span></span></span>
					</p>
				</div>
				<div data-packed="true"
					style="top:; bottom:; left:; right:; width: 298px; height: auto; position:; pointer-events: none"
					class="txtNew" id="comp-iobdf2vm">
					<h5 class="font_5">
						<span style="color: #ff3300;"><span
							style="font-family: libre baskerville, serif;">The Garcia
								Street Crew</span></span>
					</h5>
				</div>
				<div data-border-width="6"
					style="transform-origin: center 3px; top:; bottom:; left:; right:; width: 430px; height: 6px; position:"
					class="style-j5o3he69" id="comp-j7lznkzw"></div>
				<div data-packed="false"
					style="top:; bottom:; left:; right:; width: 430px; height: auto; position:; min-height: 380px; pointer-events: none"
					data-min-height="380" class="txtNew" id="comp-iobdf2vq">
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: #000d1a;">Sierra Logan
							joined Garcia Street Books this past May.&nbsp; Sierra has over
							13 years of experience in the book industry.&nbsp; In pursuit of
							full stereotype adherence, she loves reading, drinking tea and
							hanging out with her cats (not to forget her dog and
							partner).&nbsp; She loves New Mexico and is honored to be one of
							your friendly neighborhood booksellers.</span>
					</p>
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: rgb(232, 229, 223);"><span
							class="wixGuard">​</span></span>
					</p>
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: #000d1a;">Caitlin Grann
							began working for Garcia Street Books in August.&nbsp;&nbsp;She
							is a doctoral candidate at UNM in the American Studies department
							where she studies the relationship between music, space and
							place.&nbsp;&nbsp;Caitlin loves spending time with her dog,
							Oblio, and making photographs with her Holga
							camera.&nbsp;&nbsp;Growing up, Caitlin visited the bookstore and
							she is thrilled to be a member of the crew.</span>
					</p>
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: rgb(232, 229, 223);"><span
							class="wixGuard">​</span></span>
					</p>
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: #000d1a;">Guillermo Tilley has been
							with the Garcia Street Books since 2018.&nbsp; Guillermo is our
							event specialist and web/social media guy.&nbsp; He is a coffee
							drinking, non-fiction loving, fly-fishing fanatic who loves
							books, indie bookstores and highly caffeinated&nbsp;coffee
							shops.&nbsp; He&#39;s the guy with the &quot;big smile&quot; who
							is always willing to help you find that perfect title.&nbsp;
							Guillermo lives with his partner Marilyn and their two cats.</span>
					</p>
				</div>
				<div data-packed="true"
					style="top:; bottom:; left:; right:; width: 240px; height: auto; position:; pointer-events: none"
					class="txtNew" id="comp-iobde76e">
					<h5 class="font_5">
						<span style="font-family: libre baskerville, serif;"><span
							style="color: r#ff3300;">Our Story</span></span>
					</h5>
				</div>
				<div data-border-width="6"
					style="transform-origin: center 3px; top:; bottom:; left:; right:; width: 259px; height: 6px; position:"
					class="style-j5o3he69" id="comp-iobd6ao1"></div>
				<div data-packed="false"
					style="top:; bottom:; left:; right:; width: 259px; height: auto; position:; min-height: 81px; pointer-events: none"
					data-min-height="81" class="txtNew" id="comp-j7lzf2wn">
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: #000d1a;">Garcia Street Books is a
							locally owned and operated bookshop that has been serving the
							Santa Fe community for over 25 years. The store&nbsp;is nestled
							in Santa Fe&#39;s east side.&nbsp;</span>
					</p>
				</div>
				<div
					style="top:; bottom:; left:; right:; width: 140px; height: 142px; position:"
					title="" data-is-responsive="false" data-display-mode="fill"
					data-content-padding-horizontal="0"
					data-content-padding-vertical="0" data-exact-height="142"
					class="ca1" id="comp-j5obubnq">
					<div style="width: 140px; height: 142px" id="comp-j5obubnqlink"
						class="ca1link">
						<wix-image style="width:140px;height:142px;top:0;left:0"
							data-has-bg-scroll-effect=""
							data-image-info="{&quot;imageData&quot;:{&quot;type&quot;:&quot;Image&quot;,&quot;id&quot;:&quot;dataItem-j5obubrw&quot;,&quot;metaData&quot;:{&quot;pageId&quot;:&quot;c1dmp&quot;,&quot;isPreset&quot;:false,&quot;schemaVersion&quot;:&quot;2.0&quot;,&quot;isHidden&quot;:false},&quot;title&quot;:&quot;&quot;,&quot;uri&quot;:&quot;e1d3ad_b33efad2bfe540aeae7d75738c76c7b7~mv2.png&quot;,&quot;description&quot;:&quot;&quot;,&quot;width&quot;:512,&quot;height&quot;:512,&quot;alt&quot;:&quot;&quot;,&quot;displayMode&quot;:&quot;fill&quot;},&quot;containerId&quot;:&quot;comp-j5obubnq&quot;,&quot;displayMode&quot;:&quot;fill&quot;}"
							id="comp-j5obubnqimg" class="ca1img"> <img
							id="comp-j5obubnqimgimage"
							style="object-position: 50% 50%; width: 140px; height: 142px; object-fit: cover"
							alt="" data-type="image" itemProp="image"
							src="https://static.wixstatic.com/media/e1d3ad_b33efad2bfe540aeae7d75738c76c7b7~mv2.png/v1/fill/w_140,h_140,al_c,usm_0.66_1.00_0.01,blur_3/e1d3ad_b33efad2bfe540aeae7d75738c76c7b7~mv2.png" /></wix-image>
					</div>
				</div>
				<div data-packed="true"
					style="top:; bottom:; left:; right:; width: 447px; height: auto; position:; pointer-events: none"
					class="txtNew" id="comp-iobde76i">
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: #000d1a;">The&nbsp;building
							houses&nbsp;three long time locally owned businesses; Garcia
							Street Books, Downtown Subscription and Bad Moon Apothecary. The
							shop thrives based on the loyal patronage of the
							neighborhood&rsquo;s full and part time residents and the flocks
							of visitors that frequent Santa Fe.</span>
					</p>
				</div>
				<div data-packed="true"
					style="top:; bottom:; left:; right:; width: 271px; height: auto; position:; pointer-events: none"
					class="txtNew" id="comp-iobdeswg">
					<h5 class="font_5" style="text-align: justify;">
						<span
							style="color: #ff3300; font-family: 'libre baskerville', serif;">Our
							Vision</span>
					</h5>
				</div>
				<div data-border-width="6"
					style="transform-origin: center 3px; top:; bottom:; left:; right:; width: 271px; height: 6px; position:"
					class="style-j5o3he69" id="comp-iobd7r87"></div>
				<div data-packed="false"
					style="top:; bottom:; left:; right:; width: 271px; height: auto; position:; min-height: 81px; pointer-events: none"
					data-min-height="81" class="txtNew" id="comp-j7lzgmzj">
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: #000d1a;">We strive to offer our
							patrons a place to physically connect &ndash; with the world,
							with ideas, and with the diverse, artistic and literary
							creativity available through the world of books.&nbsp;</span>
					</p>
				</div>
				<div
					style="top:; bottom:; left:; right:; width: 139px; height: 142px; position:"
					title="" data-is-responsive="false" data-display-mode="fill"
					data-content-padding-horizontal="0"
					data-content-padding-vertical="0" data-exact-height="142"
					class="ca1" id="comp-j5obubnj">
					<div style="width: 139px; height: 142px" id="comp-j5obubnjlink"
						class="ca1link">
						<wix-image style="width:139px;height:142px;top:0;left:0"
							data-has-bg-scroll-effect=""
							data-image-info="{&quot;imageData&quot;:{&quot;type&quot;:&quot;Image&quot;,&quot;id&quot;:&quot;dataItem-j5obubq6&quot;,&quot;metaData&quot;:{&quot;pageId&quot;:&quot;c1dmp&quot;,&quot;isPreset&quot;:false,&quot;schemaVersion&quot;:&quot;2.0&quot;,&quot;isHidden&quot;:false},&quot;title&quot;:&quot;&quot;,&quot;uri&quot;:&quot;e1d3ad_477ec85a7d864185bb3b15923c825a16~mv2.png&quot;,&quot;description&quot;:&quot;&quot;,&quot;width&quot;:150,&quot;height&quot;:150,&quot;alt&quot;:&quot;&quot;,&quot;crop&quot;:{&quot;x&quot;:2,&quot;y&quot;:0,&quot;width&quot;:146,&quot;height&quot;:150},&quot;displayMode&quot;:&quot;fill&quot;},&quot;containerId&quot;:&quot;comp-j5obubnj&quot;,&quot;displayMode&quot;:&quot;fill&quot;}"
							id="comp-j5obubnjimg" class="ca1img"> <img
							id="comp-j5obubnjimgimage"
							style="object-position: 50% 50%; width: 139px; height: 142px; object-fit: cover"
							alt="" data-type="image" itemProp="image"
							src="https://static.wixstatic.com/media/e1d3ad_477ec85a7d864185bb3b15923c825a16~mv2.png/v1/crop/x_2,y_0,w_146,h_150/fill/w_138,h_142,al_c,usm_0.66_1.00_0.01,blur_3/e1d3ad_477ec85a7d864185bb3b15923c825a16~mv2.png" /></wix-image>
					</div>
				</div>
				<div data-packed="true"
					style="top:; bottom:; left:; right:; width: 429px; height: auto; position:; pointer-events: none"
					class="txtNew" id="comp-iobdeswj">
					<p class="font_8" style="line-height: 1.5em; text-align: justify;">
						<span style="color: #000d1a;">We aim to provide an
							environment&nbsp;that fosters a sense of community, kinship and
							belonging &ndash; to not only support people in the exploration
							of diverse literary works but to create an place where the free
							exchange of ideas might take place.&nbsp; We look forward to
							building this with you!</span>
					</p>
				</div>
				<div id="mediairc2azfx3inlineContent-wedge-9"
					data-mesh-internal="true"></div>
			</div>
		</div> --%>

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
							<h3 class="text-white font-weight-bold mb-3">QUICK LINKS</h3>
							<ul>
								<li class="mb-3"><a href="about.htm">ABOUT US</a></li>
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
									href="mailto:cnpmptit@gmail.com"> phisuper2310@gmail.com</a></li>
								<li class="mb-3"><i class="fas fa-envelope-open"></i> <a
									href="mailto:cnpmptit@gmail.com"> tranvietanh1803@gmail.com</a></li>
								<li class="mb-3"><i class="fas fa-envelope-open"></i> <a
									href="mailto:cnpmptit@gmail.com"> dienchau45@gmail.com</a></li>
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