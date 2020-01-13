<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <!-- <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>  -->
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    
    <!--개인 스타일-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css">
 	<style>
 		#reserveAdult,#reserveKid,#reserveBaby,#reserveRequire{
 			border:1px solid #777;
 		}
 	</style>

</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

    <section>
        <div class="container-fluid po">
            <div class="row">
            	<div class="col-xs-12 col-md-2 menu-po" id="menu-po">
            		<ul class="navi" id="navi">
				        <li class="group">
				            <div class="title">예약 관리</div>
				            <ul class="sub">
				            	<li><a href="${pageContext.request.contextPath }/admin/adminReserve">객실 신청 현황</a></li>
				                <li><a href="${pageContext.request.contextPath }/admin/adminMain">현재 예약 현황</a></li>
				                <li><a href="${pageContext.request.contextPath }/admin/adminTotal">예약기록</a></li>
				            </ul>
				        </li>
				        <li class="group">
				            <div class="title">객실관리</div>
				            <ul class="sub">
				                <li><a href="${pageContext.request.contextPath }/admin/adminRoomList">객실 목록</a></li>
				                <li><a href="${pageContext.request.contextPath }/admin/adminRoomRegist">객실 등록</a></li>                
				            </ul>
				        </li>
				        <li class="group">
				            <div class="title">스페셜오퍼 관리</div>
				            <ul class="sub">
				                <li><a href="${pageContext.request.contextPath }/admin/adminSpecialList">스페셜오퍼 목록</a></li>                
				                <li><a href="${pageContext.request.contextPath }/admin/adminSpecialRegist">스페셜오퍼 등록</a></li>    
				            </ul>
				        </li>        
				    </ul>
            	</div>
            	<div  class="col-xs-12 col-md-10 review">
                   
                    <div class="titlebox">
                        	<div class="dropdown drop">
							  <button class="dropdown-toggle drop-btn" type="button" data-toggle="dropdown">
							  	관리자 페이지
							  	<span class="caret" style="margin-left: 10px"></span>
							  </button>
								<ul class="dropdown-menu drop-ti">
									<li class="dropdown-header" style="background-color: #d0baa85e;">예약 관리</li>
									<li><a href="${pageContext.request.contextPath }/admin/adminReserve">객실 신청 현황</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/adminMain">현재 예약 현황</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/adminTotal">예약기록</a></li>
									<li class="dropdown-header" style="background-color: #d0baa85e;">객실 관리</li>
									<li><a href="${pageContext.request.contextPath }/admin/adminRoomList">객실 목록</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/adminRoomRegist">객실 등록</a></li>
									<li class="dropdown-header" style="background-color: #d0baa85e;">스페셜오퍼 관리</li>
									<li><a href="${pageContext.request.contextPath }/admin/adminSpecialList">스페셜오퍼 목록</a></li>
									<li><a href="${pageContext.request.contextPath }/admin/adminSpecialRegist">스페셜오퍼 등록</a></li>
								</ul>
							</div>
                        	<p>현재 예약 현황</p>
                    		<div class="col-xs-12 col-lg-12 reserveListTit" id="reserve_list">
                      
                        <div class="searchDiv">
	                            <button type="button" class="btn btn-info search" onclick="searchBtn()" >검색</button>
	                            <select class="form-control search s1" id="searchName" name="searchName" style="display: none;">
		                            <option>스탠다드</option>
		                            <option>디럭스</option>
		                            <option>프리미어 디럭스</option>
		                            <option>그랜드</option>
	                         	</select>
	                         	<select class="form-control search s4" id="searchName" name="searchName" style="display: none;">
		                            <option>더블</option>
		                            <option>트윈</option>
		                            <option>패밀리트윈</option>
	                         	</select>
	                         	<select class="form-control search s2" id="searchName" name="searchName" style="display: none;">
		                            <option value="now">예약완료</option>
		                            <option value="delete">예약취소</option>
	                         	</select>
	                         	<input type="text" class="search s3" name="searchName" id="searchName">
	                         	<input type="hidden" value="searchName" class="s5">
	                           	<select class="form-control search" id="sel1" name="searchType" onChange='javascript:change(this);'>
									<option value="예약번호" selected="selected">예약번호</option>
		                            <option value="예약자명">예약자명</option>
		                            <option value="객실정보">객실정보</option>
		                            <option value="침대정보">침대정보</option>
		                            <option value="예약상태">예약상태</option>
		                            <option value="체크인">체크인</option>
		                            <option value="체크아웃">체크아웃</option>
	                         	</select>
	                    </div>
                    </div>
		                    <div class="reserveList">
								
			                        <table class="table table-hover">
			                            <thead class="reviewThead">
			                                <tr>
			                                    <th>예약 번호</th>
			                                    <th>예약자명</th>
			                                    <th>객실 정보</th>
			                                    <th>침대 정보</th>
			                                    <th>체크인/아웃</th>
			                                    <th>예약 상태</th>
			                                </tr>
			                            </thead>
			                            <tbody id="tableTbody">
			
			                            </tbody>
			                        </table>
		                       
		                    </div>
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
                                <div class="title" id="headerTitleArea">예약확인/수정/취소<button type="button" class="close" data-dismiss="modal">&times;</button></div>
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
	                                        </tr>
	                                    </thead>
	                                    <tbody id="tbody-re">
	                                       
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
                                    <tbody id="tbody-pay">

                                    </tbody>
                                </table>
                                
                                <button class="btn btn-success" id="aa" onclick="reDelete()" style="float: right; background-color: #d0baa8; border: 0; font-weight: bold; margin-left: 5px;">예약취소</button>
                                <button type="button" class="btn btn-success" id="bb" onclick="reUpdate()" style="float: right; background-color: #d0baa8; border: 0; font-weight: bold;">예약수정</button>
	                              
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	  <script>
    	$(document).ready(function(){
    		var msg = '${msg}';
    		if(msg != ''){
    			alert(msg);
    		}
    		reservegetList();
    	});
    	
    	//검색
		var searchType="searchType";
		var searchName="searchName";
		 function searchBtn(){
			 searchType=$("#sel1").val();
			 
			 if(searchType == '객실정보'){
				 searchName=$(".s1").val();
			 }else if(searchType == '침대정보'){
				 searchName=$(".s4").val();
			 }else if(searchType == '예약상태'){
				 searchName=$(".s2").val();
			 }else if(searchType == '예약자명' || searchType == '체크인' ||searchType == '체크아웃'){
				 searchName=$(".s3").val();
				 if(searchName == ''){
					 searchName=$(".s5").val();
				 }
			 }else{//예약번호
				 searchName=$(".s3").val();
				 if(searchName == ''){
					 searchName=$(".s5").val();
				 }
			 }
			 searchTyp=searchType.replace(/(\s*)/g,"");
			 searchName=searchName.replace(/(\s*)/g,"");
			 if(searchName == 'searchName' || searchName == ''){
				 searchType="searchType";
				 searchName="searchName";
			 } 
			 
			 reservegetList();
			 console.log(searchType);
			 console.log(searchName);
		 }
		 
		 //검색창변경
		 function change(obj){
	    		var getObj = obj[obj.selectedIndex].innerHTML;
	    		//console.log(getObj);
				if(getObj == '예약번호' || getObj == '예약자명' || getObj == '체크인' || getObj == '체크아웃'){
					$(".s1").css("display","none");
					$(".s2").css("display","none");
					$(".s3").css("display","inline");
					$(".s4").css("display","none");
				}else if(getObj == '객실정보'){
					$(".s1").css("display","inline");
					$(".s2").css("display","none");
					$(".s3").css("display","none");
					$(".s4").css("display","none");
				}else if(getObj == '침대정보'){
					$(".s1").css("display","none");
					$(".s2").css("display","none");
					$(".s3").css("display","none");
					$(".s4").css("display","inline");
				}else if(getObj == '예약상태'){
					$(".s1").css("display","none");
					$(".s2").css("display","inline");
					$(".s3").css("display","none");
					$(".s4").css("display","none");
				}
	    		
	    	}
		 
    	//예약리스트화면 출력
    	function reservegetList(){
    		$.getJSON(
    			"reservegetList/"+searchType+"/"+searchName,
   				function(data){
    				console.log(data);
   					var str="";
   					for(var i=0;i<data.length;i++){
    					console.log(data[i]);
    					str +="<tr>";
    					str +="<td><a id='td-12' href='"+data[i].reserveNum+"'>"+data[i].reserveNum+"</a></td>";
    					str +="<td>"+data[i].userId+"</td>";
    					str +="<td>"+data[i].roomType+"</td>";
    					str +="<td>"+data[i].bedType+"</td>";
    					str +="<td>"+data[i].reserveCheckin+"~"+data[i].reserveCheckout+"</td>";
    					if(data[i].reserveState == 'now'){
	    					str +="<td>예약완료</td>";
    					}else if(data[i].reserveState == 'past'){
    						str +="<td>이용완료</td>";
    					}else if(data[i].reserveState == 'pay'){
    						str +="<td>결제완료</td>";
    					}else{
    						str +="<td>예약취소</td>";
    					}
    					str +="</tr>";
   					}
   					$("#tableTbody").html(str);
   				}
   			)	
    			
   		}
    		
    		//모달창 띄우기
    		$("#tableTbody").on("click","a",function(event){
    			event.preventDefault(); //a태그 이동 막음
    			console.log(event.target.getAttribute("href"));
    			var reserveNum=event.target.getAttribute("href");
    			$("#reserveModal").modal("show");
    			reservemodal(reserveNum);
    		})
    	
    //모달창 화면 출력
	function reservemodal(reserveNum){
		$.getJSON(
			"reservemodal/"+reserveNum,
			function(data){
				console.log(data);
				var str="";
				var str2="";
				var str3="";
				var roomNum=data.roomNum;
				if(roomNum == 0){
					roomNum="배정된 객실이 없습니다";
				}
				
				str += "<form action='reserveUpdate' id='regForm' name='regForm' method='post'>";
				str += "<tr>";
				str += "<td>객실 번호</td>";
				str += "<td><input type='text' id='roomNum' name='roomNum' value='"+roomNum+"' readonly></td>";
				str += "</tr>";
				str += "<tr>";
				str += "<td>예약자</td>";
				str += "<td><input type='text' id='userId' name='userId' value='"+data.userId+"' readonly></td>";
				str += "</tr>";
				str += "<tr>";
				str += "<td>예약 상태</td>";
				if(data.reserveState == 'now'){
					str +="<td><input type='text' value='예약완료' readonly></td>";
				}else if(data.reserveState == 'past'){
					str +="<td><input type='text' value='이용완료' readonly></td>";
				}else if(data.reserveState == 'pay'){
					str +="<td><input type='text' value='결제완료' readonly></td>";
				}else{
					str +="<td><input type='text' value='예약취소' readonly></td>";
				}
				str += "</tr>";
				str += "<tr>";
				str += "<td>예약 번호</td>";
				str += "<td><input type='text' value='"+data.reserveNum+"' readonly id='reserveNum' name='reserveNum'></td>";
				str += "</tr>";
				str += "<tr>";
				str += "<td>체크인</td>";
				str += "<td><input type='text' id='reserveCheckin' name='reserveCheckin' value='"+data.reserveCheckin+"' readonly></td>";
				str += "</tr>";
				str += "<tr>";
				str += "<td>체크아웃</td>";
				str += "<td><input type='text' id='reserveCheckout' name='reserveCheckout' value='"+data.reserveCheckout+"' readonly></td>";
				str += "</tr>";
				str += "<tr>";
				str += "<td>객실 타입</td>";
				str += "<td><input type='text' id='roomType' name='roomType' value='"+data.roomType+"' style='width:100px;' readonly></td>";
				str += "</tr>";
				str += "<td>침대 타입</td>";
				str += "<td><input type='text' id='bedType' name='bedType' value='"+data.bedType+"' style='width:100px;' readonly></td>";
				str += "</tr>";
				str += "<tr>";
				str += "<td>투숙객</td>";
				str += "<td>";
				str += "성인:<input type='text' value='"+data.reserveAdult+"' id='reserveAdult' name='reserveAdult' style='width: 25px'>";
				str += "어린이:<input type='text' value='"+data.reserveKid+"' id='reserveKid' name='reserveKid' style='width: 25px'>";
				str += "유아:<input type='text' value='"+data.reserveBaby+"' id='reserveBaby' name='reserveBaby' style='width: 25px'> ";
				str += "</td>";
				str += "</tr>";
				str += "</tr>";
				str += "<tr>";
				str += "<td>요청 사항</td>";
				str += "<td><input type='text' id='reserveRequire' name='reserveRequire' value='"+data.reserveRequire+"'></td>";
				str += "</tr>";
				str += "</form> ";
				
				str2 += "<tr>";
				str2 += "<td>결제 날짜</td>";
				str2 += "<td><input type='text' value='"+data.reserveDate+"' readonly></td>";
				str2 += "</tr>";
				str2 += "<tr>";
				str2 += "<td>결제 내역</td>";
				str2 += "<td><input type='text' value='"+data.hotelPrice+"원' readonly style='width: 70px'></td>";
				str2 += "</tr>";
				
				str3 += "<tr>";
				str3 += "<td>예약자명</td>";
				str3 += "<td><input type='text' value='"+data.reserveName+"' readonly></td>";
				str3 += "</tr>";
				str3 += "<tr>";
				str3 += "<td>전화번호</td>";
				str3 += "<td>";
				str3 += "<input type='text' value='"+data.reservePhone1+"' style='width: 35px' readonly>";
				str3 += "-<input type='text' value='"+data.reservePhone2+"' style='width: 35px' readonly>";
				str3 += "-<input type='text' value='"+data.reservePhone3+"' style='width: 35px' readonly>";
				str3 += "</td>";
				str3 += "</tr>";
				str3 += "<tr>";
				str3 += "<td>이메일</td>";
				str3 += "<td>";
				str3 += "<input type='text' value='"+data.reserveEmail1+"' style='width: 55px' readonly>";
				str3 += "@<input type='text' value='"+data.reserveEmail2+"' style='width: 85px' readonly>";
				str3 += "</td>";
				str3 += "</tr>";
				
				$("#tbody-re").html(str);
				$("#tbody-pay").html(str2);
				$("#tbody-user").html(str3);
				
				$("#tbody-re").html(str);
				$("#tbody-pay").html(str2);
				
				 
				//예약수정,취소 버튼 숨기기(취소된 예약 경우)
				if(data.reserveState == 'delete'){
					$("#aa").css("display","none");
					$("#bb").css("display","none");
				}else{
					$("#aa").css("display","inline");
					$("#bb").css("display","inline");
				}
			}
		)
	}
    		
		 //모달창 수정(예약 수정)
    	function reUpdate(){
    		if($("#reserveAdult").val() == ''){
    			$("#reserveAdult").css("border-color","salmon");
    			alert("객실에 묵을 인원수를 입력하세요(성인)");
    			$("#reserveAdult").attr("placeholder","체크아웃시간을 입력하세요");
    		}else if($("#reserveKid").val() == ''){
    			$("#reserveKid").css("border-color","salmon");
    			alert("객실에 묵을 인원수를 입력하세요(어린이)");
    		}else if($("#reserveBaby").val() == ''){
    			$("#reserveBaby").css("border-color","salmon");
    			alert("객실에 묵을 인원수를 입력하세요(유아)");
    		}else if($("#reserveRequire").val() == ''){
    			$("#reserveRequire").css("border-color","salmon");
    			alert("요청사항을 입력하세요");
    		}else{
    			if(confirm("수정하시겠습니까?")){
    				
    				var data={'reserveCheckin':$("#reserveCheckin").val(),
    						'reserveCheckout':$("#reserveCheckout").val(),
    						'reserveAdult':$("#reserveAdult").val(),
    						'reserveKid':$("#reserveKid").val(),
    						'reserveBaby':$("#reserveBaby").val(),
    						'roomType':$("#roomType").val(),
    						'bedType':$("#bedType").val(),
    						'reserveNum':$("#reserveNum").val(),
    						'reserveRequire':$("#reserveRequire").val()
    						}
    				
    				$.ajax({
    					type:"PUT",
    					url: "reserveUpdate",
    					data:JSON.stringify(data),
    					contentType:"application/json; charset=utf-8",
    					success:function(result){
    						if(result){ //수정 성공
    							alert("예약 수정이 완료되었습니다.");
    							$("#reserveModal").modal("hide");
    							reservegetList();
    						}else{ //수정 실패
    							alert("예약 수정이 실패되었습니다.");	
    							$("#reserveModal").modal("hide");
    							reservegetList();
    						}
    					},
    					error:function(status){
    						alert("다시 시도해 주세요: "+status);
    					}
    				})
    			}
    		}
    		
    	}
		  
		 //모달창 삭제(예약 삭제)
		 function reDelete(){
			 var reserveNum=$("#reserveNum").val();
			 console.log(reserveNum);
			 if(confirm('예약을 취소하시겠습니까?')){
				 
				 $.ajax({
					type:"DELETE",
					url: "reserveDelete/"+reserveNum,
					//data:JSON.stringify({'reserveNum':reserveNum}),
					contentType:"application/json; charset=utf-8",
					success:function(result){
						if(result){ //삭제 성공
							alert("예약 취소가 완료되었습니다.");
							$("#reserveModal").modal("hide");
							reservegetList();
						}else{ //삭제 실패
							alert("예약 취소가 실패되었습니다.");	
							$("#reserveModal").modal("hide");
							reservegetList();
						}
					},
					error:function(status){
						alert("다시 시도해 주세요: "+status);
					}
				})
				}
		 }
    </script>

	<!-- 좌측 메뉴바 -->
	<script>
		$(document).ready(function() {

			//모든 서브 메뉴 감추기
			$(".sub").css({
				display : "none"
			});

			$(".title").click(function() {
				$(".sub").each(function() {
					if ($(this).css("display") == "block") {
						$(".sub").slideUp("fast");
					}
				});
				if ($(this).next("ul").css("display") == "block") {
					$(".sub").slideUp("fast");
					return;
				}
				//현재 요소의 다음 요소를 보이게 합니다.
				$(this).next("ul").slideDown("fast");
			})
			
		});
	</script>



	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>