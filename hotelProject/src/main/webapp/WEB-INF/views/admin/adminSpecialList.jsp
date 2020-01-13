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
                        <p>스페셜오퍼 목록</p>
                   
                      <table class="table table-hover">
                        <thead class="reviewThead">
                          <tr>
                            <th>스페셜오퍼 번호</th>
                            <th>스페셜오퍼 이름</th>
                          </tr>
                        </thead>
                        <tbody id="tableTbody">
                         
                        </tbody>
                      </table>
                       <div class="btnBox">
                           <button type="button" class="btn btn-info" onclick="location.href='adminSpecialRegist'">스페셜오퍼 추가</button>
                      </div>
                      </div>  
                </div>
            </div>
        </div>
    </section>
    
  <jsp:include page="../include/footer.jsp"></jsp:include>
  
      <script>
    	$(document).ready(function(){
    		specialgetList();
    		 
    		function specialgetList(){
    			$.getJSON(
    				"specialgetList",
    				function(data){
    					var str="";
    					for(var i=0;i<data.length;i++){
    						console.log(data[i]);
    						str += "<tr>";
    						str += "<td>"+(i+1)+"</td>";
    						str += "<td><a href='adminSpecialDetail?specialName="+data[i].specialName+"'>"+data[i].specialName+"</a></td>";
    						str += "</tr>";
    					}
    					$("#tableTbody").html(str);
    				}
    			)	
    			
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