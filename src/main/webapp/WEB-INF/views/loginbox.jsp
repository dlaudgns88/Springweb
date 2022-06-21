<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="resources/css/loginbox.css">	
</head>
<body>
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
									<label>ID</label> <input class="w3-input" type="text" name="id">
								</div>
								<div class="login-pw">
									<label>Password</label> <input class="w3-input" type="password"
										name="pw">
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
							<label>Tel</label> <input class="w3-input" type="text" name="tel">
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

</body>
<script>
$(document).ready(function() {
	$("#nav-login").click(function() {
		if($("#loginbox").css('display')==='none')	{
			$("#signupbox").css("display", "none");
			$("#loginbox").css("display", "block");
		}else {
			$("#signupbox").css("display", "none");
			$("#loginbox").css("display", "none");
		}
	});
	$("#nav-signup").click(function() {
		if($("#signupbox").css('display')==='none')	{
			$("#loginbox").css("display", "none");
			$("#signupbox").css("display", "block");
		}else {
			$("#signupbox").css("display", "none");
			$("#loginbox").css("display", "none");
		}
	});
	

});
</script>
</html>