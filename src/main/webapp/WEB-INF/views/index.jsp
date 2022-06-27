<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>

<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Isometric Grids | Demo 1 | Codrops</title>
<meta name="description"
	content="Decorative &amp; interactive isometric &amp; 3D grids." />
<meta name="keywords"
	content="isometric, grid, images, masonry, perspective" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="favicon.ico">
<link rel="stylesheet" type="text/css"
	href="resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="resources/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/component.css" />
<script src="resources/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<scripttk
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"> </script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<style>
.grid__img {
	transition: all 0.9s, color 0.3;
}

.grid__img :hover {
	box-shadow: 200px 0 0 0 rgba(0, 0, 0, 0.25) inset, -200px 0 0 0
		rgba(0, 0, 0, 0.25) inset;
	color: #fff;
}
</style>
<body class="demo-1">
	<!-- 헤더부분 -->
	<header>
		<div class="top-nav">
			<div id="nav-header">
				<button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>

				<div class="w3-sidebar w3-bar-block w3-border-right"
					style="display: none" id="mySidebar">
					<button onclick="w3_close()" class="w3-bar-item w3-large">Close
						&times;</button>
					<a href="#" class="w3-bar-item w3-button">Home</a> <a
						href="<%=request.getContextPath()%>/shop"
						class="w3-bar-item w3-button">PointShop</a> <a
						href="<%=request.getContextPath()%>/board"
						class="w3-bar-item w3-button">Board</a>
				</div>
			</div>
			<div id="nav-blank"></div>
			<c:set var="nowuser" value="${loginuser }" />
			<c:choose>
				<c:when test="${empty nowuser}">
					<div id="nav-login">Login</div>
					<div id="nav-signup">Sign up</div>
				</c:when>

			</c:choose>
			
		</div>
	</header>
	<main>
		


		<div id="headerwrap">
			<div class="banner">
				<div class="codrops-header">
					<h1>Subscribe Platform Service</h1>
					<p>You may subscribe yourself by clicking here.</p>

					<nav class="codrops-demos">

						<a id="addsub" onclick="addsub()">등록하기</a>
					</nav>

				</div>
			</div>

			<c:choose>
				<c:when test="${empty nowuser}">
					<div class="loginbox" id="loginbox">
						<div class="loginbox2">
							<div class="loginbox-title">

								<div class="loginbox-title2"></div>
								<div class="loginbox-xbox"></div>
							</div>
							<form action="<%=request.getContextPath()%>/login" method="post">
								<div class="logindata-form">
									<div class="login-blank"></div>
									<div class="logindata">
										<div class="login-id">
											<label>ID</label> <input class="w3-input" type="text"
												name="id">
										</div>
										<div class="login-pw">
											<label>Password</label> <input class="w3-input"
												type="password" name="pw">
										</div>
										<div class="login-submit">
											<div class="login-bt">
												<input class="w3-input" type="submit" value="Login">
											</div>
											<div class="bt-blank"></div>
											<div class="forgot-bt">
												<input class="w3-input" type="button" value="ID/PW 찾기">
											</div>
										</div>
									</div>
									<div class="login-blank"></div>
								</div>
							</form>
						</div>
					</div>
					<form action="<%=request.getContextPath()%>/signup" method="post">
						<div class="signupbox" id="signupbox">
							<div class="signupbox-title">

								<div class="signupbox-title2"></div>
								<div class="signupbox-xbox"></div>
							</div>
							<div class="signup-blank"></div>
							<div class="signup-datainput">

								<div class="signup-menu">
									<label>ID</label> <input class="w3-input" type="text" name="id">
								</div>
								<div class="signup-menu">
									<label>Password</label> <input class="w3-input" type="password"
										name="pw">
								</div>
								<div class="signup-menu">
									<label>Tel</label> <input class="w3-input" type="text"
										name="tel">
								</div>
								<div class="signup-menu">
									<label>Address</label> <input class="w3-input" type="text"
										name="addr">
								</div>
								<div class="signup-submit">
									<div class="submit-blank"></div>
									<div class="submit-blank2">
										<div class="blank2-blank"></div>
										<div class="submit-bt">
											<input class="w3-input" type="submit" value="회원가입">
										</div>
										<div class="blank2-blank"></div>
									</div>
								</div>

							</div>


						</div>
					</form>
				</c:when>
				<c:otherwise>

					<div class="logonbox">
						<div class="logonbox-datawrap">
							<div class="logonbox-data-img">
								<div class="logonbox-blank"></div>
								<div class="data-imgbox">
									<i class="xi-user xi-5x"></i>
								</div>
							</div>
							<div class="logonbox-datawrap2">
								<div class="logonbox-title">
									<h3>회원정보</h3>
								</div>
								<div class="logonbox-datawrap3">
									<div class="logonbox-datatitle">
										<div class="datatitle-id">
											<c:out value="${nowuser.id }" />
											님
										</div>
										<div class="datatitle-blank"></div>
										<div class="datatitle-point">포인트</div>
										<div class="datatitle-grade">등급</div>
									</div>
									<div class="logonbax-data">
										<div class="data-id">환영합니다.</div>
										<div class="data-blank"></div>
										<div class="data-point">
											<c:out value="${nowuser.point }" />
										</div>
										<div class="data-grade">
											<%
												String grade = (String) session.getAttribute("grade");
											%>
											<%=grade%>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="logonbox-btwrap">
							<div class="logonbox-btwrap2"></div>
							<div class="logonbox-btwrap3">
								<div class="logonbox-btwrap5">
									<div class="logonbox-btwrap4">
										<button>정보수정</button>
									</div>
									<div class="logonbox-btwrap4">
										<button>장바구니</button>
									</div>
									<div class="logonbox-btwrap4">
										<button onclick="location.href='logout'">로그아웃</button>
									</div>
								</div>
								<div class="logonbox-btwrap5">
									<div class="logonbox-btwrap4">
										<button>출석체크</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>

			</c:choose>

		</div>





		<div class="isolayer isolayer--scroll1 isolayer--shadow" id="gridmenu"
			style="margin-left: 15%; width: 100%;">
			<ul class="grid grid--effect-flip">
				<c:forEach items="${subList }" var="sublist">
					<li class="grid__item"><a class="grid__link"
						href=${sublist.r_url }> <img class="grid__img layer"
							src="resources/img/${sublist.fname }" alt="Canvas Dummy"
							style="width: 100%; height: 200px;" /> <img
							class="grid__img layer" src="resources/img/${sublist.fname }"
							alt="Wireframe Dummy" style="width: 100%; height: 200px;" /> <img
							class="grid__img layer" src="resources/img/${sublist.fname }"
							alt="01" style="width: 100%; height: 200px;" /> <span
							class="grid__title">${sublist.r_memo }</span>
					</a></li>
				</c:forEach>
				<c:forEach items="${subList }" var="sublist">
					<li class="grid__item"><a class="grid__link"
						href=${sublist.r_url }> <img class="grid__img layer"
							src="resources/img/${sublist.fname }" alt="Canvas Dummy"
							style="width: 100%; height: 200px;" /> <img
							class="grid__img layer" src="resources/img/${sublist.fname }"
							alt="Wireframe Dummy" style="width: 100%; height: 200px;" /> <img
							class="grid__img layer" src="resources/img/${sublist.fname }"
							alt="01" style="width: 100%; height: 200px;" /> <span
							class="grid__title">${sublist.r_memo }</span>
					</a></li>
				</c:forEach>
				<c:forEach items="${subList }" var="sublist">
					<li class="grid__item"><a class="grid__link"
						href=${sublist.r_url }> <img class="grid__img layer"
							src="resources/img/${sublist.fname }" alt="Canvas Dummy"
							style="width: 100%; height: 200px;" /> <img
							class="grid__img layer" src="resources/img/${sublist.fname }"
							alt="Wireframe Dummy" style="width: 100%; height: 200px;" /> <img
							class="grid__img layer" src="resources/img/${sublist.fname }"
							alt="01" style="width: 100%; height: 200px;" /> <span
							class="grid__title">${sublist.r_memo }</span>
					</a></li>
				</c:forEach>


			</ul>

		</div>
	</main>
	<a class="pater">
		<h2 class="pater__title">
			<img src="resources/img/PageCloud_logo.svg" />
		</h2>
		<p class="pater__desc">개발자 : 이명훈</p>

	</a>


	<script src="resources/js/imagesloaded.pkgd.min.js"></script>
	<script src="resources/js/masonry.pkgd.min.js"></script>
	<script src="resources/js/dynamics.min.js"></script>
	<script src="resources/js/classie.js"></script>
	<script src="resources/js/animOnScroll.js"></script>
	<script src="resources/js/main.js"></script>
	<script>
		(function() {
			function getRandomInt(min, max) {
				return Math.floor(Math.random() * (max - min + 1)) + min;
			}

			[].slice.call(document.querySelectorAll('.isolayer')).forEach(
					function(el) {
						new IsoGrid(el, {
							type : 'scrollable',
							transform : 'translateX(-15vw) translateY(275px) ',
							stackItemsAnimation : {
								properties : function(pos) {
									return {
										translateZ : (pos + 1) * 50,
										rotateZ : getRandomInt(-3, 3)
									};
								},
								options : function(pos, itemstotal) {
									return {
										type : dynamics.bezier,
										duration : 500,
										points : [ {
											"x" : 0,
											"y" : 0,
											"cp" : [ {
												"x" : 0.2,
												"y" : 1
											} ]
										}, {
											"x" : 1,
											"y" : 1,
											"cp" : [ {
												"x" : 0.3,
												"y" : 1
											} ]
										} ],
									//delay: (itemstotal-pos-1)*40
									};
								}
							},
							onGridLoaded : function() {
								classie.add(document.body, 'grid-loaded');
							}
						});
					});
		})();
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("headerwrap").style.marginLeft = "10%";
			document.getElementById("gridmenu").style.marginLeft = "25%";

		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("headerwrap").style.marginLeft = "0%";
			document.getElementById("gridmenu").style.marginLeft = "15%";
		}
		function addsub() {
			var popupWidth = 600;
			var popupHeight = 400;
			var windowssize = window.screen.width / 2;
			var windowssize2 = window.screen.height / 2;
			var popupwidthsize = popupWidth / 2;
			var popupheightsize = popupHeight / 2;
			var popupX = windowssize - popupwidthsize;
			var popupY = windowssize2 - popupheightsize;

			window.open('addSubscribe', '', 'status=no, height=' + popupHeight
					+ ', width=' + popupWidth + ', left=' + popupX + ', top='
					+ popupY);
		}

		$(document).ready(function() {
			$("#nav-login").click(function() {
				if ($("#loginbox").css('display') === 'none') {
					$("#signupbox").css("display", "none");
					$("#loginbox").css("display", "block");
				} else {
					$("#signupbox").css("display", "none");
					$("#loginbox").css("display", "none");
				}
			});
			$("#nav-signup").click(function() {
				if ($("#signupbox").css('display') === 'none') {
					$("#loginbox").css("display", "none");
					$("#signupbox").css("display", "block");
				} else {
					$("#signupbox").css("display", "none");
					$("#loginbox").css("display", "none");
				}
			});

		});
	</script>

</body>
</html>
