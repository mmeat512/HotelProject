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
 		#tdbbt{
 			padding: 0px;
 			vertical-align: center;
 		}
 		.bbt{
 			background-color: #d0baa8;
            border-color: #d0baa8;
            color:#6d6d6d;
            border-radius: 0;
            padding:3px 10px;
            margin-top: 5px;
 		}
 		.bbt:hover,.bbt:focus{
 			background-color: #d0baa8bd;
 			border-color: #d0baa8bd;
 			outline: none;
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
                        	<p>객실 배정</p>
		                    <div class="reserveList">
			                        <table class="table table-hover">
			                            <thead class="reviewThead">
			                                <tr>
			                                    <th>방 번호</th>
			                                    <th>객실 정보</th>
			                                    <th>침대 정보</th>
			                                    <th>객실 배정</th>
			                                </tr>
			                            </thead>
			                            <tbody id="tableTbody">
			
			                            </tbody>
			                        </table>
		                       		<div class="btnBox">
                         				 <button type="button" class="btn btn-info" onclick="location.href='adminReserve'">객실 신청 현황 확인하기</button>
                     				</div>
		                    </div>
                   </div>   
                </div>
                </div>
            </div>
    </section>
    
	  <script>
    	$(document).ready(function(){
    		selectgetList();
    	});
    	
			//예약리스트화면 출력
	    	function selectgetList(){
				var reserveCheckin='${vo.reserveCheckin}';
				var reserveCheckout='${vo.reserveCheckout}';
				var roomType='${vo.roomType}';
				var bedType='${vo.bedType}';
				
				console.log(reserveCheckin);
				console.log(reserveCheckout);
				console.log(roomType);
				console.log(bedType);
	    		var json = {"reserveCheckin": reserveCheckin, 
		    			"reserveCheckout":reserveCheckout, 
		    			"roomType":roomType, 
		    			"bedType":bedType
		    			}
		     	$.ajax({
		    		type:"POST",
		    		url:"selectgetList",
		    		data:JSON.stringify(json),
		    		contentType:"application/json; charset=utf-8",	
		    		success:function(data){
		    			console.log(data);
	   					var str="";
	   					for(var i=0;i<data.length;i++){
	    					console.log(data[i]);
	    					str +="<tr>";
	    					//str +="<input type='hidden' name='renum' id='renum' value='"+reserveNum+"'>";
	    					str +="<td>"+data[i].roomNum+"</td>"; //방번호
	    					str +="<td>"+data[i].roomType+"</td>"; //객실타입
	    					str +="<td>"+data[i].bedType+"</td>"; //베드타입
		    				str +="<td id='tdbbt'><button type='button' class='btn btn-info bbt' onclick='roomsel("+data[i].roomNum+")'>객실 배정</button></td>"; //객실배정버튼
	    					str +="</tr>";
	   					}
	   					$("#tableTbody").html(str);
	   					console.log($("#renum").val());
	   					
		    		},
		    		error:function(status){
		    			alert("다시시도해주세요"+status);
		    		}
		    			
		    		}) 
	    			
	   		}
			
			function roomsel(roomNum){
				var reserveNum='${vo.reserveNum}';
			
	         var form = document.createElement("form");
	          
	          form.setAttribute("charset", "UTF-8");
	          form.setAttribute("method", "Post");  //Post 방식
	          form.setAttribute("action", "roomSel"); //요청 보낼 주소
	         
	          
	             var hiddenField = document.createElement("input");
	             hiddenField.setAttribute("type", "hidden");
	             hiddenField.setAttribute("name", "reroom");
	             hiddenField.setAttribute("value", roomNum);
	             form.appendChild(hiddenField);
	             var hiddenField2 = document.createElement("input");
	             hiddenField2.setAttribute("type", "hidden");
	             hiddenField2.setAttribute("name", "renum");
	             hiddenField2.setAttribute("value", reserveNum);
	             form.appendChild(hiddenField2);
	          
	          document.body.appendChild(form);

	          form.submit();
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