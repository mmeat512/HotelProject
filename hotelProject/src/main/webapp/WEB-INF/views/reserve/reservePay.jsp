<%@page import="org.springframework.expression.ParseException"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/Pay.css" rel="stylesheet">

	<!-- 아임포트 결제api -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	
    <style>
   
    </style>

</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>    
<section>
        <div class="container">
           <div class="row">
              <div class="col-xs-12">
                  <div class="pay-title">
                      <h2>고객 정보 입력</h2>
                  </div>
                  <form action="reserveOrder" id="reserveForm" name="reserveForm" method="post">
                  <div class="col-xs-12 pay-info">
                      <div class="col-xs-12 info-sel">
                          <h4>${reserveVO.roomType } ${reserveVO.bedType }룸</h4>
                          <div class="col-xs-12 sel">
                              <div class="col-xs-12 col-lg-6 sel-img">
                                  <img src="../admin/view?fileLoca=${fileloca }&filename=${filename }&Name=${hotelname }" style="width: 100%">
                              <div class="info-require">
                              	<p class="p1">요청 사항</p>
                              	<textarea rows="3" cols="1" class="requireText" id="reserveRequire" name="reserveRequire"></textarea>
                              </div>
                              </div>
                              <div class="col-xs-12 col-lg-6 sel-info">
                                 <div class="info-ck">
                                      <p class="p1">체크인/체크아웃</p>
                                      <p>${reserveVO.reserveCheckin} / ${reserveVO.reserveCheckout}</p>
                                      <input type="hidden" name="reserveState" value="pay">
                                      <input type="hidden" name="reserveCheckin" value="${reserveVO.reserveCheckin} ">
                                      <input type="hidden" name="reserveCheckout" value="${reserveVO.reserveCheckout}">
                                      <input type="hidden" name="roomType" value="${reserveVO.roomType }">
                                      <input type="hidden" name="bedType" value="${reserveVO.bedType }">
                                      <input type="hidden" id="hotelPrice" name="hotelPrice" value="${hotelprice*1.3 }">
                                 </div>
                                    
 	
                                 <div class="info-pe">
                                      <p class="p1">객실-투숙인원</p>
                                      <p>객실1, 성인${reserveVO.reserveAdult }, 어린이${reserveVO.reserveKid }, 유아${reserveVO.reserveBaby }</p>
                                      <input type="hidden" name="reserveAdult" value="${reserveVO.reserveAdult }">
                                      <input type="hidden" name="reserveKid" value="${reserveVO.reserveKid }">
                                      <input type="hidden" name="reserveBaby" value="${reserveVO.reserveBaby }">
                                 </div>
                                 <div class="info-pay">
                                      <p class="p1">요금상세내역</p>
                                      <div class="pay">
                                          <p class="p2">객실요금　</p><p id="day"></p><p>박</p>
                                          <p  class="p3" id="price"></p><p class="p3">KRW　</p>
                                      </div>
                                      <div class="pay-other">
                                          <p class="p2">세금 및 봉사료</p>
                                          <p class="p3" id="tax"></p><p class="p3">KRW　</p>
                                       </div>
                                 </div>
                                 <div class="info-tot">
                                     <p class="p1">총 예약금액</p>
                                     <p class="p4" id="price2"></p><p class="p4">KRW　</p>
                                 </div>
                              </div>
                              </div>
 
                      </div>
                      <div class="col-xs-12 float">
                      <div class="col-xs-12 col-lg-6 info-cus">
                          <h4>예약자 정보</h4>
                          <div class="col-xs-12 cus">
                              <div class="col-xs-12 cus-name">
                                  <p class="p1">이름</p>
                                  <input type="text" id="reserveName" name="reserveName">
                                  <input type="hidden" id="userId" name="userId" value="${sessionScope.userId }">
                              </div>
                              <div class="col-xs-12 cus-email">
                                  <p class="p1">이메일</p>
                                  <input type="text" id="reserveEmail1" name="reserveEmail1">@
                                <select id="reserveEmail2" name="reserveEmail2">
                                    <option>naver.com</option>
                                    <option>gmail.com</option>
                                    <option>daum.net</option>
                                    <option>hanmail.net</option>
                                    <option>nate.com</option>
                                </select>
                              </div>
                              <div class="col-xs-12 cus-phone">
                                  <p class="p1">연락처</p>
                                  <select class="td03" id="resevePhone1" name="reservePhone1">
                                    <option>010</option>
                                    <option>011</option>
                                    <option>017</option>
                                    <option>018</option>
                                </select>
                                - <input type="text" class="td3" id="reservePhone2" name="reservePhone2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                                - <input type="text" class="td3" id="reservePhone3" name="reservePhone3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                              </div>
                          </div>
                      </div>
                      <div class="col-xs-12 col-lg-6 info-money">
                          <h4>예약</h4>
                          <div class="col-xs-12 money">
                              <button type="button" class="money-btn1" data-toggle="modal" data-target="#moneyModal">무통장 입금</button>
                              <button type="button" class="money-btn2">예약취소</button>
                          </div>
                      </div>
                      </div>
                      
                  </div>
                </form><!-- reserveForm 끝 -->
              </div>
               
           </div>
            
        </div>
    </section>

        
  <script>
  	$(".money-btn1").click(function(){
  		
  		if($("#reserveName").val()==''){
  			alert("예약자 성함을 작성해주세요");
  			$("#reserveName").focus();
  		}else if ($("#reserveEmail1").val() == '') {
			alert("연락 받으실 이메일을 작성해주세요");
			$("#reserveEmail1").focus();
		}else if ($("#reserveEmail2").val() == '') {
			alert("연락 받으실 이메일을 작성해주세요");
			$("#reserveEmail2").focus();
		}else if($("#reservePhone2").val()==''||$("#reservePhone3").val()==''){
  			alert("연락 받으실 연락처를 입력해주세요");
  		}else{
 				//아임포트 결제 api
  				IMP.init('imp27248251'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
  				IMP.request_pay({
  				    pg : 'inicis', // version 1.1.0부터 지원.
  				    pay_method : 'vbank',
  				    merchant_uid : 'merchant_' + new Date().getTime(),
  				    name : '${reserveVO.roomType }'+'${reserveVO.bedType }',
  				    amount : ${hotelprice*1.3},
  				    buyer_email : 'iamport@siot.do',
  				    buyer_name : $("#reserveName").val(),
  				    buyer_tel : $("#resevePhone1")-$("#resevePhone2")-$("#resevePhone3"),
  				    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
  				}, function(rsp) {
  				    if ( rsp.success ) {
  				        var msg = '예약 완료.';
  				        msg += '해당 금액을 입금해주시기 바랍니다.';
  				        $("#reserveForm").submit();
  				    } else {
  				        var msg = '결제에 실패하였습니다.';
  				        msg += '에러내용 : ' + rsp.error_msg;
  				    }
  				    alert(msg);
  				});
  			
  				
  		}
  	})
  	$(".money-btn2").click(function(){
  		history.go(-1);
  	})
  </script>
  <script>
  $("document").ready(function(){
	var day = getDateDiff("${reserveVO.reserveCheckin}", "${reserveVO.reserveCheckout}");	
	//console.log(day);
  	$("#day").html(day);
  	
  	var price = numberWithCommas(${hotelprice});
  	var price2 = numberWithCommas(${hotelprice*1.3});
  	//console.log(price);
  	var tax = numberWithCommas(${hotelprice*0.3});
  	$("#price").html(price);
  	$("#price2").html(price2);
  	$("#tax").html(tax);
  })
  
      function getDateDiff(date1,date2) {
        var arrDate1 = date1.split('-');
        var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1]-1),parseInt(arrDate1[2]));
        var arrDate2 = date2.split('-');
        var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1]-1),parseInt(arrDate2[2]));
        
        var getDiffTime = getDate2.getTime() - getDate1.getTime();
        
        return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
    }
  
  function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
  
  </script>
  
<jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>