<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/board.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<style>
</style>
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

		<div class="wrap">

			<div class="board">
				<div class="boardtitle"></div>
				<div class="boardtitle2">
					<h1>Board</h1>
				</div>
				<div class="board-wrap">
					<div class="bs-example" data-example-id="striped-table">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>#</th>
									<th>분류</th>
									<th>글제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody class="inputdata">
								<c:forEach items="${boardlist}" var="boardList">
									<c:set var="i" value="${i+1}" />
									<tr>
										<td style="width: 5%">${i+pagevo.startNo}</td>
										<td style="width: 10%">${boardList.category}</td>
										<td class="board-title" style="width: 45%"><a
											id="board-title-a"
											href="<%=request.getContextPath()%>/board/detail?no=${boardList.no}"
											style="text-decoration: none; color: black;">${boardList.name }</a></td>
										<td style="width: 15%">${boardList.m_id }</td>
										<td style="width: 15%"><fmt:parseDate
												value="${boardList.r_date}" var="dateValue"
												pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
												pattern="yyyy-MM-dd" value="${dateValue}" /></td>
										<td style="width: 10%">${boardList.hit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="bottom-nav">
							
							<!-- 이부분은 페이지번호를 구현하기 위한 것이다. -->

							<div class="paging-box">
								<div class="paging">
									<c:if test="${pagevo.prev }">
										<a
											href="<%=request.getContextPath() %>/board?page=${pagevo.startPage-1}">[prev]</a>
									</c:if>
									<c:forEach begin="${pagevo.startPage }"
										end="${pagevo.endPage }" var="idx">
										<a href="<%=request.getContextPath() %>/board?page=${idx}">${idx }</a>
									</c:forEach>
									<c:if test="${pagevo.next }">
										<a
											href="<%=request.getContextPath() %>/board?page=${pagevo.endPage+1}">[next]</a>
									</c:if>
								</div>
							</div>
							<div id="btndiv">
								<input type="button" class="btn btn-outline-primary"
									id="writebt" value="글쓰기" onclick="location.href='write'">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="box">
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
										<label>ID</label> <input class="w3-input" type="text"
											name="id">
									</div>
									<div class="signup-menu">
										<label>Password</label> <input class="w3-input"
											type="password" name="pw">
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
		document.getElementById("main").style.marginLeft = "0%";
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
</html>