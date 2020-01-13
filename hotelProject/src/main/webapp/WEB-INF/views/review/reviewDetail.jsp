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
    
    <!--개인 스타일-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reviewDetail.css">
 	
 	<style type="text/css">
 		.starRev{
 			color:#eac716;
        }
		img{
        	width:400px;
        }
        #title, #content{
        	padding : 6px;
        } 
        .empty{
        	background-color: #d0baa8;
            border-color: #d0baa8;
            color:#6d6d6d;
            display:block; 
            vertical-align:bottom; 
            margin-top:5px;
        }
 	</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>   
<section>
           <div class="container">
            <div class="row">
                <div class="col-xs-12 review">
                    <div class="titleSapn">
                           <a><span class="glyphicon glyphicon-home"> </span></a>
                           <span class="glyphicon glyphicon-menu-right"></span><a>고객문의</a>
                           <a><span class="glyphicon glyphicon-menu-right reviewSapn">이용후기</span></a>
                        </div>
                        <div class="titlebox">
                            <p>이용후기</p>
                        </div>
                    <form action="reviewDelForm" method="post" enctype="multipart/form-data" id="regForm" name="regForm">
                      <input type="hidden" name="reviewBno" value="${vo.reviewBno }">
                      <input type="hidden" name="reviewId" value="${vo.reviewId}">
					  <input type="hidden" name="empty" id="empty" value="notEmpty">
                      <table class="table table-bordered">
                        <tbody class="reviewTable">
                          <tr>
                            <td class="reviewT">작성일</td>
                            <td ><p class="reviewDate">${vo.reviewDate }</p></td>
                          </tr>
                          <tr>
                            <td class="reviewT">제목</td>
                            <td ><input type="text" class="form-control" id="title" name = "reviewTitle" value="${vo.reviewTitle }"></td>
                          </tr>  
                          <tr>
                            <td class="reviewT">작성자</td>
                            <td ><p class="reviewDate">${vo.reviewId }</td>
                          </tr>
                          <tr>
                            <td class="reviewT">객실명</td>
                            <td >
                            	<select class="form-control" id="reviewRoom" name="reviewRoom" style="padding:6px;">
									<option ${vo.reviewRoom eq '스탠다드 더블' ? 'selected' : '' }>스탠다드 더블</option>                            	
									<option ${vo.reviewRoom eq '스탠다드 트윈' ? 'selected' : '' }>스탠다드 트윈</option>                          	
									<option ${vo.reviewRoom eq '스탠다드 패밀리' ? 'selected' : '' }>스탠다드 패밀리</option>                          	
									<option ${vo.reviewRoom eq '프리미어 디럭스' ? 'selected' : '' }>프리미어 디럭스</option>                           	
									<option ${vo.reviewRoom eq '디럭스' ? 'selected' : '' }>디럭스</option>                            	
									<option ${vo.reviewRoom eq '그랜드' ? 'selected' : '' }>그랜드</option>                           	
                            	</select>
                          </tr>
                          <tr>
                            <td class="reviewT">평점</td>
                            <td >
                                <div class="starRev">
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <span class="starR">★</span>
                                  <input type="hidden" name="reviewRate" id="reviewRate">
                                </div>
                            </td>
                          </tr>
                          <c:if test="${ vo.reviewfilename != null }">
                          <tr class="imgTag">
                          	<td class="reviewT">사진</td>
                          	<td>
                          		<img src="viewImg?fileLoca=${vo.reviewfileloca }&filename=${vo.reviewfilename}">
                          		<button type="button" class="btn empty">(사진 지우기)</button>	
                          	</td>
                          </tr>
                          </c:if>
                          <tr>
                            <td class="reviewT">내용</td>
                            <td>
                            	<textarea class="form-control" rows="15" id="content" name = "reviewContent" style="resize: none;" >${vo.reviewContent }</textarea>
                            </td>
                          </tr>
                          <tr>
                            <td class="reviewT">파일</td>
                            <td><input type="text" id="fileName" class="filetextbox" readonly >
                            <div class="file_input_div">
                                <img src="${pageContext.request.contextPath }/resources/img/search.jpg" class="file_input_img_btn" alt="open" />
                                <input type="file" name="file" id="file" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value"/>
                            </div>
                            <div class="fileDiv">
                                <img id="fileImg" src="${pageContext.request.contextPath }/resources/img/search.jpg	">
                            </div>
                            </td>
                          </tr>
                        </tbody>
                      </table>
                        <div class="btnBox">
						   <button type="button" class="btn btn-info" onclick="detailMod()">수정하기</button>
                          <button type="button" class="btn btn-default" onclick="detailDel()">삭제하기</button>
                           <button type="button" class="btn btn-primary" onclick="location.href='reviewList'">목록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	   <%
	 String strReferer = request.getHeader("referer");
	 
	 if(strReferer == null){
	%>
	 <script language="javascript">
	  //alert("URL 주소창에 주소를 직접 입력해서 접근하셨습니다.\n\n정상적인 경로를 통해 다시 접근해 주십시오.");
	  document.location.href="reviewList";
	 </script>
	<%
	  return;
	 }
	%>
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
                	console.log(event.target);//event.target은 이벤트로 선택된 요소를 의미
	        	}
        	}
	    }
		$("#file").change(function() {
	        readURL(this); //this는 #file자신 태그를 의미
	        
	    });
    </script>
   	
   	 <!-- 별점주기 -->
	 <script>
		 $('.starRev span').click(function(){
		     $(this).parent().children('span').removeClass('on');
		     $(this).addClass('on').prevAll('span').addClass('on');
		     $("#reviewRate").val($(".on").length);
		     return false;
		   });
	 </script> 
	 <!-- 별점체크 -->
	 <script>
	 	$(document).ready(function(){
	 		var reviewRate = '${vo.reviewRate}';
	 		console.log($(".starRev span")[0]);
	 		var star = $(".starRev span");
 			for(var i = 0; i<reviewRate; i++){
 				console.log(star[i]);
				star[i].setAttribute("class","starR on");
			}	
		     $("#reviewRate").val($(".on").length);
	 	})
	 </script>
	 
	<!-- 삭제 -->
    <script>
    	function detailDel(){
    		if(confirm("삭제하시겠습니까?")){
    			document.regForm.submit();
    		}
    	}
    </script>
    
    <!-- 수정-->
    <script>
    	function detailMod(){
    		var reviewTitle = $("#title").val();
    		var reviewRate = $("#reviewRate").val();
    		var content = $("#content").val();
    		var file = $("#file").val();    		
    		var room = $("#reviewRoom").val();
    		file = file.slice(file.indexOf(".")+1).toLowerCase();
    		if(reviewTitle == ''){
    			alert("제목은 필수입니다.");
    			return false;
    		}else if(reviewRate == ''){
    			alert("평점은 필수입니다.");
    			return false;
    		}else if(content == ''){
    			alert("내용은 필수입니다.");
    			return false;
    		}else if(room ==''){
    			alert("객실은 필수입니다.");
    			return false;
    		}else if(file != ''){
    			if(file != "jpg" && file != "png" && file != "bmp"){
					alert("이미지 파일(jpg, png, bmp)만 등록 가능합니다.");
					$("#file").val("");
					return false;
    			}
    		}
    		if (confirm("수정하시겠습니까?")){
    			$("#regForm").attr("action","updateForm");
    			document.getElementById("regForm").submit();
    		}
    	}
    </script>

	<!-- 사진지우기 -->    
    <script>
    	$(".empty").click(function(){
    		imgEmpty();
    	})
    	
    	function imgEmpty(){
    		$(".imgTag").css("display","none");
    		$("#empty").val("empty");
    	}
    </script>
</body>
</html>