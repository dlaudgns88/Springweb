<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/top-nav-form.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="demo-1">
	<main>
		<div class="top-nav">
			<div id="nav-header">

				<button class="w3-button w3-teal w3-xlarge" onclick="w3_open()">☰</button>

				<div class="w3-sidebar w3-bar-block w3-border-right"
					style="display: none" id="mySidebar">
					<button onclick="w3_close()" class="w3-bar-item w3-large">Close
						&times;</button>
					<a href="<%=request.getContextPath()%>/"
						class="w3-bar-item w3-button">Home</a> <a
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
	</main>

</body>
<script>
	function w3_open() {
		document.getElementById("mySidebar").style.display = "block";
		document.getElementById("headerwrap").style.marginLeft = "10%";
		document.getElementById("gridmenu").style.marginLeft = "10%";

	}

	function w3_close() {
		document.getElementById("mySidebar").style.display = "none";
		document.getElementById("headerwrap").style.marginLeft = "0%";
		document.getElementById("gridmenu").style.marginLeft = "0%";
	}
</script>
</html>