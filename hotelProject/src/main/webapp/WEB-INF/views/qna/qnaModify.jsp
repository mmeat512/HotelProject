<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hotel Test</title>
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.min.js"></script>  
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!--개인 디자인-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/qnaDetail.css" rel="stylesheet">
    
    <style type="text/css">

    </style>
    
</head>
<body>
<%@ include file="../include/header.jsp" %>
          <section>
           <div class="container qna-form">
           <div class="row">
          <div class="col-xs-12 col-md-9 title">
           <h2>문의 게시판</h2>
           </div>
                  <div class="col-xs-12 col-md-9 qnaboard">
                        <div class="qnatable"></div>
                    <table class="board">
                    <form action="qnaUpdate" method="post" id="qnaUpdate" name="qnaUpdate">
                      <tbody>
                      	<tr>
                      		<td readonly hidden><input type="text" name="qnaBno" value="${vo.qnaBno }"></td>
                      	</tr>
                          <tr>
                              <th class="col-xs-3"><b>*</b> 질문 유형</th>
                              <td class="col-xs-9">
                                  <select id="qtype" name="qnaType">
                                      <option ${vo.qnaType eq '1' ? 'selected':'' } value='1'>객실문의</option>
                                      <option ${vo.qnaType eq '2' ? 'selected':'' } value='2'>멤버쉽문의</option>
                                      <option ${vo.qnaType eq '3' ? 'selected':'' } value='3'>예약번호</option>
                                      <option ${vo.qnaType eq '4' ? 'selected':'' } value='4'>홈페이지 오류</option>
                                      <option ${vo.qnaType eq '5' ? 'selected':'' }	value='5'>컴플레인</option>
                                      <option ${vo.qnaType eq '6' ? 'selected':'' }	value='6'>기타</option>
                                  </select>
                              </td>
                          </tr>
                          <tr>
									<th class="col-xs-3">글 유형</th>
									<td class="col-xs-9">
										<div class="radio-wrap">
												<input type="radio" id="secret"
												name="qnasecret" checked disabled/>비밀글
										</div>
									</td>
								</tr>
                          <tr>
                              <th class="col-xs-3"> 예약번호</th>
                              <td class="col-xs-9"><input type="text" id="reserveNum" name="reserveNum" value="${vo.reserveNum }"></td>
                          </tr>
                          <tr>
                              <th class="bt1"><b>*</b> 제목</th>
                              <td class="col-xs-9"><input type="text" id="title" name="qnaTitle" value="${vo.qnaTitle }"></td>
                          </tr>
                          <tr>
                              <th class="col-xs-3"><b>*</b> 내용</th>
                              <td class="col-xs-9"><textarea rows="15" cols="20" id="content" name="qnaContent" style="resize: none;">${vo.qnaContent }</textarea></td>
                          </tr>
                          <tr>
                              <th class="col-xs-3"><b>*</b> 성명(국문)</th>
                              <td class="col-xs-9"><input type="text" id="koName" name="qnaWriter" value="${vo.qnaWriter }"></td>
                          </tr>
                          <tr id="name">
                              <th class="col-xs-3"><b>*</b> 성명(영문)</th>
                              <td class="col-xs-9"><input type="text" id="engName" name="qnaengName" value="${vo.qnaengName }"><span>여권 성명 기입<br>your passport name</span></td>
                          </tr>
                          <tr>
                              <th class="col-xs-3"><b>*</b> 이메일</th>
                              <td class="col-xs-9"><input type="text" id="email1" name="qnaemail1" value="${vo.qnaemail1 }"> @ <input type="text" value="${vo.qnaemail2 }" id="email2" name="qnaemail2"></td>
                          </tr>
                          <tr >
                              <th class="col-xs-3"><b>*</b> 휴대전화</th>
                              <td class="col-xs-9"><select class="selectPhone" id="phone1" name="qnaphone1">
                                   <option ${vo.qnaphone1 eq '010' ? 'selected':'' }>010</option>
                                    <option ${vo.qnaphone1 eq '011' ? 'selected':'' }>011</option>
                                    <option ${vo.qnaphone1 eq '017' ? 'selected':'' }>017</option>
                                    <option ${vo.qnaphone1 eq '018' ? 'selected':'' }>018</option>
                              </select><input class="inputPhone" type="text" id="phone2" name="qnaphone2" value="${vo.qnaphone2 }">―<input class="inputPhone" type="text" id="phone3" name="qnaphone3" value="${vo.qnaphone3 }"></td>
                          </tr>
                          <tr>
                              <th class="col-xs-3">비밀글 번호</th>
                              <td class="col-xs-9"><input type="password" ${vo.qnasecret eq 'none-secret'? 'readonly style="background-color:#dcd0c5"':'' }  id="pw" name="qnaBoardPw" value="${vo.qnaBoardPw }"></td>
                          </tr>
                          <tr>
                              <th class="col-xs-3">비밀글 번호 확인</th>
                              <td class="col-xs-9"><input type="password" ${vo.qnasecret eq 'none-secret'? 'readonly  style="background-color:#dcd0c5"':'' }  id="pwCheck"></td>
                          </tr>
                      </tbody>
                  </form>
                  </table>
                   </div>
                   
       <div class="col-xs-12 leftButton">
           <button type="button" class="qnaListbutton" onclick="location.href='qnaList'">목록</button>
           <button type="button" class="qnaDeletebutton" style="margin-left :5px;" id="qnaDeleteBtn">삭제</button>
           <button type="button" class="qnaUpdatebutton" id="qnaUpdateBtn">수정</button>
       </div>
       </div>
       </div> 
   </section>

   <%@ include file="../include/footer.jsp" %>
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
		 
		
	}
 
	/* 공개글 선택하면 비밀번호창 readonly */
	$("#none-secret").click(function() {
		//console.log($(this).attr("value"));
		$("#pw").attr("readonly", "true");
		$("#pw").css("background-color", "#dcd0c5");
		$("#pwCheck").attr("readonly", "true");
		$("#pwCheck").css("background-color", "#dcd0c5");

	})
	$("#secret").click(function() {
		console.log($(this).attr("value"));
		$("#pw").removeAttr("readonly");
		$("#pw").css("background-color", "white");
		$("#pwCheck").removeAttr("readonly");
		$("#pwCheck").css("background-color", "white");

	})
	
	/* 수정 버튼 눌렀을 때 검사  */
	var kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //한글 검사
	var num = /^[0-9]{4}$/; //숫자 검사
	$("#qnaUpdateBtn")
			.click(
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
							alert("국문 성명은 한글로 입력하시기 바랍니다")
							$("#koName").focus();
						} else if ($("#engName").val() == '') {
							alert("성명(영문)은 필수사항입니다");
							$("#engName").focus();
						}else if ($("#email1").val() == '') {
							alert("이메일은 필수사항입니다");
							$("#email1").focus();
						} else if ($("#email2").val() == '') {
							alert("이메일은 필수사항입니다");
							$("#email2").focus();
						} else if ($("#phone1").val() == '선택') {
							alert("전화번호 선택은 필수사항입니다");
							$("#phone1").focus();
						} else if ($("#phone2").val() == '') {
							alert("전화번호는 필수사항입니다");
							$("#phone2").focus();
						} else if (num.test($("#phone2").val()) == false) {
							alert("잘못된 전화번호입니다");
							$("#phone2").focus();
						} else if ($("#phone3").val() == '') {
							alert("전화번호는 필수사항입니다");
							$("#phone3").focus();
						} else if (num.test($("#phone3").val()) == false) {
							alert("잘못된 전화번호입니다");
							$("#phone3").focus();
						}else if (document.getElementById("secret").checked == true) {
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
							} else if (confirm("수정하시겠습니까?")) {
								$("#qnaUpdate").submit();
							}
						} else if (confirm("수정하시겠습니까?")) {
							$("#qnaUpdate").submit();
						}
					})
					
	$("#qnaDeleteBtn").click(function(){
		if (confirm("삭제하시겠습니까?")) {
			document.qnaUpdate.setAttribute("action","qnaDelete");//액션속성을 바꾼다
			document.qnaUpdate.submit();
		}
	})
								
 </script>
</body>

</html>