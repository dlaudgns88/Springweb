<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	crossorigin="anonymous">
	
</script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
header {
	width: 100%;
	height: 50px;
}

main {
	width: 100%;
	height: auto;
}

.signup-Title {
	width: 100%;
	height: 100px;
	margin-left: 500px;
	margin-right: 500px;
}
.signup-Title h1{
	padding-top : 30px;
}

.signupbox {
	margin-left: 500px;
	margin-right: 500px;
}

.signup-datainput div {
	margin-top: 20px;
}

.w3-input {
	outline: none;
}

.signup-menu {
	width: 100%;
	height: 100px;
}

#id-input {
	width: 70%;
	height: auto;
	float: left;
}

#id-check-bt {
	margin-top: 20px;
	width: 30%;
	height: auto;
	float: left;
	text-align: center;
}

.pw-input {
	width: 45%;
	height: auto;
	margin-right: 5%;
	float: left;
}

.pw-check {
	width: 45%;
	height: auto;
	margin-left: 5%;
	float: left;
}
.signup-addr{
	width: 100%;
	height: auto;
}
.addr-box{
	width:100%;
	height: auto;
}
.addr-postcode-box{
	width: 30%;
	height : auto;
	float : left;
}
.addr-postcode-bt-box{
	width: 20%;
	height : auto;
	float : left;
	text-align: center;
}
.addr-postcode-bt-box input{
	margin-top : 25px;
}
.submit-bt{
	margin-top : 50px;
}
</style>
<body class="demo-1">
	<header>
		<%@ include file="./top-nav-form.jsp"%>
	</header>
	<main>
		<div class="signup-Title">
			<h1>회원정보입력</h1>
		</div>
		<form action="<%=request.getContextPath()%>/signup" method="post">
			<div class="signupbox" id="signupbox">

				<div class="signup-datainput">
					<div class="signup-menu">
						<div id="id-input">
							<label>ID</label> <input class="w3-input" type="text" name="id">
							<div class="id-check"></div>
						</div>
						<div id="id-check-bt">
							<button class="w3-button w3-hover-black">Check</button>
						</div>
					</div>

					<div class="signup-menu">
						<div class="pw-input">
							<label>Password</label> <input class="w3-input" type="password"
								name="pw">
						</div>
						<div class="pw-check">
							<label>Password 확인</label> <input class="w3-input"
								type="password">
						</div>

					</div>
					<div class="signup-menu">
						<label>Tel</label> <input class="w3-input" type="text" name="tel">
					</div>
					<div class="signup-addr">
						
						<div class="addr-box">
							<div class ="addr-postcode-box">
								<label>Address</label>
								<input type="text" class="w3-input" id="sample6_postcode" placeholder="우편번호">
							</div>
							<div class ="addr-postcode-bt-box">
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
							</div>
						</div>
						<input type="text"	class="w3-input" id="sample6_address" placeholder="주소">
						<input type="text" class="w3-input" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="addrdata" name="addr" value="">

						<script
							src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script>
							function sample6_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 각 주소의 노출 규칙에 따라 주소를 조합한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var addr = ''; // 주소 변수
												var extraAddr = ''; // 참고항목 변수

												//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
												if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
													addr = data.roadAddress;
												} else { // 사용자가 지번 주소를 선택했을 경우(J)
													addr = data.jibunAddress;
												}
												
												// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
												//if (data.userSelectedType === 'R') {
													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													//if (data.bname !== ''
													/*		&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
													if (extraAddr !== '') {
														extraAddr = ' ('
																+ extraAddr
																+ ')';
													}*/
													// 조합된 참고항목을 해당 필드에 넣는다.
													//document.getElementById("sample6_extraAddress").value = extraAddr;

												//} else {
												//	document.getElementById("sample6_extraAddress").value = '';
												//}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document.getElementById('sample6_postcode').value = data.zonecode;
												document.getElementById("sample6_address").value = addr;
												// 커서를 상세주소 필드로 이동한다.
												document.getElementById("sample6_detailAddress").focus();
											}
										}).open();
							}
						</script>
					</div>
					<input class="w3-input submit-bt" id="submit-bt" type="submit" value="회원가입">
					
				</div>
			</div>
		</form>
	</main>
</body>
<script type="text/javascript">
	
</script>
	
</html>