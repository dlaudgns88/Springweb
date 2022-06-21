<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	href="resources/css/detailboard.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
</head>
<body>
	<c:set var="selectboard" value="${selectboard }" />
	<input type="hidden" id="selectboardNo" value="${selectboard.no }">
	<input type="hidden" id="selectboardMemo" value="${selectboard.memo }">
	<input type="hidden" id="selectboardName" value="${selectboard.name }">

	<c:set var="loginuser" value="${loginuser }" />
	<c:set var="replycnt" value="${replycount }" />
	<%@ include file="./top-nav-form.jsp"%>
	<main>
		<div class="detailboard">

			<div class="detailboard-blank"></div>
			<div id="detailboard-Data-Wrap">
				<div class="detailboard-top-blank"></div>
				<div class="detailboard-nav">

					<div class="detailboard-nav-modify">
						<c:if test="${loginuser.id eq selectboard.m_id }">
							<a class="w3-button w3-black w3-round-large" id="modify-bt">수정</a>
						</c:if>
					</div>
					<div class="detailboard-nav-delete">
						<c:if test="${loginuser.id eq selectboard.m_id }">
							<a class="w3-button w3-black w3-round-large"
								href="<%=request.getContextPath()%>/delete?no=${selectboard.no}"
								id="del-bt">삭제</a>
						</c:if>
					</div>

					<div class="detailboard-nav-blank"></div>
					<div class="detailboard-nav-list">
						<a class="w3-button w3-black w3-round-large"
							href="<%=request.getContextPath()%>/board">목록</a>
					</div>

				</div>
				<div id="detailboard-data" class="w3-panel w3-border w3-round-large">
					<div class="detailboard-title">
						<div class="detailboard-title2">
							<div class="detailboard-category">${selectboard.category }</div>
							<div class="detailboard-name">${selectboard.name }</div>
							<div class="detailboard-title2-1">
								<div class="detailboard-m_id">작성자 : ${selectboard.m_id }</div>
							</div>
							<div class="detailboard-title2-2">
								<div class="detailboard-title2-3">
									<fmt:parseDate value="${selectboard.r_date}" var="dateValue"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<fmt:formatDate pattern="yyyy.MM.dd. HH:mm"
										value="${dateValue}" />
								</div>
								<div class="detailboard-hit">조회수 : ${selectboard.hit}</div>


							</div>
							<div class="detailboard-title3">
								<div class="detailboard-count-reply">댓글 ${replycnt	}</div>
							</div>

						</div>

					</div>
					<div class="detailboard-memo">${selectboard.memo }</div>
					<div class="detailboard-like-wrap">
						<div class="detailboard-like">
							<c:set var="likecnt" value="${likecount }" />
							<c:set var="likelist" value="${likeList}" />
							<c:set var="likecheck" value="${selectone }" />

							<form id="likeform" name="likeform">
								<input type="hidden" value="${selectboard.no }" name="b_no">
								<input type="hidden" value="${loginuser.id }" name="id">
								<c:choose>
									<c:when test="${empty likecheck }">
										<input type="hidden" name="onoffcheck" value="off">
										<i class="xi-heart-o" id="like-i"><input type="submit"
											class="like-bt" value="좋아요 ${likecount }"
											style="background-color: transparent; border: 0px transparent solid;">
										</i>
									</c:when>
									<c:when test="${likecheck.b_no ne selectboard.no }">
										<input type="hidden" name="onoffcheck" value="off">
										<i class="xi-heart-o" id="like-i"><input type="submit"
											class="like-bt" value="좋아요 ${likecount }"
											style="background-color: transparent; border: 0px transparent solid;">
										</i>
									</c:when>
									<c:otherwise>
										<input type="hidden" name="onoffcheck" value="on">
										<i class="xi-heart" id="like-i"><input type="submit"
											class="like-bt" value="좋아요 ${likecount }"
											style="background-color: transparent; border: 0px transparent solid;">
										</i>
									</c:otherwise>
								</c:choose>
							</form>

						</div>
						<div class="detailboard-count-reply2">댓글 ${replycnt	}</div>
					</div>
					<div id="detailboard-reply-wrap">
						<div class="detailboard-reply-blank"></div>
						<div class="detailboard-reply-wrap2">
							<div class="detailboard-reply-title">댓글</div>
						</div>

						<c:set var="reply" value="${replylist }" />

						<div class="reply-wrap">
							<c:forEach var="reply" items="${replylist }">


								<div class="table-wrap">
									<table class="replytable">
										<tr>
											<td style="width: 10%">${reply.reg_id }</td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%" id="hiddendata">${reply.r_no }</td>
											<td style="width: 10%" class="reply_modify"><c:if
													test="${loginuser.id eq reply.reg_id }">
													<button id="modify-reply-bt">수정</button>
												</c:if></td>
											<td style="width: 10%" class="reply_delete"><c:if
													test="${loginuser.id eq reply.reg_id }">
													<button class="delete-reply-bt">삭제</button>
												</c:if></td>
										</tr>
										<tr>
											<td style="width: 10%" colspan="10" id="replymemo">${reply.r_memo }</td>
										</tr>
										<tr>
											<td style="width: 10%" colspan="2"><fmt:parseDate
													value="${reply.r_date}" var="dateValue"
													pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
													pattern="yyyy.MM.dd. HH:mm" value="${dateValue}" /></td>

											<td style="width: 10%" id="change-bt"></td>
											<td style="width: 10%" id="change-bt2"><input
												class="replcy-cancle" type="hidden"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"></td>
											<td style="width: 10%"><input type="hidden"
												id="replyrno" value="${reply.r_no }"></td>

										</tr>
									</table>
								</div>

							</c:forEach>
						</div>


						<c:if test="${not empty loginuser }">
							<form id="detailboard-reply-wrap3"
								action="<%=request.getContextPath()%>/reply" method="post"
								class="w3-panel w3-border w3-round-large">
								<div class="detailboard-reply-id">${loginuser.id }</div>
								<input type="hidden" name="b_no" value="${selectboard.no }">
								<input type="hidden" name="reg_id" value="${loginuser.id }">
								<input type="text" class="detailboard-reply-memo"
									placeholder="댓글을 남겨주세요" name="r_memo">
								<div class="detailboard-reply-bt-wrap">
									<button type="submit" id="send">작성</button>
								</div>
							</form>
						</c:if>
					</div>
				</div>
			</div>


		</div>
		<div class="detalboard-loginbox">
			<%@ include file="./loginbox.jsp"%>
		</div>
	</main>


