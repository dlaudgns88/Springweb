<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/addsub.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>

<body>
	<header>
		<h1>Subscribe Platform ADD</h1>
	</header>
	<section>
		<article>
			<form class="subscribeForm" name="subscribeForm">
				<div class="article-blank"></div>
				<div class="article-data-input">
					<div class="urlwrap">
						<label for="name-url">URL 입력</label>
						<input type="text" id="name-url"name="r_url" class="form-control"
							placeholder="등록할 URL을 입력해주세요">
					</div>
					<div class="memowrap">
						<label for="memo">URL 정보</label>
						<input type="text" class="form-control" name="r_memo" id="memo">					
					</div>
					<div class="imgwrap">
						<input name="file" type="file">
					</div>
					<div class="btwrap">
						<div class="btwrap2">
							<button type="submit" class="sub-bt" id="add-bt">등록</button>
						</div>
						<div class="btwrap3">
							<button class="sub-bt" id="cancle-bt">취소</button>
						</div>
					</div>
				</div>
			</form>
		</article>
	</section>
	<footer> </footer>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		var formElement = $("form[name='subscribeForm']");
		$('#cancle-bt').click(function() {
			window.close();
		});
		$('#add-bt').click(function() {
			formElement.attr('action', '/aaa/subinsert');
			formElement.attr("method", "post");
			formElement.attr('enctype', 'multipart/form-data');
			formElement.submit();
			
		});
	})
</script>

</html>