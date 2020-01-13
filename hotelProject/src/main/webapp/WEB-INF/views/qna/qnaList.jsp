<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <!--개인 스타일-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/qnaList.css">


     
</head>
<body>
<%@include file="../include/header.jsp" %>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 review">
                    <div class="titleSapn">
                           <span class="glyphicon glyphicon-home"> </span>
                           <a><span class="glyphicon glyphicon-menu-right">고객문의</span></a>
                           <a><span class="glyphicon glyphicon-menu-right reviewSapn">문의사항</span></a>
                    </div>
                    <div class="titlebox">
                        <p>문의게시판</p>
                    </div>
                    <form action="qnaList" method="get" id="searchForm" name="searchForm">
                    <div class="searchDiv">
                        <span>총  ${pageVO.total } 게시글</span>
                            <button type="button" class="btn btn-info search" id="searchBtn" style="color: #67605a;
								font-weight:bold;">검색</button>
                            <input type="text" class="search" name="searchName" value="${pageVO.cri.searchName }">
                            <select class="form-control search" id="sel1" name="searchType">
                            <option value="all" ${pageVO.cri.searchType eq 'all' ? 'selected':'' }>전체보기</option>
                            <c:if test="${sessionScope.userId eq 'admin' }">
                            <option value="notanswer" ${pageVO.cri.searchType eq 'notanswer' ? 'selected':'' }>미답변</option>
                            <option value="answer" ${pageVO.cri.searchType eq 'answer' ? 'selected':'' }>답변완료</option>
                            </c:if>
                            <option value="title" ${pageVO.cri.searchType eq 'title' ? 'selected':'' }>제목</option>
                            <option value="content" ${pageVO.cri.searchType eq 'content' ? 'selected':'' }>내용</option>
                            <option value="writer" ${pageVO.cri.searchType eq 'writer' ? 'selected':'' }>작성자</option>
                            <option value="titcont" ${pageVO.cri.searchType eq 'titcont' ? 'selected':'' }>제목+내용</option>
                          </select>
                    </div>
                    <!-- 검색버튼 클릭 시 pageNum을 1부터 시작하게 처리 -->
                   	<input type="hidden" name="pageNum" value="1">
                   	<input type="hidden" name="amount" value="${pageVO.cri.amount }">
                    </form>
                      <table class="table table-hover" id="collectTable">
                       <colgroup>
                           <col style="width: 17%;">
                           <col style="width: 21%;">
                           <col style="width: 17%;">
                           <col style="width: 28%;">
                           <col style="width: 10%;">
                           <col style="width: 10%;">
                       </colgroup>
                        <thead class="reviewThead">
                          <tr>
                            <th>글번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>작성일</th>
                            <th>비밀글</th>
                            <th>답변여부</th>
                          </tr>
                        </thead>
                        <c:forEach var="vo" items="${qnaList }">
                        <tbody>
                          <tr>
                            <td>${vo.qnaBno }</td>
                            <td>
                            <c:choose>
                            <c:when test="${sessionScope.userId eq 'admin' }">
                            <a href="qnaDetail?qnaBno=${vo.qnaBno }">${vo.qnaTitle }</a>
                            </c:when>
                            <c:otherwise>
                            <a href="qnaPwCheck?qnaBno=${vo.qnaBno }">
                           ${vo.qnaTitle }
                            </a>
                            </c:otherwise>
                            </c:choose>
                            </td>
                            <td>${vo.qnaWriter }</td>
                            <td><fmt:formatDate value="${vo.qnaDate}" type="both"></fmt:formatDate><td>
                            <c:if test="${vo.qnasecret eq 'secret' }">
                            <div class="col-xs-12" id="qnaSecret" style="overflow:hidden; padding:0;">
                            <span class="extraImages" style="float:left;"><img class="secret" src="${pageContext.request.contextPath }/resources/img/lock.png"> </span>
                            </div>
                            </c:if>
                            </td>
                            <td>
                            <c:choose>
                            <c:when test="${vo.qnaAnswer eq 'ok'}"><div class="col-xs-12" id="qnaSecret" style="overflow:hidden; padding:0;">
                            <span class="extraImages" style="float:left;"><img class="secret" src="${pageContext.request.contextPath }/resources/img/circle.png"> </span>
                            </div></c:when>
                            <c:otherwise>
                            <div class="col-xs-12" id="qnaSecret" style="overflow:hidden; padding:0;">
                            <span class="extraImages" style="float:left;"><img class="secret" src="${pageContext.request.contextPath }/resources/img/cross.png"> </span>
                            </div>
                            </c:otherwise>
                            </c:choose>
                            </td>
                          </tr>

                        </tbody>
                        </c:forEach>
                      </table>
                      
                      <!-- 페이징 (검색) -->
                      <form action="qnaList" id="pageForm" name="pageForm">
                       <div class="container">
                           <div class="row">
                               <div class="col-xs-12 pager">
                                  <ul class="pagination">
                                  <c:if test="${pageVO.prev }">
                                      <li><a href="${pageVO.startPage-1 }" onclick="page(${pageVO.startPage-1 })"><span aria-hidden="true">&laquo;</span></a></li>
                                  </c:if>
								<c:forEach var="num" begin="${pageVO.startPage }"
									end="${pageVO.endPage }">
									<li class="${pageVO.pageNum == num ? 'active' : ''}">
									<a href="${num}" onclick="page(${num})">${num }</a></li>
								</c:forEach>
								<c:if test="${pageVO.next }">
                                      <li><a href="${pageVO.endPage+1 }" onclick="page(${pageVO.endPage+1})"><span aria-hidden="true">&raquo;</span></a></li> 
								</c:if>
                                  </ul>
                            <input type="hidden" name="pageNum" id="pageNum" value="${pageVO.cri.pageNum }">
							<input type="hidden" name="amount" id="amount" value="${pageVO.cri.amount }">
							<input type="hidden" name="searchType" id="searchType" value="${pageVO.cri.searchType }">
							<input type="hidden" name="searchName" id="searchName" value="${pageVO.cri.searchName }">
                                  <button type="button" class="btn btn-info" onclick="location.href='qnaRegist'" style="color: #67605a; font-weight:bold;" id="qnaRegistBtn">글쓰기</button>
                              </div>    
                          </div>
                      </div>
                    </form>
                        
                </div>
            </div>
        </div>
    </section>
    
