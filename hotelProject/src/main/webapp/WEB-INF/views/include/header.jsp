<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <header>
        <div class="container-fluid">
            <div class="row">
                <nav class="navbar-inverse navb">
                    <div class="header">
                        <div class="header-img">
                            <span><a href="${pageContext.request.contextPath }/"><img style="width:250px; margin-top:10px;" src="${pageContext.request.contextPath }/resources/img/logo3.jpg"></a></span>
                        </div>
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                        </div>
                        <div class="collapse navbar-collapse navb" id="myNavbar">

                            <ul class="nav navbar-nav nav-ul">
                                <li class="dropdown">
                                    <a class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                           호텔소개
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <li><a href="${pageContext.request.contextPath }/">홈</a></li>
                                        <li><a href="${pageContext.request.contextPath }/hotel/hotelIntro?att=home">객실소개</a></li>
                                        <li><a href="${pageContext.request.contextPath }/hotel/hotelSpecial">스페셜오퍼</a></li>

                                    </ul>
                                </li>
                                <li class="active"><a href="${pageContext.request.contextPath }/reserve/reserveRoom">예약하기</a></li>

                                <li class="dropdown">
                                    <a class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                           고객문의
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                        <li><a href="${pageContext.request.contextPath }/qna/qnaList">문의하기</a></li>
                                        <li><a href="${pageContext.request.contextPath }/review/reviewList">이용후기</a></li>

                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a class="dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
                                           마이페이지
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                                    	<c:choose>
                                    		<c:when test="${sessionScope.userId eq null }">
                                        		<li><a href="${pageContext.request.contextPath }/users/userLogin">로그인</a></li>
		                                        <li><a href="${pageContext.request.contextPath }/users/userJoin">회원가입</a></li>
                                       		</c:when>
                                       		<c:otherwise>
                                       			<c:if test="${sessionScope.userId eq 'admin' }">
                                        			<li><a href="${pageContext.request.contextPath }/admin/adminReserve">관리자페이지</a></li><!--관리자 아이디 세션일 경우 -->
                                    			</c:if>
                                       			<li><a href="${pageContext.request.contextPath }/users/userLogout">로그아웃</a></li>
                                       			<li><a href="${pageContext.request.contextPath }/users/userMypage">마이페이지</a></li><!--아이디 세션이 존재할 경우-->
                                       		</c:otherwise>
                                        </c:choose>
                                        <li><a href="${pageContext.request.contextPath }/users/userReservePage" class="tabLink">예약확인</a></li>

                                    </ul>

                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

            </div>

        </div>
    </header>
       <!--별점주기-->
       <script>
          $('.starRev span').click(function(){
              $(this).parent().children('span').removeClass('on');
              $(this).addClass('on').prevAll('span').addClass('on');
              return false;
            });
       </script>
    <script>
        $(window).on("scroll",function(){
            if($(window).scrollTop() > 50){
                $(".header-img").css("display","none");
            }else{
                $(".header-img").css("display","block");
            }
        })
    </script>
    <script>
       //헤더에서 예약확인 눌렀을 때

    </script>