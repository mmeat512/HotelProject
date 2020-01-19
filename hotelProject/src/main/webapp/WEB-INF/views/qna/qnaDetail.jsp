<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hotel Test</title>
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!--개인 디자인-->
<link href="${pageContext.request.contextPath }/resources/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/qnaDetail.css"
	rel="stylesheet">

<style type="text/css">
	#moreList{
	margin:0 auto;
	padding:0;
	padding-top:4px;
		width:100%;
		border:0;
	}
	.btn-default{
	}
	
	
</style>

</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section style="margin-bottom: 10px;">
		<div class="container qna-form">
			<div class="row">
				<div class="col-xs-12 col-md-9 title">
					<h2>문의 게시판</h2>
				</div>
				<div class="col-xs-12 col-md-9 qnaboard">
					<div class="qnatable"></div>
					<table class="board">
						<tbody>
							<tr>
								<th class="col-xs-3"><b></b> 질문 유형</th>
								<td class="col-xs-9"><select id="qtype" disabled>
										<option ${vo.qnaType eq '1' ? 'selected':'' }>객실문의</option>
										<option ${vo.qnaType eq '2' ? 'selected':'' }>멤버쉽문의</option>
										<option ${vo.qnaType eq '3' ? 'selected':'' }>예약번호</option>
										<option ${vo.qnaType eq '4' ? 'selected':'' }>홈페이지 오류</option>
										<option ${vo.qnaType eq '5' ? 'selected':'' }>컴플레인</option>
										<option ${vo.qnaType eq '6' ? 'selected':'' }>기타</option>
								</select></td>
							</tr>
							<tr>
								<th class="col-xs-3">글 유형</th>
								<td class="col-xs-9">
									<div class="radio-wrap" readonly=readonly>
										<input type="radio" id="secret" name="qnasecret" checked
											disabled />비밀글
									</div>
								</td>
							</tr>
							<tr>
								<th class="col-xs-3">작성자</th>
								<td class="col-xs-9"><input type="text" id="koName"
									value="${vo.qnaWriter }" readonly></td>
							</tr>
							<tr>
								<th class="bt1"><b></b> 제목</th>
								<td class="col-xs-9"><input type="text" id="title"
									value="${vo.qnaTitle }" readonly></td>
							</tr>
							<tr>
								<th class="col-xs-3"><b></b> 내용</th>
								<td class="col-xs-9"><textarea rows="15" cols="20"
										id="content" style="resize: none;" readonly>${vo.qnaContent }</textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-xs-12 leftButton">
					<button type="button" class="qnaListbutton"
						onclick="location.href='qnaList'">목록</button>
					<button type="button" class="qnaUpdatebutton"
						onclick="location.href='qnaModify?qnaBno='+${vo.qnaBno}">수정</button>
				</div>
			</div>
		</div>
	</section>

	<section style="margin-top: 10px;">
		<div class="container">
			<div class="col-xs-12 col-md-9 replyBorder"></div>
			<div class="row">
				<div class="col-xs-12 col-md-9 qnaboard">
					<table class="board">
						<tbody>
							<tr>
								<th calss="col-xs-3"
									style="width: 15%; background-color: #e4d7cd;">댓글</th>
								<td class="col-xs-9" style="padding: 0;">
									<div class="col-xs-12 col-md-9 qnaboard-reply">
										<form class="reply">
											<!--form-control은 부트스트랩의 클래스입니다-->
											<div class="reply-content">
												<textarea class="form-control" rows="3" id="qrContent"></textarea>
												<div class="reply-group">
													<div class="reply-input">
														<input type="hidden" class="form-control" id="qrId"
															value="${sessionScope.userName eq'더 벤자민' ? '더 벤자민':vo.qnaWriter}"> 
													<button type="button" class="right btn replyRegistBtn"
														id="replyRegist">등록하기</button>
												</div>

											</div>
										</form>
								</div>
								</td>
							</tr>
								<tr>

								</tr>
						</tbody>

					</table>
					<!-- 여기서부터 반복 -->
								<div id="replyList">
								<td>
 										</td>
										</div>
										<div class="reply-wrap" style="height:30px;padding:0;">
						<button type="button" class="btn btn-default moreList"
						id="moreList">더보기</button>
										</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>
	
		<!-- 모달 -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default pull-right"
						data-dismiss="modal">닫기</button>
					<h4 class="modal-title">댓글수정</h4>
				</div>
				<div class="modal-body">
					<!-- 수정폼 id값을 확인하세요-->
					<div class="reply-content">
						<textarea class="form-control" rows="4" id="modalReply"
							></textarea>
						<div class="reply-group">
							<div class="reply-input">
								<input type="hidden" id="modalRno"> <input
									type="hidden" id="qrId">
							</div>
							<button class="right btn btn-info" id="modalModBtn">수정하기</button>
							<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
						</div>
					</div>
					<!-- 수정폼끝 -->
				</div>
			</div>
		</div>
	</div>

 <%
 String strReferer = request.getHeader("referer");
 
 if(strReferer == null){
%>
 <script language="javascript">
  //alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
  document.location.href="qnaList";
 </script>
<%
  return;
 }
