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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/qnaPwCheck.css">
 
     <style type="text/css">
    </style>
</head>
<body>
 <%@include file="../include/header.jsp" %>
 

    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 content">
                    <div class="titlebox">
                        <h2>${vo.qnaWriter }님의 비밀글</h2>
                    </div>
                    <div class="secretInsert">
                        <h4 align="center">비밀번호(4자리)를 입력하세요</h4>
                        <br>
                        <br>
                        <div class="secret"><input type="password" id="qnaBoardPw" name="qnaBoardPw"></div>
                    </div>
                    <div class="qnaPwBtnDiv">
                                  <button type="button" class="qnaPwBtn" onclick="qnaPwCheck(${vo.qnaBno},${vo.qnaBoardPw})">확인</button>
                                  <button type="button" class="qnaPwBtn" onclick="location.href='qnaList'" style="margin-left:1px;">목록</button>
                    </div>
                          </div>
                      </div>
                              </div>    
                      
    </section>
    
<%@include file="../include/footer.jsp" %>
<script>

		/* 비밀번호 확인 버튼 클릭 시 */
		
		function qnaPwCheck(bno, pw){
			//console.log(bno);
			//console.log(pw);
		var qnaBoardPw = $("#qnaBoardPw").val();
		if(pw == qnaBoardPw){
			location.href="qnaDetail?qnaBno="+bno;
		}else{
			alert("비밀번호를 확인하세요");
			$("#qnaBoardPw").val("");
			$("#qnaBoardPw").focus();
		}
		};
		


		
</script>
</body>
</html>