</body>
<script type="text/javascript">
	$(document).ready(function() {
		var formobj = $("form[name='likeform']");
		var likeoff = 'xi-heart-o';
		var likeon = 'xi-heart';
		$('#like-i').click(function() {
			if ($('#like-i').hasClass(likeoff)) {
				$('#like-i').removeClass(likeoff).addClass(likeon);
				$('input[name=onoffcheck]').val('on');
				formobj.attr('action', "/aaa/like");
				formobj.attr("method", "post");
				formobj.submit();
			} else {
				$('#like-i').removeClass(likeon).addClass(likeoff);
				$('input[name=onoffcheck]').val('off');
				formobj.attr('action', "/aaa/like");
				formobj.attr("method", "post");
				formobj.submit();
			}

		});
		$('#modify-reply-bt').click(function() {
			var data=$('#replymemo').text();
			var modreplyNo = $('#replyrno').val();
			console.log(modreplyNo);
		
			$('#replymemo').empty().append("<input type='text' id='reply-text-input' class='form' placeholder='수정할 내용을 입력하세요' >");
			$('#reply-text-input').css("width","90%");
			$('#reply-text-input').css("border","none");
			$('#reply-text-input').css("outline","none");
			$('#change-bt').empty().append("<button id='save-bt'>저장</button>");
			$('#save-bt').css("border","none");
			$('#save-bt').css("background-color","white");
			$('#change-bt2').empty().append("<button id='cancle-bt'>취소</button>");
			$('#cancle-bt').css("border","none");
			$('#cancle-bt').css("background-color","white");
			$('#cancle-bt').click(function(){
				$('#replymemo').empty();
				$('#replymemo').text(data);
				$('#change-bt').empty();
				$('#change-bt2').empty();
				
			});
			$('#save-bt').click(function(){
				//데이터 수집
				//댓글 수정시 필요한 자료 : 수정할 댓글 내용, 댓글 내용에 접근할 수 있는 무언가가 필요하다.
				//그렇다면  해당 댓글의 번호가 있다면 업데이트로 접근할수 있지 않을까?
				//필요한 데이터를 모아보자.		
				//수정 댓글 작성 내용
				var modreplyMemo = $('#reply-text-input').val();
				
				console.log(modreplyMemo);
			
				
				var modreply={
						'r_no' : modreplyNo,
						'r_memo' : modreplyMemo
				}
				//수정할 댓글의 번호:
				//			alert(modreplyMemo);
				$.ajax({
					type : "post",
					url : "/aaa/ajaxtest",
					data: modreply,
					dataType : "html",
					
					success : function(data){
						console.log("성공");
						$('#replymemo').empty();
						$('#replymemo').text(modreplyMemo);
						$('#change-bt').empty();
						$('#change-bt2').empty();
						alert("수정되었습니다.");
						
						
					},
					error:function(request,status,error){   
					     
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);   
					}
				
				})
			});
					
		});
		$('.delete-reply-bt').click(function(){
			$(this).text("나삭제되")
			var delbt = $(this);
			var tr = delbt.parent().parent();
		    var td = tr.children();
		    var table= tr.parent();
			var select = td.eq(7).text();
			console.log(select);
			var delreply = {
					'r_no' : select
			}
			$.ajax({
				type :"post",
				url : "/aaa/ajaxdelete",
				data : delreply,
				dataType : "html",
				success : function(data){
					
					console.log("성공");
					table.empty();
				}
				
			})
		})
		$('#modify-bt').click(function(){
			if($('#modify-bt').html()=='수정')	{
				
		
			$('.detailboard-name').empty();
			$('.detailboard-name').append("<input type='text' id='boardtitleinput' class='form' placeholder='수정할 내용을 입력하세요' >");
			$('#boardtitleinput').css("border","none");
			$('#boardtitleinput').css("outline","none");
			$('.detailboard-memo').empty();
			$('.detailboard-memo').append("<input type='text' id='boardmemoinput' class='form' placeholder='수정할 내용을 입력하세요' >");
			$('#boardmemoinput').css("border","none");
			$('#boardmemoinput').css("outline","none");
			$('#modify-bt').empty();
			$('#modify-bt').html('저장');
			$('#del-bt').css("display","none");
			}else{
				var modboardno= $('#selectboardNo').val();
				var modboardname= $('#boardtitleinput').val();
				var modboardmemo= $('#boardmemoinput').val();
				var modboard = {
						"no" : modboardno,
						"name" : modboardname,
						"memo" : modboardmemo
						
				}
				
				$.ajax({
					type : "post",
					url : "/aaa/modboard",
					data : modboard,
					dataType : "html",
					success : function(data){
						console.log("성공");
						$('#modify-bt').empty();
						$('#modify-bt').html('수정');
						$('#del-bt').css("display","block");
						$('.detailboard-name').empty();
						$('.detailboard-name').text(modboardname);
						$('.detailboard-memo').empty();
						$('.detailboard-memo').text(modboardmemo);
						
					}
				})
			}
		
			
		})
		
		
	})
</script>

</html>