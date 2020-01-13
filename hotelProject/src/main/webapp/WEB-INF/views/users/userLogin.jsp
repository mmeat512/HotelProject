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
    <link href="${pageContext.request.contextPath }/resources/css/Login.css" rel="stylesheet">
	<!-- 카카오로그인 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <style type="text/css">
    	.find{
    		text-align:center;
    	}
    </style>

</head>

<body>
 <jsp:include page="../include/header.jsp"></jsp:include>

    <section>
        <div class="container login-form">
            <div class="row">
                <div class="col-xs-12 col-md-9 login-t">
                    <h2>로그인</h2>
                </div>
                <div class="col-xs-12 col-md-9 login-out">
                    <div class="login-title">
                        <h3>더 벤자민에 오신 것을 환영합니다</h3>
                        <h4>로그인하시면 다양한 서비스와 혜택을 이용하실 수 있습니다</h4>
                    </div>
                    <form action="loginForm" method="post" id="regForm" name="regForm">
	                    <div class="login-inner">
	                        <div class="inner">
	                            <div class="inner-input">
	                                <input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요">
	                                <input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요">
	
	                            </div>
	                            <div class="inner-btn1">
	                                <button type="button" onclick="login()">로그인</button>
	                            </div>
	
	                        </div>
	                        <div class="inner-btn2">
	                            <button class="btn1" type="button" onclick="location.href='userJoin'">회원가입</button>
	                            <button class="btn2" type="button">아이디 찾기</button>
	                            <button class="btn3" type="button">비밀번호 찾기</button>
	                            
	                        </div>
						</div>
                    </form>
                </div>

            </div>

        </div>
    </section>

    <!--모달(아이디, 비밀번호 찾기)-->
    <div id="myModal" class="modal fade" role="dialog" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-top">
                    <!--엑스 버튼-->
                    <button type="button" class="close" data-dismiss="modal" onclick="closeBtn()">&times;</button>
                    <h3 class="modal-title">비밀번호 찾기</h3>
                </div>
                <div class="modal-mid">
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td class="td"><strong>이름</strong></td>
                                <td class="td2"><input type="text" id="userName"></td>
                            </tr>
                            <tr>
                                <td class="td"><strong>영문이름</strong></td>
                                <td class="td2"><input type="text" id="userEngName"></td>
                            </tr>
                            <tr class="td-phone">
                                <td class="td"><strong>휴대전화</strong></td>
                                <td class="td2">
                                    <select class="td3" style="border: 1px solid #ddd" id="userPhone1">                                    
                                        <option selected="selected">선택</option>
                                        <option>010</option>
                                        <option>011</option>
                                        <option>017</option>
                                        <option>018</option>
                                    </select>
                                    - <input type="text" class="td3" id="userPhone2">
                                    - <input type="text" class="td3" id="userPhone3">
                                </td>
                            </tr>
                            <tr class="td-id">
                                <td class="td"><strong>아이디</strong></td>
                                <td class="td2"><input type="text" id="userId"></td>
                            </tr>
                           
                        </tbody>
                    </table>
                    <p class="find">
	                    <strong>
	                    <span class="replaceInfo">아이디는 '' 입니다</span>
	                    </strong>
                    </p>
                </div>
                <div class="modal-bot">
                    <button type="button" class="btn btn-default" onclick="findBtn()">확인</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeBtn()">닫기</button>
                </div>
            </div>

        </div>
    </div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
    <!--아이디,비밀번호 찾기 모달-->
    <script>
        /*아이디 찾기*/
        $(".btn2").click(function() {
            $(".modal-title").html("아이디 찾기");
            $(".td-id").css("display", "none");
            $(".td-phone").css("display", "contents");
            $("#myModal").modal("show");
        })
        /*비밀번호 찾기*/
        $(".btn3").click(function() {
            $(".modal-title").html("비밀번호 찾기");
            $(".td-id").css("display", "contents");
            $(".td-phone").css("display", "none");
            $("#myModal").modal("show");
        })
    </script>
    
    <!-- loginForm -->
    <script>
    	function login(){
    		var userId = $("#userId").val();
    		var userPw = $("#userPw").val();
    		if(userId == ''){
    			alert("아이디를 입력하세요.");
    			return false;
    		}else if(userPw == ''){
    			alert("비밀번호를 입력하세요");
    			return false;
    		}
    		document.regForm.submit();
    	}
    </script>
    
    <!-- 아이디찾기 -->
    <script>
    	$(document).ready(function(){
    		$(".find").hide();
    		var msg = '${msg}';
    		if(msg != ''){
    			alert(msg);
    		}
    	})
    	
    	function findBtn(){
    		var userName = $("#userName").val();
    		var userEngName = $("#userEngName").val();
    		var userPhone1 = $("#userPhone1").val();
    		var userPhone2 = $("#userPhone2").val();
    		var userPhone3 = $("#userPhone3").val();
    		var userId = $(".td-id #userId").val();
    		if(userId==''){
	    		if(userName==''){
	    			alert("이름을 입력하세요");
	    			return false;
	    		}else if(userEngName==''){
	    			alert("영문이름을 입력하세요");
	    			return false;
	    		}else if(userPhone1=='선택'||userPhone2==''||userPhone3==''){
	    			alert("휴대전화번호를 입력하세요");
	    			return false;
	    		}
	    	}else{
	    		if(userId==''){
	    			alert("아이디를입력하세요");
	    			return false;
	    		}else if(userName==''){
	    			alert("이름을 입력하세요");
	    			return false;
	    		}else if(userEngName==''){
	    			alert("영문이름을 입력하세요");
	    			return false;
	    		}
	    	}
    		var json = {"userName":userName,
    					"userEngName":userEngName,
    					"userPhone1":userPhone1,
    					"userPhone2":userPhone2,
    					"userPhone3":userPhone3,
    					"userId":userId}
			$.ajax({
				type:"POST",
				url:"findInfo",
				data:JSON.stringify(json),
				contentType:"application/json; charset=utf-8",
				success:function(data){
					var dataCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{10,12}$/.test(data);
					if(!dataCheck){
						var str = "아이디는 '"+data+"' 입니다";
						if(data==''){
							$(".replaceInfo").html("해당 정보로 등록된 회원이 없습니다.");
						}else{
							$(".replaceInfo").html(str);
						}
						$(".find").show();
					}else{
						var str = "비밀번호는 '"+data+"' 입니다";
						if(data==''){
							$(".replaceInfo").html("해당 정보로 등록된 회원이 없습니다.");
						}else{
							$(".replaceInfo").html(str);
						}
						$(".find").show();
					}
				},
				error:function(status){
					alert("다시시도해주세요"+status)
				}
			})
     					
    	}
    </script>
    <!-- 모달 초기화 -->
    <script>
    	function closeBtn(){
    		$("#userName").val('');
    		$("#userEngName").val('');
    		$("#userPhone1").val('');
    		$("#userPhone2").val('');
    		$("#userPhone3").val('');
    		$(".td-id #userId").val('');
    		$(".find").hide();
    	}
    </script>
</body>

</html>