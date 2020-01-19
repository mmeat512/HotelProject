<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

    <!--calendar-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!--개인 디자인-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/myList.css" rel="stylesheet">
    <script scr="//code.jquery.com/jquery-1.12.4.min.js"></script>


</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <section>
        <div class="container tab">
            <h2 class="mypage-tit">마이 페이지</h2>
            <ul class="nav nav-tabs mypage-tog">
                <li class="col-xs-3 col-md-3 col-sm-3 col-lg-3"  id="mypage"><a data-toggle="tab" href="#menu1">정보 수정</a></li>
                <li class="col-xs-3  col-md-3 col-sm-3  col-lg-3 "  id="reserve"><a data-toggle="tab" href="#home">예약 현황</a></li>
                <li class="col-xs-3  col-md-3 col-sm-3  col-lg-3 " id="qna"><a data-toggle="tab" href="#menu2">내 문의</a></li>
                <li class="col-xs-3  col-md-3 col-sm-3  col-lg-3 " id="review"><a data-toggle="tab" href="#menu3">내 후기</a></li>
            </ul>
            <div class="col-xs-12 col-sm-12 section-inner tab-content">
                <div id="home" class="tab-pane fade">
                    <h3>예약 현황</h3>
                    <div class="reserve_List">
                    <div class="col-xs-12 col-lg-12 reserveListTit" id="reserve_list"">
                        <ul>
                            <li class="reserveListTot2"><span id="reserveListTot">최근 6개월 간의 이용 내역만 조회됩니다</span></li>
                        </ul>
                    </div>
                    </div>
                    <div class="reserveList">

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>예약 번호</th>
                                    <th>객실 정보</th>
                                    <th>체크인/아웃</th>
                                    <th>예약 현황</th>
                                </tr>
                            </thead>
                            <c:forEach var="reserveList" items="${reserveList }">
                            <tbody>
                                <tr>
                                    <td><a href="${reserveList.reserveNum }">${reserveList.reserveNum }</a></td>
                                    <td>${reserveList.roomType } ${reserveList.bedType }</td>
                                    <td>${reserveList.reserveCheckin } - ${reserveList.reserveCheckout }</td>
									<td>${reserveList.reserveState }</td>
                                </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>

                <div id="menu1" class="tab-pane fade  in active">
                    <h3>정보 수정</h3>
                    <div class="col-xs-12 col-md-9 join-inner">
                        <div class="inner">
                        	<form action="userDelete" method="post" name="regForm">
                                <label>아이디</label>
                                <div class="inner-id">
                                    <input type="text" class="inid" value="${uservo.userId }" id ="userId" name="userId" readonly>
                                </div>
                                <div class="inner-pw">
                                    <label>비밀번호</label>
                                    <input type="password" class="in" name="userPw" id="userPw">
                                </div>
                                <div class="inner-pw-ck">
                                    <label>비밀번호 확인</label>
                                    <input type="password" class="in" id="userPwCheck">
                                </div>
                                <div class="inner-name">
                                    <label>이름</label>
                                    <input type="text" class="in" value="${uservo.userName}" name="userName" id="userName">
                                </div>
                                <div class="inner-engname">
                                    <label>영문이름</label>
                                    <input type="text" class="in" value="${uservo.userEngName}" name="userEngName" id="userEngName">
                                </div>
                                <label>주소</label>
                                <div class="inner-addr1">
                                    <input type="text" placeholder="우편번호" class="inzip" value="${uservo.userAddrzipNum}" name="userAddrzipNum" id = "userAddrzipNum" readonly>
                                    <div class="inner-addr-btn">
                                        <button type="button" style="font-weight: bold" onclick="goPopup()">우편번호 찾기</button>
                                    </div>
                                </div>
                                <div class="inner-addr2">
                                    <input type="text" placeholder="기본주소" class="in" value="${uservo.userAddrBasic}" name="userAddrBasic" id="userAddrBasic">
                                </div>
                                <div class="inner-addr3">
                                    <input type="text" placeholder="상세주소" class="in" value="${uservo.userAddrDetail}" name="userAddrDetail" id="userAddrDetail">
                                </div>
                                <div class="inner-phone">
                                    <label style="display: block">휴대전화</label>
                                    <select style="border: 1px solid #ddd" class="td03" name="userPhone1" id="userPhone1">
                                        <option ${uservo.userPhone1 eq 010 ? 'selected' : ''}>010</option>
                                        <option ${uservo.userPhone1 eq 011 ? 'selected' : ''}>011</option>
                                        <option ${uservo.userPhone1 eq 017 ? 'selected' : ''}>017</option>
                                        <option ${uservo.userPhone1 eq 018 ? 'selected' : ''}>018</option>
                                    </select>
                                    - <input type="text" class="td3" value="${uservo.userPhone2 }" name="userPhone2" id="userPhone2">
                                    - <input type="text" class="td3" value="${uservo.userPhone3 }" name="userPhone3" id="userPhone3">
                                </div>
                                <div class="inner-email">
                                    <label>이메일</label>
                                    <input type="text" class="td4" value="${uservo.userEmail1 }" name="userEmail1" id="userEmail1">@
                                    <select style="border: 1px solid #ddd" class="td4" name="userEmail2" id="userEmail2">
                                        <option ${uservo.userEmail2 eq 'naver.com' ? 'selected' : ''}>naver.com</option>
                                        <option ${uservo.userEmail2 eq 'gmail.com' ? 'selected' : ''}>gmail.com</option>
                                        <option ${uservo.userEmail2 eq 'daum.net' ? 'selected' : ''}>daum.net</option>
                                        <option ${uservo.userEmail2 eq 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
                                        <option ${uservo.userEmail2 eq 'nate.com' ? 'selected' : ''}>nate.com</option>
                                    </select>
                                </div>
                                <div class="inner-birth">
                                    <label>생년월일</label>
                                    <select style="border: 1px solid #ddd" class="td5" name="userBirth1" id="userBirth1">
                                        <c:forEach var="year" begin="1950" end="2019"> 
                                        	<option ${uservo.userBirth1 eq year ? 'selected' : '' }>${year }</option>
                                        </c:forEach>
                                    </select>년
                                    <select style="border: 1px solid #ddd" class="td5" name="userBirth2" id="userBirth2">
                                        <c:forEach var="month" begin="1" end="12">
                                        	<option ${uservo.userBirth2 eq month ? 'selected' : '' }>${month }</option>
                                        </c:forEach>
                                    </select>월
                                    <select style="border: 1px solid #ddd" class="td5" name="userBirth3" id="userBirth3">
                                        <c:forEach var="day" begin="1" end="31">
                                        	<option ${uservo.userBirth3 eq day ? 'selected' : '' }>${day }</option>
                                        </c:forEach>
                                    </select>일
                                </div>
	                            <div class="btn-cl">
	                                <button type="button" class="update-btn" style="font-weight: bold" onclick="userUpdateBtn()">수정</button>
	                                <button type="button" class="delete-btn"  style="font-weight: bold" onclick="userDeleteBtn()">탈퇴</button>
	                            </div>
	                          </form>
                        </div>
                    </div>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h3>내 문의</h3>
                    <div class="col-xs-12 col-lg-12 reserveListTit" id="reserve_list">
                        <ul>
                        </ul>
                    </div>
                    <div class="col-xs-12 col-lg-12 qnaListTit" id="myQna_list">
                        <table class="table table-hover" id="myQnaTable">
                            <colgroup>
                                <col style="width: 17%;">
                                <col style="width: 21%;">
                                <col style="width: 21%;">
                                <col style="width: 28%;">
                                <col style="width: 13%;">
                            </colgroup>
                            <thead class="myQnaThead">
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>질문 유형</th>
                                    <th>작성일</th>
                                    <th>답변</th>
                                </tr>
                            </thead>
                            <c:forEach var="qnaList" items="${qnaList }">
                            <tbody>
                                <tr>
                                    <td>${qnaList.qnaBno }</td>
                                    <td><a href='../qna/qnaDetail?qnaBno=${qnaList.qnaBno }'>${qnaList.qnaTitle }</a></td>
                                    <td>
                                    	<c:if test="${qnaList.qnaType eq '1' }">
                                    	객실문의
                                    	</c:if>
                                    	<c:if test="${qnaList.qnaType eq '2' }">
                                    	멤버쉽문의
                                    	</c:if>
                                    	<c:if test="${qnaList.qnaType eq '3' }">
                                    	예약번호
                                    	</c:if>
                                    	<c:if test="${qnaList.qnaType eq '4' }">
                                    	홈페이지 오류
                                    	</c:if>
                                    	<c:if test="${qnaList.qnaType eq '5' }">
                                    	컴플레인
                                    	</c:if>
                                    	<c:if test="${qnaList.qnaType eq '6' }">
                                    	기타
                                    	</c:if>
                                    </td>
                                    <td><fmt:formatDate value="${qnaList.qnaDate }" type="both"></fmt:formatDate></td>
                                    <td><span class="extraImages">
                                    <c:if test="${qnaList.qnaAnswer eq 'ok'}">
                                    <img class="secret" src="${pageContext.request.contextPath }/resources/img/circle.png">
                                    </c:if>
                                    <c:if test="${qnaList.qnaAnswer eq 'no'}">
                                    <img class="secret" src="${pageContext.request.contextPath }/resources/img/cross.png">
                                    </c:if>
                                    
                                    </span></td>
                                </tr>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <h3>내 후기</h3>
                    <div class="col-xs-12 col-lg-12 reserveListTit" id="reserve_list">
                    </div>
                    <div class="col-xs-12 col-lg-12 reviewListTit" id="myReview_list">
                        <table class="table table-hover" id="myReviewTable">
                            <colgroup>
                                <col style="width: 24%;">
                                <col style="width: 28%;">
                                <col style="width: 29%;">
                                <col style="width: 20%;">
                            </colgroup>
                            <thead class="myReviewThead">
                                <tr>
                                    <th>글번호</th>
                                    <th>제목</th>
                                    <th>작성일</th>
                                    <th>평점</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="vo" items="${reviewList }">
                                <tr class="detailP">
                                    <td>${vo.reviewBno }</td>
                                    <td><a href="${vo.reviewBno }" id="detailModal">${vo.reviewTitle }</a></td>
                                    <td><fmt:formatDate value="${vo.reviewDate }" type="both"/></td>
                                    <td class="starR" style="color: #F2CF1F">
		                            	<c:forEach var="star" begin="1" end="${vo.reviewRate }">
		                            		★
		                            	</c:forEach>
		                            	<c:forEach var="astar" begin="${vo.reviewRate+1}" end="5" >
		                            		☆
		                            	</c:forEach>	
                                   	</td>
                                </tr>
                           </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 모달 -->
    <div class="modal fade" id="reserveModal" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body row">
                    <div class="modal-reserve col-sm-8 col-xs-8">
                        <div id="header_box">
                            <header id="headerTitle" class="rev_headertitle_box">
                                <div class="title" id="headerTitleArea">예약확인/취소<button type="button" class="close" data-dismiss="modal">&times;</button></div>
                            </header>
                        </div>
                        <div class="container modal-reserve-container">
                            <div class="col-xs-12 col-sm-12 col-xs-12 ">
                                <h4 style="font-weight: bold">예약정보</h4>

                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="reserve-modal-th">예약현황</th>
                                            <th class="reserve-modal-th"></th>
                                            <input type="hidden" id="roomNum" name="roomNum" value="0">
                                 			<input type="hidden" id="userId" name="userId" value="${sessionScope.userId }">
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>예약자</td>
                                           <td><input type="text" id="reserveName" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>예약 상태</td>
                                            <td><input type="text" id="reserveState" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>예약 번호</td>
                                            <td><input type="text" id="reserveNum" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>체크인</td>
                                            <td><input type="text" id="reserveCheckin" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>체크아웃</td>
                                            <td><input type="text" id="reserveCheckout" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>객실 타입</td>
                                            <td>
                                            <input type="text" id="roomType" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                        	<td>침대 타입</td>
                                        	<td>
                                            <input type="text" id="bedType" readonly>
                                        	</td>
                                        </tr>
                                        <tr>
                                            <td>투숙객</td>
                                            <td>성인:<span id="reserveAdult"></span> / 어린이:<span id="reserveKid"></span>/ 유아:<span id="reserveBaby"></span></td>
                                        </tr>
                                        <tr>
                                            <td>요청 사항</td>
                                            <td><input type="text" id="reserveRequire" readonly></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <h4 style="font-weight: bold">예약자</h4>
                                   <table class="table table-bordered">
                                       <thead>
                                           <tr>
                                               <th class="reserve-modal-th">예약자정보</th>
                                               <th class="reserve-modal-th"></th>
                                           </tr>
                                       </thead>
                                       <tbody>
                                        <tr>
                                            <td>예약자 번호</td>
                                            <td><span id="reservePhone1"></span>-<span id="reservePhone2"></span>-<span id="reservePhone3"></span></td>
                                        </tr>
                                        <tr>
                                            <td>예약자 이메일</td>
                                            <td><span id="reserveEmail1"></span>@<span id="reserveEmail2"></span></td>
                                        </tr>
                                    </tbody>
                                       <tbody id="tbody-user">
                                       </tbody>
                                   </table>
                                <h4 style="font-weight: bold">요금상세</h4>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="reserve-modal-th">결제현황</th>
                                            <th class="reserve-modal-th"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>결제 날짜</td>
                                            <td><input type="text" id="reserveDate" readonly></td>
                                        </tr>
                                        <tr>
                                            <td>결제 내역</td>
                                            <td><span>KRW　</span><input type="text" id="reservePay" value="0" readonly></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class="btn btn-success" id="reserveDelete" style="float: right; background-color: #d0baa8; border: 0; font-weight: bold;">예약취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 내 후기 모달창 -->
    <div class="container">
		<!-- Modal -->
		<div class="modal fade" id="reviewModal" role="dialog"
			data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-lg">

				<!-- Modal content-->
				<div class="modal-content reviewModal-content"></div>
			</div>
		</div>
	</div>


<jsp:include page="../include/footer.jsp"></jsp:include>

    <!-- 예약모달 -->
    <script>
    $(".reserveList").on("click","a",function(event){
    	console.log($(this));
    	event.preventDefault();
     	var reserveNum = $(this).attr("href");
    	console.log(reserveNum);
    	$.getJSON("userReserveDetail/"+reserveNum,
    		function(data){
			$("#reserveModal").modal('show');
			$("#roomNum").val(data.roomNum);
    		$("#reserveName").val(data.reserveName);
     		if(data.reserveState == 'pay'){
    			$("#reserveDelete").css("display","inline");
    			$("#reserveState").val("결제완료");	
    		}else if(data.reserveState == 'now'){
    			$("#reserveDelete").css("display","inline");
    			$("#reserveState").val("예약완료");	
    		}else if(data.reserveState == 'past'){
    			$("#reserveDelete").css("display","none");
    			$("#reserveState").val("이용완료");	
    		}else if(data.reserveState == 'delete'){
    			$("#reserveDelete").css("display","none");
    			$("#reserveState").val("예약취소");	
    		}
    		$("#reserveNum").val(data.reserveNum);
    		$("#reserveCheckin").val(data.reserveCheckin);
    		$("#reserveCheckout").val(data.reserveCheckout);
    		$("#roomType").val(data.roomType);
    		$("#bedType").val(data.bedType);
    		$("#reserveAdult").html(data.reserveAdult);
    		$("#reserveKid").html(data.reserveKid);
    		$("#reserveBaby").html(data.reserveBaby);
    		$("#reserveRequire").val(data.reserveRequire);
    		$("#reserveDate").val(data.reserveDate);
    		$("#reservePay").val(numberWithCommas(data.hotelPrice));
    		$("#reservePhone1").html(data.reservePhone1);
    		$("#reservePhone2").html(data.reservePhone2);
    		$("#reservePhone3").html(data.reservePhone3);
    		$("#reserveEmail1").html(data.reserveEmail1);
    		$("#reserveEmail2").html(data.reserveEmail2);	
    	}		
    	)
    });
    	 
     /* 예약취소 */
    $("#reserveDelete").click(function(){
    	
    	if(confirm('예약을 취소하시겠습니까?')){
				deleteReserve();    	
    		}
    })
	/* reserve DB에서 데이터 삭제 */
   function deleteReserve(){
    	var reserveNum = $("#reserveNum").val();
    	console.log("예약번호 : " + reserveNum);
    	$.ajax({
    		type:"Delete",
    		url:"reserveDelete/"+reserveNum,
    		data: JSON.stringify
    		({
    			"reserveNum":reserveNum
    		}),
    		contentType : "application/json; charset=utf-8",
    		success:function(result){
    			if(result){
    				$("#reserveModal").modal("hide");
    				alert("예약 취소가 완료되었습니다.");
    				location.reload();

    			}else{
    				alert("예약 취소에 실패하였습니다.");
    			}
    		}
    	})
    };
    
	
    </script>
    <!--reserveList Modal-->
    <script>
      $(document).ready(function(){
    	 var msg = "${msg}";
    	 if(msg != ''){
    		 alert(msg);
    	 }
         var att= '${att}';
         if(att == "mypage"){
            $("#mypage").addClass("in active");
            $("#reserve").removeClass("in active");
            $("#menu1").addClass("in active");
            $("#home").removeClass("in active");
         }else{
            $("#mypage").removeClass("in active");
            $("#reserve").addClass("in active");
            $("#menu1").removeClass("in active");
            $("#home").addClass("in active");
           
         }
		
         var name = "${sessionScope.userId}";
         if(name == "admin"){
        	 $("#mypage").html(" ");
        	 $("#mypage").css("background-color","transparent");
        	 $("#reserve").css("display","none");
        	 $("#qna").css("display","none");
        	 $("#review").css("display","none");
         }else{
        	 $("#reserve").css("display","inline");
        	 $("#qna").css("display","inline");
        	 $("#review").css("display","inline");
         }
      })
    </script>
    
    <!-- 마이페이지 정보 수정 -->
	<script>
		function userUpdateBtn(){
			var userPw = $("#userPw").val();
			var userPwCheck = $("#userPwCheck").val();
			var userName = $("#userName").val();
			var userEngName = $("#userEngName").val();
			var userAddrzipNum = $("#userAddrzipNum").val();
			var userAddrBasic = $("#userAddrBasic").val();
			var userAddrDetail = $("#userAddrDetail").val();
			var userPhone1 = $("#userPhone1").val();
			var userPhone2 = $("#userPhone2").val();
			var userPhone3 = $("#userPhone3").val();
			var userEmail1 = $("#userEmail1").val();
			var userEmail2 = $("#userEmail2").val();
			var userBirth1 = $("#userBirth1").val();
			var userBirth2 = $("#userBirth2").val();
			var userBirth3 = $("#userBirth3").val();
			
			var pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,12}$/.test(userPw);
			if(userPw == '' || !pwCheck){
				alert("비밀번호는 영문(대소문자),숫자,특수문자를 포함한 8~12자 이내로 입력하세요");
				return false;
			}else if( userPw != userPwCheck){
				alert("비밀번호와 비밀번호확인란이 다릅니다");
				return false;
			}else if(userName == ''){
				alert("이름은 필수사항입니다.");
				return false;
			}else if(userEngName == ''){
				alert("영문이름은 필수사항입니다.");
				return false;
			}else if(userAddrzipNum == '' ||userAddrBasic == '' ||userAddrDetail == ''){
				alert("주소는 필수사항입니다.");
				return false;
			}else if(userPhone2 == '' || userPhone3 == ''){
				alert("전화번호는 필수사항입니다.");
				return false;
			}else if(userEmail1 == ''){
				alert("이메일은 필수사항입니다.");
				return false;
			}
			var userId = $("#userId").val();
			var json = {"userId":userId,
						"userPw":userPw,
						"userName":userName,
						"userEngName":userEngName,
						"userAddrzipNum":userAddrzipNum,
						"userAddrBasic":userAddrBasic,
						"userAddrDetail":userAddrDetail,
						"userPhone1":userPhone1,
						"userPhone2":userPhone2,
						"userPhone3":userPhone3,
						"userEmail1":userEmail1,
						"userEmail2":userEmail2,
						"userBirth1":userBirth1,
						"userBirth2":userBirth2,
						"userBirth3":userBirth3}
			
			if(confirm("수정하시겠습니까?")){
				$.ajax({
					type:"POST",
					url:"userUpdate",
					data:JSON.stringify(json),
					contentType:"application/json; charset=utf-8",
					success:function(result){
						if(result == 'success'){
							alert("회원정보가 수정되었습니다.");
		    				location.reload();
						}else{
							alert("정보수정에 실패했습니다.");
						}
					},
					error:function(status){
						alert("다시시도해주세요"+status);
					}
				})
			}
		}
	</script>
	
	<script>
		function userDeleteBtn(){
			var userPw = $("#userPw").val();
			var userPwCheck = $("#userPwCheck").val();
			if(userPw == ''|| userPwCheck == ''){
				alert("비밀번호와 비밀번호확인란을 작성해주세요");
				return false;
			}else if(userPw != userPwCheck){
				alert("비밀번호와 비밀번호확인란이 다릅니다");
				return false;
			}
			if(confirm("삭제하시겠습니까?")){
				document.regForm.submit();
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

	<!-- 내 후기 -->
  <script>
  $(document).ready(function(){
  	$(".detailP").on("click","#detailModal",(function(event){
  		event.preventDefault();
  		var reviewbno = $(this).attr("href");
   		$.getJSON(
  			"../review/detail/" + reviewbno,
  			function(data){
  	  			$(".reviewModal-content").html(modalDetail(data));
  	          	$("#reviewModal").modal("show");
  			}
  		) 
  		
  	}))
  })
  
  	//모달디테일
  	function modalDetail(data){
		var str = "";
		console.log(data);
			var reviewId = data.reviewId;
			var userId = '${sessionScope.userId}';
			console.log(userId);
          str +="<div class='modal-header'>";
	        str +="<button type='button' class='close modalclose' data-dismiss='modal'>&times;</button>";
	        str +="<h4 class='modal-title' style='display: inline-block;'>"+data.reviewTitle+"</h4>";
	        str +="<small style='display: inline-block;margin-left: 15px;margin-right: 10px'>이 리뷰가 도움이 되었나요? </small>";
	        str +="<img class='emptylike' src='${pageContext.request.contextPath }/resources/img/emptylike.png' style='width:20px;'>";
	        str +="<strong class='likehit' style='margin-left: 5px;'>"+data.likeHit+"</strong>"
	        str +="</div>";
          str +="<div class='reviewModal-body row'>";
          str +="<div class='col-xs-12 modalContent'style='padding:10px 10px 15px 10px;'>";
          
          if(data.reviewfilename != null){
              str +="<div class='col-md-6 col-xs-12 fileleft'>";
              str +="<img src='../review/viewImg?fileLoca="+data.reviewfileloca+"&filename="+data.reviewfilename+"'>";
           	str +="</div>";
           	str +="<div class='col-md-6 col-xs-12 contentRight' >";
          }else{
           	str +="<div class='col-xs-12 contentRight' >";
          }
          
       	str +="<div >";
          str +="<div class='detailDate detailValue'>"+timestamp(data.reviewDate)+"</div>";
          str +="<div class='detailValue'>글번호 : "+data.reviewBno+"</div>";
          str +="<div class='detailValue'>작성자 : "+data.reviewId+"</div>";
          str +="<div class='detailValue'>평점 : <span class='starR'>";   
          str +=test(data.reviewRate);
      	str +="</span>";
      	str +="</div>";
          str +="<div class='detailValue'>내용 : "+data.reviewContent+"</div>";
          str +="</div>";
          str +="</div>";
          if(reviewId == userId){
        		str +="<button type='button' class='btn btn-info detailModify' data-dismiss='modal'><a href='"+data.reviewBno+"' style='color:#6d6d6d;'>수정하기</a></button>";
          }
        str +="</div>";
       	str +="<div class='modal-footer row' style='text-align:left; border-top:0px;  padding-bottom: 0px;' >";
        	
       	//댓글창
          str += replyDetail(data.replyvo,1);
          str +="<form id='registForm' method='post' name='registForm'>";
  		if(userId=='admin'){
  			str +="<div class='col-xs-12 replyRegist' style='position: relative; padding: 10px 10px 50px 10px;border-top: 1px solid #ededed;'>";
  		}else{
  			str +="<div class='col-xs-12 replyRegist' style='position: relative; padding: 10px 10px 50px 10px;border-top: 1px solid #ededed; display:none; '>";
  		}
          var media = window.matchMedia("(max-width: 767px)");
          if(media.matches){
              str +="<span class='col-xs-1 replySpan' style='padding:0px; text-align:center; height: 55px;line-height: 55px;'>댓글";
          }else{
          	str +="<span class='col-xs-1 replySpan' style='padding:0px; text-align:center; height: 114px;line-height: 114px;'>댓글";
          }
          str +="</span>";
          str +="<div class='col-xs-11' style='padding:0px 10px;'>";
          str +="<textarea class='form-control' rows='5' id='rContent' name='rContent'>";
          str +="</textarea>";
          str +="</div>";
          
          /* 값 보내기 */
          str +="<input type='hidden' value='"+data.reviewBno+"' name='rBno' id='rBno'>";
          str +="<input type='hidden' value='"+userId+"' name='rId' id='rId'>";
          
          str +="<button type='button' class='btn btn-info' style='position: absolute;top: 130px; right: 20px;' onclick='replyRegist()'>등록하기</button>";
          str +="</div>";
          str +="</form>";
          str +="</div>";
          
          return str;
  	}
  
  	//댓글창
  	function replyDetail(data, reset){
  		var str = "";
  		if(reset==1){
  			str="";
  		}
		var userId = '${sessionScope.userId}';
  		console.log(userId);
	           	for(var i = 0; i < data.length; i++){
		           	if(data[i]==null){
						str +="<div class='col-xs-12 replyRegistView' style='padding-top:10px; border-top:1px solid #e5e5e5;margin-bottom: 20px;display:none;'>";
		           	}else{
		           		str +="<div class='col-xs-12' style='padding-top:10px; border-top:1px solid #e5e5e5;margin-bottom: 20px;'>";
		           	}
					str +="<div class='col-xs-12'style='padding:0px; color:#b39985;'>";
			        str +="<div style='float:left;padding-right: 10px;'>"
			        str +="<img src='${pageContext.request.contextPath }/resources/img/-.png' style='width:20px;'>"
			        str +="</div>";
			        if(data[i] != null){
			        	str +="<div class='rid' style='display:inline-block; color:#b39985;'>"+changeId(data[i].rid)+"</div>";
			        	str +="<small class='rdate' style='margin-left: 10px; color:#333;'>"+timestamp(data[i].rdate)+"</small>";
			        	if(userId=='admin'){
				            str +="<button type='button' class='close replyclose' onclick='replyDelete("+data[i].rnum+")' style='float:right;'>&times;</button>";
			       		}
		            	str +="<div class='col-xs-12 rcontent'style='padding:5px 0px;padding-left: 30px;color:#333;'>"+data[i].rcontent+"</div>";
			        }else{
			        	str +="<div class='rid' style='display:inline-block; color:#b39985;'></div>";
			        	str +="<small class='rdate' style='margin-left: 10px; color:#333;'></small>";
			        	if(userId=='admin'){
				            str +="<button type='button' class='close' onclick='replyDelete()' style='float:right;'>&times;</button>";
			                str +="</div>";
			       		}
		            	str +="<div class='col-xs-12 rcontent'style='padding:5px 0px;padding-left: 30px;color:#333;'></div>";
			        }
	  	            str +="</div>";
	  	          	str +="</div>";
	           	}
	     return str;
  	}

  	//평점
  	function test(rate){
  		var str = "";
        for (var star=1; star<=rate; star++){
        	str += "★";
        }
        for (var star=rate; star<5; star++){
        	str += "☆";
        }
  		return str;
  	}
  	
  </script>
  
  <!-- 모달에서 수정하기페이지로 이동-->
  <script>
  	$(".reviewModal-content").on("click",".detailModify",function(event){
  		event.preventDefault();
  		var reviewbno = $(".detailModify a").attr("href");
		var userId = '${sessionScope.userId}';
  		location.href="../review/reviewDetail?reviewbno="+reviewbno;
  	});
  </script>
  
    <!-- 날짜포맷 -->
  <script>
	$(document).ready(function(){
  		var milis = $(".detailP").children().eq(3).text();
  		console.log(milis);
  		timestamp(milis);

  	})
  	function timestamp(milis){
	  	var date = new Date(milis);//받은날짜
	  	var year = date.getFullYear();
	  	var month = date.getMonth()+1;
		month = month >= 10 ? month : '0' + month;
	  	var day = date.getDate();
	  	day = day >= 10 ? day : '0' + day;
	  	
	  	console.log( year+"-"+month+"-"+day);
	  	return year+"-"+month+"-"+day;
	  	
  	}
  </script>
	<script>
	  function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>





</body></html>