<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reviewList.css">
    <style type="text/css">
       .row .btn-info{
          background-color: #d0baa8;
            border-color: #d0baa8;
            color:#6d6d6d;
            float:right;
            margin-bottom:5px;
       }
       .modalContent  div{
          padding-bottom: 9.5px;
          
       }
       .fileleft{
           float:left; 
           padding:9.5px 0px;
        }
        .contentRight{
           float:right; 
           margin-top:10px;
           }
        .modal-body{
           padding:5px 15px;
        }
        .detailDate{
        	float:right;
        }
        .close{
        	float:right;
        }
        .starR{
       	 	color:#eac716;
        }
        
        .modalContent{
        	text-align:center;
        }
        .detailValue{
        	text-align:left;
        }
		img {
			width:350px;
		}
		
		.modal-content{
			border: 5px solid #d0baa8;
		}
		.modal-header{
			padding: 10px 15px;
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
                           <span class="glyphicon glyphicon-home"> </span>
                           <a><span class="glyphicon glyphicon-menu-right">고객문의</span></a>
                           <a><span class="glyphicon glyphicon-menu-right reviewSapn">이용후기</span></a>
                    </div>
                    <div class="titlebox">
                        <p>이용후기</p>
                    </div>
                    <form action="reviewList" name="searchForm">
	                    <div class="searchDiv">
	                        <span>총 ${pageVO.total }</span>
	                            <button type="button" class="btn btn-info search" onclick="searchBtn()" >검색</button>
	                            <select class="form-control search" id="searchName" name="searchName">
		                            <option ${pageVO.cri.searchName eq '스탠다드 더블' ? 'selected' : '' }>스탠다드 더블</option>
		                            <option ${pageVO.cri.searchName eq '스탠다드 트윈' ? 'selected' : '' }>스탠다드 트윈</option>
		                            <option ${pageVO.cri.searchName eq '스탠다드 패밀리' ? 'selected' : '' }>스탠다드 패밀리</option>
		                            <option ${pageVO.cri.searchName eq '프리미어 디럭스' ? 'selected' : '' }>프리미어 디럭스</option>
		                            <option ${pageVO.cri.searchName eq '디럭스' ? 'selected' : '' }>디럭스</option>
		                            <option ${pageVO.cri.searchName eq '그랜드' ? 'selected' : '' }>그랜드</option>
	                         	</select>
	                           	<select class="form-control search" id="sel1" name="searchType" >
									<option value="">최신순</option>
		                            <option value="room" ${pageVO.cri.searchType eq 'room' ? 'selected' : '' }>객실별</option>
		                            <option value="star" ${pageVO.cri.searchType eq 'star' ? 'selected' : '' }>평점순</option>	
	                         	</select>
	                    </div>
	                    <input type="hidden" value="1" name="pageNum">
	                    <input type="hidden" value="${pageVO.cri.amount }" name="amount">
                    </form>
                      <table class="table table-hover">
                        <thead class="reviewThead">
                          <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>작성일</th>
                            <th>평점</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="vo" items="${list }">
	                          <tr class="detailP">
	                            <td>${vo.reviewBno }</td>
	                            <td><a href="${vo.reviewBno }" id="detailModal">${vo.reviewTitle }</a></td>
	                            <td>${vo.reviewId }</td>
	                            <td><fmt:formatDate value="${vo.reviewDate }" pattern="yyyy-MM-dd"/></td>
	                            <td class="starR">
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
                       <div class="container">
                           <div class="row">
                               <div class="col-xs-12 pager">
                                  <button type="button" class="btn btn-info" onclick="location.href='reviewRegist'">글쓰기</button>
                                  <form action = "reviewList" name="pageForm">
	                                  <ul class="pagination">
	                                  	<c:if test="${pageVO.prev }">
	                                      <li><a href="${pageVO.startPage-1 }" onclick="pageBtn(${pageVO.startPage-1 })"><span aria-hidden="true">&laquo;</span></a></li>
	                                  	</c:if>
	                                  	<c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
	                                      <li class="${pageVO.pageNum == num ? 'active' : '' }"><a href="${num}" onclick="pageBtn(${num})" class="a">${num }</a></li>
	                                    </c:forEach>
	                                    <c:if test="${pageVO.next }">
	                                      <li><a href="${pageVO.endPage+1 }" onclick="pageBtn(${pageVO.endPage+1 })"><span aria-hidden="true">&raquo;</span></a></li> 
	                                  	</c:if>
	                                  </ul>
	                                  <input type="hidden" value="${pageVO.cri.searchType }" name="searchType">
	                                  <input type="hidden" value="${pageVO.cri.searchName }" name="searchName">
	                                  <input type="hidden" value="${pageVO.cri.pageNum }" name="pageNum" id ="pageNum">
	                                  <input type="hidden" value="${pageVO.cri.amount }" name="amount">
                                  </form>
                              </div>    
                          </div>
                      </div>
                      
                </div>
            </div>
        </div>
    </section>
    
    <!-- 이미지 모달창 -->
    <div class="container">      
           <!-- Modal -->
           <div class="modal fade" id="myModal" role="dialog" data-backdrop="static" data-keyboard="false">
             <div class="modal-dialog modal-lg">
             
               <!-- Modal content-->
               <div class="modal-content">

               </div>
             </div>
           </div>
   </div>
    
  <jsp:include page="../include/footer.jsp"></jsp:include>

  <script>
  	$(document).ready(function(){
  		var msg = '${msg}';
  		if(msg != ''){
  			alert(msg);
  		}
  	})
  </script>
  
  <!-- 모달창 출력 -->
  <script>
  $(document).ready(function(){
  	$(".detailP").on("click","#detailModal",(function(event){
  		event.preventDefault();
  		var reviewbno = $(this).attr("href");
   		$.getJSON(
  			"detail/" + reviewbno,
  			function(data){
  	  			$(".modal-content").html(modalDetail(data));
  	          	$("#myModal").modal("show");
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
          str +="<div class='modal-body row'>";
          str +="<div class='col-xs-12 modalContent'style='padding:10px 10px 15px 10px;'>";
          
          if(data.reviewfilename != null){
              str +="<div class='col-md-6 col-xs-12 fileleft'>";
              str +="<img src='viewImg?fileLoca="+data.reviewfileloca+"&filename="+data.reviewfilename+"'>";
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
  	$(".modal-content").on("click",".detailModify",function(event){
  		event.preventDefault();
  		var reviewbno = $(".detailModify a").attr("href");
		var userId = '${sessionScope.userId}';
  		location.href="reviewDetail?reviewbno="+reviewbno;
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
  
  <!-- 검색 -->
  <script>
	function searchBtn(){
  		$("#searchName").val();
  		document.searchForm.submit();
  	}
  
  	function pageBtn(num){
  		event.preventDefault();
  		console.log(num);
  		$("#pageNum").val(num);
  		document.pageForm.submit();
  	}
  	
  	$(document).ready(function(){
  		$("#searchName").css("display","none");
  		var sel =$("#sel1").val();
  		if(sel == 'room'){
			changeRoom();
			$("#searchName").css("display","block");
  		}else if(sel == 'star'){
			changeStar();
			$("#searchName").css("display","block");
  		}
		$("#sel1").change(function(){
			if($("#sel1").val() == 'room'){
				changeRoom();
				$("#searchName").css("display","block");
			}else if($("#sel1").val() == 'star'){
				changeStar();
				var option2 = document.querySelectorAll("#searchName > option");
				console.log(option2);
				$("#searchName").css("display","block");
			}else{
				$("#searchName").css("display","none");
			}
		})
  	})
  	
  	function changeStar(){
 	/*  var option = document.querySelectorAll("#searchName > option");
  		option[0].remove();
  		for(var i = 1; i < option.length; i++){
  			option[i].setAttribute("value",i);
  			option[i].innerHTML = "평점 "+i+"점 이상";
  			if(i==5){
  	  			option[i].innerHTML = "평점 "+i+"점";
  			}
	  		console.log(option[i].getAttribute("value"));
	  		console.log(option[i]);
  		} */
  		$("#searchName").find("option").remove();
  		var str =""
        str += "<option value='1' ${pageVO.cri.searchName eq '1' ? 'selected' : '' }>평점 1점 이상</option>";
        str += "<option value='2'${pageVO.cri.searchName eq '2' ? 'selected' : '' }>평점 2점 이상</option>";
        str += "<option value='3'${pageVO.cri.searchName eq '3' ? 'selected' : '' }>평점 3점 이상</option>";
        str += "<option value='4'${pageVO.cri.searchName eq '4' ? 'selected' : '' }>평점 4점 이상</option>";
        str += "<option value='5'${pageVO.cri.searchName eq '5' ? 'selected' : '' }>평점 5점 </option>";
  		$("#searchName").append(str);
  	}
  	
  	function changeRoom(){
  		$("#searchName").find("option").remove();
  		var str =""
        str += "<option ${pageVO.cri.searchName eq '스탠다드 더블' ? 'selected' : '' }>스탠다드 더블</option>";
        str += "<option ${pageVO.cri.searchName eq '스탠다드 트윈' ? 'selected' : '' }>스탠다드 트윈</option>";
        str += "<option ${pageVO.cri.searchName eq '스탠다드 패밀리' ? 'selected' : '' }>스탠다드 패밀리</option>";
        str += "<option ${pageVO.cri.searchName eq '프리미어 디럭스' ? 'selected' : '' }>프리미어 디럭스</option>";
        str += "<option ${pageVO.cri.searchName eq '디럭스' ? 'selected' : '' }>디럭스</option>";
        str += "<option ${pageVO.cri.searchName eq '그랜드' ? 'selected' : '' }>그랜드</option>";
  		$("#searchName").append(str);
  	}
  </script>
  
  <!-- 좋아요 -->
  <script>
  	$(".modal-content").on("click",".emptylike",function(){
  		var str = "";
  		var reviewBno = $("#rBno").val();
  		var userId = '${sessionScope.userId}';
  		$.ajax({
  			type:"POST",
  			url:"likeId/"+reviewBno,
  			async: false,
  			success:function(result){
  				for(var i = 0; i < result.length; i++){
  					if(userId == result[i]){
  						str = "false";
  					}
  				}
  			},
  			error:function(status){
  				alert("다시시도해주세요");
  			}
  		})
  		if(str=="false"){
  			alert("이미 좋아요를 눌렀습니다.");
  			return false;
  		}
		if(userId == ''){
  			alert("로그인 후 이용가능합니다.");
  			location.href='reviewLInter?reviewBno='+reviewBno;
  			return false;
  		}
	  	$(this).attr("src","${pageContext.request.contextPath }/resources/img/like.png");
	  	$(this).attr("class","like");
	  	var likehit = $(".likehit").html();
	  	likehit++;
	  	$(".likehit").html(likehit);
  	})
  	
  	$(".modal-content").on("click",".like",function(){
  		$(this).attr("src","${pageContext.request.contextPath }/resources/img/emptylike.png");
  		$(this).attr("class","emptylike");
  		var likehit = $(".likehit").html();
  		likehit--;
  		$(".likehit").html(likehit);
  	})
  	
   	$(".modal-content").on("click",".modalclose",function(){
  		console.log($(".modal-header > img").attr("src"));
   		if($(".modal-header > img").attr("src")=="/project/resources/img/like.png"){
  			changeUpLike();
  			userLike();
  		}
  	}) 
  	
  	function changeUpLike(){
  		var likehit = $(".likehit").html();
  		console.log(likehit);
  		var reviewBno = $("#rBno").val();
  		$.ajax({
  			type:"POST",
  			url:"likeUpdate/"+likehit+"/"+reviewBno,
  			contentType:"application/json; charset=utf-8",
  			success:function(data){
  				if(data != 0){
  					$(".likehit").html(data);
  				}
  			},
  			error:function(status){
  				alert("다시시도해주세요"+status);
  			}
  		
  		})
  		console.log($(".likehit").html());
  		console.log($(".likehit")[0]);
  	}
  	
  	function userLike(){
  		var userId = '${sessionScope.userId}';
  		var reviewBno = $("#rBno").val();
  		console.log(userId);
  		$.ajax({
  			type:"POST",
  			url:"userLike/"+userId+"/"+reviewBno,
  			contentType:"application/json; charset=utf-8",
  			success:function(data){
  				
  			},
  			error:function(status){
  				alert("다시시도해보기"+status);
  			}
  		})
  	}
  </script>

  <!-- 댓글 등록하기 -->
  <script>
  	function replyRegist(){
  		var rBno = $("#rBno").val();
  		var rId = $("#rId").val();
  		var rContent = $("#rContent").val();
  		if(rContent == ''){
  			alert("내용을 필수입니다.");
  			return false;
  		}else if(rId != 'admin'){
  			alert("관리자만 입력가능합니다");
  			return false;
  		}
  		console.log(rBno);
  		console.log(rId);
  		console.log(rContent);
   		$.ajax({
  			type:"POST",
  			url:"replyRegist/"+rBno+"/"+rId+"/"+rContent,
/*   			data:JSON.stringify({
  				"rBno":rBno,
  				"rId":rId,
  				"rContent":rContent
  			}), */
  			contentType: "application/json; charset=utf-8",
  			success:function(result){
  				var str = $(".modal-content").html();
  				if(result != null){
  					$(".modal-content").html(modalDetail(result));
	  				$(".replyRegistView").css("display","inline-block");
  				}else{
  					alert("댓글등록을 실패했습니다");
  					
  				}
  			},
  			error:function(status){
  				alert("다시시도해주세요"+status);
  			}
  			
  		}) 
  	}
  </script>
 
  <!-- 관리자 이름 변경 -->
  <script>
  	function changeId(userId){
  		if(userId=='admin'){
  			return '더 벤자민';
  		}
  			
  	}
  </script>
  
  <!-- 댓글 삭제 -->
  <script>
  	function replyDelete(rNum){
  		if(confirm("댓글을 삭제하시겠습니까?")){
  			$.ajax({
  				type:"DELETE",
  				url:"replyDelete/"+rNum,
  				contentType:"application/json; charset=utf-8",
  				success:function(result){
  					console.log(result);
					if(result != null){
						$(".replyclose").attr("onclick");
  						alert("삭제되었습니다");
  						$(".modal-content").html(modalDetail(result));
					}
  				},
  				error:function(status){
  					alert("다시 시도해 주세요"+status);
  				}
  				
  			})
  		}
  	
  	}
  </script>

</body>
</html>