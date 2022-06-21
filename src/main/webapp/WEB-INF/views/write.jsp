<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/write.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="./top-nav-form.jsp"%>
	<div class="write-Background">
		<div class="write-form-blank"></div>
		<div class="write-form-wrap">
			<div class="write-top"></div>
			<div class="write-top2">
				<h1>Write</h1>
			</div>
			<form action="<%=request.getContextPath()%>/boardwrite" method="post" enctype="multipart/form-data">
				<div class="write-title">

					<div class="writetitle">
						<input type="text" class="form-control" placeholder="카테고리"
							name="category">
					</div>
					<div class="writetitle2"></div>
				</div>
				<div class="write-title2">
					<input type="text" class="form-control" placeholder="제목"
						name="name">
				</div>
				<input type="hidden" name="m_id" value="${nowuser.id }">
				<div class="write-input">
					<div class="form-floating">
						<textarea class="form-control" placeholder="내용"
							id="floatingTextarea2" style="height: 350px" name="memo"></textarea>

					</div>
				</div>
				<div class="write-data-trans">
					<div class="filebox">
						<input type="text" id="trans" class="form-control" value="첨부파일" placeholder="첨부파일">
						<label for="file">파일찾기</label> <input type="file" id="file"
							name="file">
					</div>
					<div class="write-data-trans3"></div>
				</div>
				<div class="write-bt-wrap">
					<div class="checkbox">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox"
								id="flexSwitchCheckDefault" name="h_check"> <label
								class="form-check-label" for="flexSwitchCheckDefault">
								비밀글 설정 </label>
						</div>
					</div>
					<div class="write-bt-blank"></div>
					<div class="btbox">
						<div class="bt-submit">
							<button type="submit" id="send" class="btn btn-primary">작성</button>
						</div>
						<div class="bt-exit">
							<input type="button" class="btn btn-primary"
								onclick="location.href='exit'" value="취소">
						</div>
					</div>
				</div>
				
			</form>
		</div>
		<div class="write-loginbox">
			<%@ include file="./loginbox.jsp"%>
		</div>
	</div>

	
</body>
<script>
$("#file").on('change',function(){
	  var fileName = $(this).val();
	  var splitName = $(this).val().split('/').pop().split('\\').pop();
	  $("#trans").val(splitName);
	});
</script>
</html>