<%@include file="../include/footer.jsp" %>

    <script>
	window.onload = function(){
		//넘어오는 msg가 없는 경우 공백처리를 위해 ''안에 넣어준다 
		//공백이 아니라면 msg출력
		//뒤로가기 실행 후에 앞으로가기 했을 때 변경된 기록 공백이라면 함수 종료
		if(history.state == ''){
			return;	
		}
		var msg = '${msg}';
		if(msg != ''){
			alert(msg);
			history.replaceState('',null,null);//현재 히스토리 기록을 변경
		}
		

		
	}
        
        /*헤더 스크롤 감지*/
        $(window).on("scroll",function(){
            if($(window).scrollTop() > 100){
                $(".header-img").css("display","none");
            }else{
                $(".header-img").css("display","block");
            }
        })
        
		/* 검색버튼 클릭 시  */
/*         $("#searchBtn").click(
      		function(){
		        $(".searchForm").submit();
       		}
        )
         */

     	var searchBtn = document.getElementById("searchBtn");
     	searchBtn.onclick = function(){
     		document.getElementById("searchForm").submit();//폼전송
     	}
     	
         
	//검색처리(페이지 클릭 시 폼전송)	
	function page(num){
		event.preventDefault();//현재 실행되는 이벤트의 실행을 막는 방법
		document.querySelector("#pageForm #pageNum").setAttribute("value", num);//페이지폼의 pageNum값을 전달
		document.getElementById("pageForm").submit();//페이지폼 전송
	}
	
/* 	function qnaRegist(){
		var userId = ${sessionScope};
		if(userId != null){
			location.href="qna/qnaUserRegist";
		}else{
			location.href="qna/qnaRegist";
		}
	} */
     

        
        
    </script> 
</body>
</html>