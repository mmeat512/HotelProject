<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	href="${pageContext.request.contextPath }/resources/css/qnaBoard.css"
	rel="stylesheet">
</head>
<body>
	<%@include file="../include/header.jsp"%>
	<section>
		<div class="container qna-form">
			<div class="row">
				<div class="col-xs-12 col-md-9 title">
					<h2>문의 하기</h2>
				</div>
				<div class="col-xs-12 col-md-9 qnaboard">
					<div class="qnatable"></div>
					<form action="qnaRegistForm" method="POST" id="qnaRegistForm"
						name="qnaRegistForm">
						<table class="board">
							<tbody>
								<tr>
									<th class="col-xs-3"><b>*</b> 질문 유형</th>
									<td class="col-xs-9"><select id="qtype" name="qnaType">
											<option value="0">유형 선택</option>
											<option value="1">객실문의</option>
											<option value="2">멤버쉽문의</option>
											<option value="3">예약번호</option>
											<option value="4">홈페이지 오류</option>
											<option value="5">컴플레인</option>
											<option value="6">기타</option>
									</select></td>
								</tr>
								<tr>
									<th class="col-xs-3">글 유형</th>
									<td class="col-xs-9">
										<div class="radio-wrap">
										 <input type="radio" id="secret"
												name="qnasecret" value="secret" checked/>비밀글
										</div>
									</td>
								</tr>
								<tr>
									<th class="col-xs-3">예약번호</th>
									<td class="col-xs-9"><input type="text" id="reserveNum"
										name="reserveNum"></td>
								</tr>
								<tr>
									<th class="col-xs-3 bt1"><b>*</b> 제목</th>
									<td class="col-xs-9"><input type="text" id="title"
										name="qnaTitle"></td>
								</tr>
								<tr>
									<th class="col-xs-3"><b>*</b> 내용</th>
									<td class="col-xs-9"><textarea rows="15" cols="20"
											id="content" name="qnaContent" style="resize: none;"></textarea></td>
								</tr>
								<tr>
									<th class="col-xs-3"><b>*</b>성명(국문)</th>
									<td class="col-xs-9"><input type="text" id="koName"
										name="qnaWriter" value="${vo.userName}">
										<input type="hidden" name="qnaId" value="${vo.userId }">
										<input type="hidden" name="qnaAnswer" value="no">
										</td>
								</tr>
								<tr id="name">
									<th class="col-xs-3"><b>*</b> 성명(영문)</th>
									<td class="col-xs-9"><input type="text" id="engName"
										name="qnaengName" value="${vo.userEngName }"><span>여권 성명 기입<br>your
											passport name
									</span></td>
								</tr>
								<tr id="email">
									<th class="col-xs-3"><b>*</b> 이메일</th>
									<td class="col-xs-9"><input type="text" id="email1"
										name="qnaemail1" value="${vo.userEmail1 }"> @ <input type="text" id="email2"
										name="qnaemail2" value="${vo.userEmail2 }"></td>
								</tr>
								<tr id="phone">
									<th class="col-xs-3"><b>*</b> 휴대전화</th>
									<td class="col-xs-9"><select class="selectPhone" id="phone1" name="qnaphone1">
											<option >선택</option>
											<option ${vo.userPhone1 eq '010' ? 'selected':'' }>010</option>
											<option ${vo.userPhone1 eq '011' ? 'selected':'' }>011</option>
											<option ${vo.userPhone1 eq '017' ? 'selected':'' }>017</option>
											<option ${vo.userPhone1 eq '018' ? 'selected':'' }>018</option>
									</select> <input type="text" class="inputPhone" id="phone2" name="qnaphone2" value="${vo.userPhone2 }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">―<input
										class="inputPhone" type="text" id="phone3" name="qnaphone3" value="${vo.userPhone3 }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
								</tr>
								<tr>
									<th class="col-xs-3">비밀글 번호</th>
									<td class="col-xs-9"><input type="password" id="pw"
										name="qnaBoardPw"><span>숫자 4개</span></td>
								</tr>
								<tr>
									<th class="col-xs-3">비밀글 번호 확인</th>
									<td class="col-xs-9"><input type="password" id="pwCheck"
										name="qnaBoardPwCheck"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div class="col-xs-12 buttonDiv">
					<button type="button" class="qnabutton" id="qnabutton">문의하기</button>
					<button type="button" class="qnabutton" onclick="location.href='qnaList'">목록</button>
				</div>
			</div>
		</div>
	</section>
	<%@include file="../include/footer.jsp"%>

	<!--헤더 스크롤 감지-->
	<script>
	window.onload = function(){
		//넘어오는 msg가 없는 경우 공백처리를 위해 ''안에 넣어준다 
		//공백이 아니라면 msg출력
		
		//뒤로가기 실행 후에 앞으로가기 했을 때 변경된 기록 공백이라면 함수 종료
		if(history.state == ''){
			return;	
		}
		
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
			history.replaceState('',null,null);//현재 히스토리 기록을 변경
		}
		 
		if($("#koName").val() != ""){
			document.getElementById("koName").readOnly = true;
			document.getElementById("engName").readOnly = true;
		}else{
			document.getElementById("koName").readOnly = false;
			document.getElementById("engName").readOnly = false;
		}		
	}
	
	$(window).on("scroll", function() {
			if ($(window).scrollTop() > 100) {
				$(".header-img").css("display", "none");
			} else {
				$(".header-img").css("display", "block");
			}
		})


	</script>

	<script>
		/* 문의 등록 버튼 눌렀을 때 검사  */
		var kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글 검사
		var eng = /^[a-zA-Z]*$/; //영문 검사
		var num = /^[0-9]{4}$/;//숫자검사
		var emailCheck = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		console.log($("#secret").val());
		$("#qnabutton").click(
						function() {
							if ($("#qtype").val() == '0') {
								alert("질문 유형을 선택해주세요");
								$("#qtype").focus();
							} else if ($("#title").val() == '') {
								alert("제목은 필수사항입니다");
								$("#title").focus();
							} else if ($("#content").val() == '') {
								alert("내용은 필수사항입니다");
								$("#content").focus();
							} else if ($("#koName").val() == '') {
								alert("성명(국문)은 필수사항입니다");
								$("#koName").focus();
							} else if (kor.test($("#koName").val()) == false) {
								alert("국문 성명은 한글로 입력하시기 바랍니다");
								$("#koName").focus();
							} else if($("#koName").val() == '관리자'){
								alert("정확한 성명을 입력하시기 바랍니다");
								$("#koName").focus();
							} else if ($("#engName").val() == '') {
								alert("성명(영문)은 필수사항입니다");
								$("#engName").focus();
							} 
							
/* 							else if (eng.test($("#engName").val()) == false) {
								alert("영문 성명은 띄어쓰기 없는 영어로 입력하시기 바랍니다");
								$("#engName").focus();
							}  */
							
							else if ($("#email1").val() == '') {
								alert("이메일은 필수사항입니다");
								$("#email1").focus();
							} else if ($("#email2").val() == '') {
								alert("이메일은 필수사항입니다");
								$("#email2").focus();
							} else if(emailCheck.test($("#email2").val()) == false){
								alert("정확한 이메일을 작성해주세요");
								$("#email2").focus();
							}else if($("#phone1").val()=='선택'||$("#phone2").val()==''||$("#phone3").val()==''){
								alert("번호는 필수사항입니다.");
							}  else if (document.getElementById("secret").checked == true) {
								if ($("#pw").val() == null) {
									alert("비밀글에는 비밀번호가 필수입니다");
									$("#pw").focus();
								} else if (num.test($("#pw").val()) == false) {
									alert("비밀번호는 네개의 숫자로 작성해주세요");
									$("#pw").focus();
								} else if ($("#pwCheck").val() == '') {
									alert("비밀번호 확인은 필수사항입니다");
									$("#pwCheck").focus();
								} else if ($("#pw").val() != $("#pwCheck")
										.val()) {
									alert("입력하신 두 비밀번호가 서로 다릅니다")
									$("#pwCheck").focus();
								} else if (confirm("문의글을 게시하시겠습니까?")) {
									$("#qnaRegistForm").submit();
								}
							} else if (confirm("문의글을 게시하시겠습니까?")) {
								$("#qnaRegistForm").submit();
							}
						})
	</script>


</body>
</html>