%>

	<script>
		/* 댓글 처리 영역 */
		$(document).ready(function(){
			 		$("#replyRegist").click(function(){
			 			add();
			 		})
			 		/* 댓글 등록 */
			 		function add(){
			 			var qrBno = '${vo.qnaBno}';
			 			var qrContent = $("#qrContent").val(); 
			 			var qrId = $("#qrId").val(); 
			 			
			 			if(qrContent == ''){
			 				alert("댓글 내용은 필수입니다");
			 				return false;
			 			}
			 			$.ajax({
							type : "POST",//전송형식
							url : "../qnaReply/new",//전송할 url
							data : JSON.stringify({
								"qrBno" : qrBno,
								"qrContent" : qrContent,
								"qrId" : qrId,
							}),//전송데이터
							contentType : "application/json; charset=utf-8",//전송할 타입 
							success : function(result) {
								//게시글 등록 후 공백처리
								$("#qrContent").val("");
			
								getList(1, true);//reset여부 true
							}, //전송 성공시 돌려받을 익명함수
							error : function(status) {
							} //응답 실패시 실행되는 익명함수
			 			})

			 		}
		})
		
		//더보기 버튼 처리
		$("#moreList").click(function() {
		getList(++pageNum, false);
		})
						
		//댓글 목록
		getList(1,true);
		var str = "";
		var pageNum = 1;
		function getList(page, reset){
			var qrBno = '${vo.qnaBno}';
			pageNum = page;
			$.getJSON("../qnaReply/getReply/"+qrBno+"/"+pageNum,
						function(data){
							var list = data.list;
							var count = data.replyCount;
							if(reset == true){
								str = "";
								//console.log(reset);
							}
							if(pageNum * 5 >= count){
								$("#moreList").css("display","none");
							}else {
								$("#moreList").css("display","inline");
							}
							for(var i = 0; i < list.length; i++){
								//console.log(list[i]);
								str += "<div class='reply-wrap'>";
								str += "<div class='reply-image' style='float: left; padding:10px; '>";
	                            str += "<img src='../resources/img/profile.png' style='border:1px solid #ddd;'>";
	                           	str += "</div>";
								str += "<div class='reply-content'>";
								str += "<div class='reply-group'>";
								str += "<strong class='left'>"+list[i].qrId+"</strong>";
								str += "<small class='left'>"+timeStamp(list[i].qrDate)+"</small>";
								str += "<a href='"+list[i].qrNum+"' class='right' id='replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>";
								str += "<a href='"+list[i].qrNum+"' class='right' id='replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
								str += "</div>";
								str += "<p class='clearfix'>"+list[i].qrContent+"</p>";
								str += "</div>";
								str += "</div>";

							}//for문 끝
							$("#replyList").html(str);
							})
						}//댓글 목록처리 끝
						
						/* 수정, 삭제 */
						$("#replyList").on("click", "a", function(event) {
							event.preventDefault();//a태그의 이동을 막는다
							//1.수정 클릭 시, modal-title에 접근해서 "댓글 수정"변경
							//textarea태그를 보여지도록 처리
							//수정버튼을 보여지고, 삭제버튼 가려지도록 처리
							//2. 삭제 클릭시, modal-title에 접근해서 "댓글삭제"
							//textarea태그 숨겨지도록 처리
							//삭제버튼을 보여지고, 수정버튼 가려지도록 처리
							console.log(event.target.id);
							console.log($(this).attr("id"));
							var id = $(this).attr("id");
							if (id == "replyModify") {
								var rno = $(this).attr("href");
								console.log(rno);
								$("#modalRno").val(rno);
								$(".modal-title").html("댓글 수정");
								$("#modalReply").css("display", "inline");
								$("#modalModBtn").css("display", "inline");
								$("#modalDelBtn").css("display", "none");
								$("#replyModal").modal("show");
							} else if (id == "replyDelete") {
								var rno = $(this).attr("href");
								console.log(rno);
								$("#modalRno").val(rno);
								$(".modal-title").html("댓글 삭제");
								$("#modalReply").css("display", "none");
								$("#modalModBtn").css("display", "none");
								$("#modalDelBtn").css("display", "inline");
								$("#replyModal").modal("show");
							}
						})

							$("#modalDelBtn").click(function() {
							//1. modalRno값을 얻고, modalPw값을 얻음
							//2. ajax를 통해서 reply/delete로 json형식으로 요청처리
							//3. pwCheck()메서드를 통해서 비밀번호가 맞는지 확인
							//4. 비밀번호가 맞다면 삭제 진행
							//콜백함수로 삭제성공이 들어오면, 비밀번호창을 비우고, modal("hide")로 처리
							//콜백함수로 삭제실패가 돌아오면 "비밀번호가 틀렸습니다"출력
							deleteReply();
						})

						function deleteReply() {
							var qrNum = $("#modalRno").val();
							var qrId = $("#qrId").val();
							console.log("qrnum : " + qrNum);
							console.log("qrId : " + qrId);
							$.ajax({
										type : "DELETE",//전송형식
										url : "../qnaReply/delete",//전송할 url
										data : JSON.stringify({
											"qrNum" : qrNum,
											"qrId" : qrId
										}),//전송데이터
										contentType : "application/json; charset=utf-8",//전송할 타입 
										success : function(result) {
											//게시글 등록 후 공백처리
											if (result == 1) {
												$("#modalPw").val("");
												$("#replyModal").modal("hide");
												alert("댓글을 삭제하였습니다");
												getList(1, true);//reset여부 true
											} else if (result == 0) {
												alert("권한이 없습니다");
												$("#replyModal")
												.modal("hide");												
											}
										}, //전송 성공시 돌려받을 익명함수
										error : function(status) {
											alert("다시 시도하세요:" + status);
										} //응답 실패시 실행되는 익명함수
									})
						}//삭제처리 끝

						$("#modalModBtn")
								.click(
										function() {
											var qrNum = $("#modalRno").val();
											var qrContent = $("#modalReply").val();
											var qrId = $("#qrId").val();
											console.log(qrNum);
											console.log(qrId);
											console.log(qrContent);
								 			if(qrContent == ''){
								 				alert("댓글 내용은 필수입니다");
								 				return false;
								 			}
								 			
											$.ajax({
														type : "PUT",
														url : "../qnaReply/update",
														data : JSON.stringify({
															"qrNum" : qrNum,
															"qrContent" : qrContent,
															"qrId" : qrId
														}),
														contentType : "application/json; charset=utf-8",
														success : function(
																result) {
															if (result == 1) {
																alert("수정 성공");
																$("#modalPw")
																		.val("");
																$("#modalReply")
																		.val("");
																$("#replyModal")
																		.modal("hide");
																getList(1, true);//reset여부 true
															} else {
																alert("권한이 없습니다");
																$("#replyModal")
																.modal("hide");	
															}
														},
														error : function(status) {
															alert("다시 시도하세요:" + status);
														}

													})
										})//수정 끝
						
						/* 시간 처리 */
						function timeStamp(millis){
							var date = new Date();//오늘날짜
							var date2 = new Date(millis);//밀리초기반 날짜
							//console.log(date.getTime());//오늘날짜의 밀리초
							
							var gap = date.getTime() - millis;//경과시간차
							var time;//리턴 할 문자열

							if(gap < 1000*60*60*24){//등록일 기준 하루 미만인 경우
								if(gap < 1000*60*60){//1시간 미만인경우
									time = "방금전"
								}else{//1시간 이상인 경우
									time = parseInt(gap/(1000*60*60))+"시간 전";
								}
							}else{//등록일 기준 하루 이상인 경우
								var today = new Date(millis);
								var year = today.getFullYear();//년도구함
								var month = today.getMonth() + 1;//월
								var day = today.getDate();//일
								var hour = today.getHours();//시
								var minute = today.getMinutes();//분
								var second = today.getSeconds();//초
								time = year + "년" + month + "월" + day + "일 " + hour + ":" + minute + ":"+second;
							}
							return time;
			}
						
	
 	</script>

</body>

</html>