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
    
    <!--개인 스타일-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/admin.css">
    <style type="text/css">
    	.reviewTable .title{
            width: 40%;
        }
        .reviewTable .content{
            width: 100%;
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
                            <p>스페셜오퍼 수정</p>
                        
                    <form action="sepecialUpdate" method="post" name="regForm" id="regForm" enctype="multipart/form-data">
                      <table class="table table-re">
                        <tbody class="reviewTable">
                          <tr>
                            <td class="reviewT">스페셜<br>오퍼 이름</td>
                            <td style="text-align: left;"><input type="text" class="form-control title" id="specialName" name="specialName" value="${SpecialUntVO.specialName}" readonly></td>
                          </tr>
                          <tr>
                            <td class="reviewT">스페셜<br>오퍼 소개</td>
                            <td>
                            	<textarea class="form-control content" rows="15" id="specialContent" name="specialContent" style="resize: none;" >${SpecialUntVO.specialContent}</textarea>
                            </td>
                          </tr>
                          <tr>
                            <td class="reviewT">스페셜<br>오퍼 사진<small style="font-size: 10px">(사진은 변경이 불가합니다)</small></td>
                            <td>
                            	<img src="view?fileLoca=${SpecialUntVO.specialfileloca}&filename=${SpecialUntVO.specialfilename}&Name=${SpecialUntVO.specialName}">
                            </td>
                          </tr>
                        </tbody>
                      </table>
                        <div class="btnBox">
                          <button type="button" class="btn btn-info" onclick="if(confirm('스페셜오퍼를 삭제하시겠습니까?')){location.href='specialDelete?specialName=${SpecialUntVO.specialName}'}">삭제하기</button>
                          <button type="button" class="btn btn-info btn1" id="updateBtn">수정하기</button>
                          <button type="button" class="btn btn-info btn1"  onclick="location.href='adminSpecialList'">목록</button>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <jsp:include page="../include/footer.jsp"></jsp:include>
   <script>
        //자바 스크립트 파일 미리보기 기능
      function readURL(input) {
           if (input.files && input.files[0]) {
              
               var reader = new FileReader(); //비동기처리를 위한 파읽을 읽는 자바스크립트 객체
               //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
              reader.readAsDataURL(input.files[0]); 
               //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
               $(".fileDiv").css("display", "block");
               
               reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                   $('#fileImg').attr("src", event.target.result); 
                   console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
              }
           }
       }
      $("#file").change(function() {
           readURL(this); //this는 #file자신 태그를 의미
           
       });
    </script>
    
    <!-- 수정하기  -->
    <script>
    	$("#updateBtn").click(function(){
    		if($("#content").val() == ''){
    			alert("스페셜오퍼 소개를 입력해주세요");
    		}else{
    			if(confirm("스페셜오퍼를 수정하시겠습니까?")){
    	    		$("#regForm").submit();
        		 }
    		}
    		
    		
    	})
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
</body>
</html>