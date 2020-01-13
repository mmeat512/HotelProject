<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/Join.css" rel="stylesheet">



</head>

<body>
<jsp:include page="../include/header.jsp"/>
    <section>
        <div class="container join-form">
            <div class="row">
                <div class="col-xs-12 col-md-9 join-t">
                    <h2>회원가입</h2>
                </div>
                <div class="col-xs-12 col-md-9 join-inner">
                    <div class="inner">
                       <div>
                        <span>모든 항목은 필수 입력 항목입니다.</span>
                           
                       </div>
                        <form action="joinForm" method="post" name="regForm" id="regForm">
                            <label>아이디</label>
                            <div class="inner-id">
                                <input type="text" class="inid" id="userId" name="userId" placeholder="영문(소문자),숫자를 포함한 4~12자 이내로 입력하세요">
                                <div class="inner-id-btn">
                                    <button type="button" onclick="idcheck()">중복확인</button>
                                </div>
                                    <span id="msgId"></span><!--자바스크립트에서 추가-->
                            </div>
                            <div class="inner-pw">
                                <label>비밀번호</label>
                                <input type="password" class="in" id="userPw" name="userPw" placeholder="영문(대소문자),숫자,특수문자를 포함한 8~12자 이내로 입력하세요">
                            </div>
                            <span id="msgPw"></span><!--자바스크립트에서 추가-->
                            <div class="inner-pw-ck">
                                <label>비밀번호 확인</label>
                                <input type="password" class="in" id="pwCheck" name="pwCheck" placeholder="비밀번호와  동일하게 입력하세요">
                            </div>
                            <span id="msgPw-c"></span><!--자바스크립트에서 추가-->
                            <div class="inner-name">
                                <label>이름</label>
                                <input type="text" class="in" id="userName" name="userName" placeholder="이름은 필수사항입니다.">
                            </div>
                            <div class="inner-engname">
                                <label>영문이름</label>
                                <input type="text" class="in" id="userEngName" name="userEngName" placeholder="여권영문이름과 동일하게 입력하세요">
                            </div>
                            <label>주소</label>
                            <div class="inner-addr1">
                                <input type="text" placeholder="우편번호" class="inzip" id="userAddrzipNum" name="userAddrzipNum" readonly>
                                <div class="inner-addr-btn">
                                    <button type="button" onclick="goPopup()">우편번호 찾기</button>
                                </div>
                            </div>
                            <div class="inner-addr2">
                                <input type="text" placeholder="기본주소" class="in" id="userAddrBasic" name="userAddrBasic">
                            </div>
                            <div class="inner-addr3">
                                <input type="text" placeholder="상세주소" class="in" id="userAddrDetail" name="userAddrDetail">
                            </div>
                            <div class="inner-phone">
                                <label style="display: block">휴대전화</label>
                                <select style="border: 1px solid #ddd" class="td03" id="userPhone1" name="userPhone1">
                                    <option>선택</option>
                                    <option>010</option>
                                    <option>011</option>
                                    <option>017</option>
                                    <option>018</option>
                                </select>
                                - <input type="text" class="td3" id="userPhone2" name="userPhone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                - <input type="text" class="td3" id="userPhone3" name="userPhone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                            </div>
                            <div class="inner-email">
                                <label>이메일</label>
                                <input type="text" class="td4" id="userEmail1" name="userEmail1">@
                                <select style="border: 1px solid #ddd" class="td4" id="userEmail2" name="userEmail2">
                                	<option>선택</option>
                                    <option>naver.com</option>
                                    <option>gmail.com</option>
                                    <option>daum.net</option>
                                    <option>hanmail.net</option>
                                    <option>nate.com</option>
                                </select>
                            </div>
                            <div class="inner-birth">
                                <label>생년월일</label>
                                <select style="border: 1px solid #ddd" class="td5" id="userBirth1" name="userBirth1">
                                	<option>선택</option>
	                                <c:forEach var="year" begin="1950" end="2019" >
	                                    <option>${year }</option>
	                                </c:forEach>
                                </select>년
                                <select style="border: 1px solid #ddd" class="td5" id="userBirth2" name="userBirth2">
                                	<option>선택</option>
	                                <c:forEach var="month" begin="1" end="12">
	                                    <option>${month }</option>
	                                </c:forEach>
                                </select>월
                                <select style="border: 1px solid #ddd" class="td5" id="userBirth3" name="userBirth3">
                                	<option>선택</option>
	                                <c:forEach var="day" begin="1" end="31">
	                                    <option>${day }</option>
	                                </c:forEach>
                                </select>일
                            </div>
	                        <div class="join-btn-cl">
	                            <button type="button" class="join-btn" onclick="joinBtn()">회원가입</button>
	                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="../include/footer.jsp"/>
	<script>
		function joinBtn(){
			
			/* form값 가져오기 */
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			var userpwCheck = $("#pwCheck").val();
			var userName = $("#userName").val();
			var userEnName = $("#userEngName").val();
			var addrZip = $("#userAddrzipNum").val();
			var addrBasic = $("#userAddrBasic").val();
			var addrDetail = $("#userAddrDetail").val();
			var phone1 = $("#userPhone1").val();
			var phone2 = $("#userPhone2").val();
			var phone3 = $("#userPhone3").val();
			var email1 = $("#userEmail1").val();
			var email2 = $("#userEmail2").val();
			var birth1 = $("#userBirth1").val();
			var birth2 = $("#userBirth2").val();
			var birth3 = $("#userBirth3").val();

			/* 정규표현식 */
			var idCheck =  /^(?=.*[a-z])(?=.*[0-9]).{4,12}$/.test(userId);
			var pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,12}$/.test(userPw);
			
			if(userId.length<4 || userId.length>12 || !idCheck){
				alert("아이디형식에 맞지않습니다.");	
			}else if(!$("#userId").attr("readonly")){
				alert("아이디중복체크는 필수입니다.")
			}else if(userPw.length<8 || userPw.length>12 || !pwCheck){
				alert("비밀번호형식에 맞지 않습니다.");
			}else if(userpwCheck != userPw){
				alert("비밀번호확인란이 비밀번호와 다릅니다");
			}else if(userName == ""){
				alert("이름은 필수사항입니다.");
			}else if(userEnName == ""){
				alert("영문이름은 필수사항입니다.");
			}else if(addrZip==''||addrBasic==''||addrDetail==''){
				alert("주소는 필수사항입니다.");
			}else if(phone1=='선택'||phone2==''||phone3==''){
				alert("번호는 필수사항입니다.");
			}else if(email1==''||email2=='선택'){
				alert("이메일은 필수사항입니다.");
			}else if(birth1=='선택'||birth2=='선택'||birth3=='선택'){
				alert("생년월일은 필수사항입니다.");
			}else if(confirm("가입하시겠습니까?")){
				document.regForm.submit();
			}
		}
		
        /*아이디 형식 검사 스크립트*/
        var id = document.getElementById("userId");
        id.onkeyup = function() {
            /*자바스크립트의 정규표현식 입니다*/
            /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
            var regex =/^(?=.*[a-z])(?=.*[0-9]).{4,12}$/;
            if(regex.test(document.getElementById("userId").value )) {
                document.getElementById("userId").style.border = "2px solid";
                document.getElementById("userId").style.borderColor = "#29e2a2";
                document.getElementById("msgId").innerHTML = "아이디중복체크는 필수입니다";
            } else {
                document.getElementById("userId").style.border = "2px solid";
                document.getElementById("userId").style.borderColor = "red";
                document.getElementById("msgId").innerHTML = "영문과 숫자로 4글자 이상의 아이디를 만들어주세요";
            }
        }
        /*비밀번호 형식 검사 스크립트*/
        var pw = document.getElementById("userPw");
        pw.onkeyup = function(){
            var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,12}$/;
             if(regex.test(document.getElementById("userPw").value )) {
                document.getElementById("userPw").style.border = "2px solid";
                document.getElementById("userPw").style.borderColor = "#29e2a2";
                document.getElementById("msgPw").innerHTML = "사용가능합니다";
            } else {
                document.getElementById("userPw").style.border = "2px solid";
                document.getElementById("userPw").style.borderColor = "red";
                document.getElementById("msgPw").innerHTML = "8자 이상의 영문, 숫자, 특수문자를 혼합하여 만들어주세요";
            }
        }
        /*비밀번호 확인검사*/
        var userpwCheck = document.getElementById("pwCheck");
        userpwCheck.onkeyup = function() {
            var regex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{10,12}$/.test(userPw);
            if(document.getElementById("pwCheck").value == document.getElementById("userPw").value ) {
                document.getElementById("pwCheck").style.border = "2px solid";
                document.getElementById("pwCheck").style.borderColor = "#29e2a2";
                document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
            } else {
                document.getElementById("pwCheck").style.border = "2px solid";
                document.getElementById("pwCheck").style.borderColor = "red";
                document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
            }
        }      
	</script>
	
	<!-- 도로명주소api -->
	<script>	
		function goPopup(){
			var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		}
		
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.regForm.userAddrBasic.value = roadAddrPart1+roadAddrPart2;
			document.regForm.userAddrDetail.value = addrDetail;
			document.regForm.userAddrzipNum.value = zipNo;	
		}
	
	</script>
	
	<!-- 회원가입 실패시 -->
	<script>
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
		}
	</script>
	
	<!-- 아이디중복체크 -->
	<script>
		function idcheck(){
			var userId = $("#userId").val();
			if(userId == ''){
				alert("아이디를 입력하세요");
			}else{
				$.getJSON(
					"idCheck/"+userId,
					function(data){
						if(data == 0){
							alert("사용 가능한 아이디입니다.");
							$("#userId").attr("readonly","readonly");
						}else{
							alert("중복된 아이디입니다.");
							$("#userId").focus();
						} 
					}
					
				)	
			}
			
		}
	
		
	</script>

</body>
</html>