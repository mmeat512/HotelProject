<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
    
    <!--calendar-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!--개인 디자인-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <!-- 지도api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9615897128d95c4b696b6f88784a9bf0"></script>
    <style type="text/css">
       section{
       margin-top:100px;}
    </style>
</head>

<body>
<jsp:include page="include/header.jsp"></jsp:include>
    
    
    <section>
     <!--캐러셀-->
       
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 slide-list">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>                    
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <a href="###">
                                <img src="${pageContext.request.contextPath }/resources/img/1.jpg" alt="hotel1">
                                </a>
                            </div>
                            <div class="item">
                                <a href="##">
                                <img src="${pageContext.request.contextPath }/resources/img/2.jpg" alt="hotel2">
                                </a>
                            </div>
                            <div class="item">
                                <a href="##">
                                <img src="${pageContext.request.contextPath }/resources/img/3.jpg" alt="hotel3">
                                </a>
                            </div>
                            <div class="item">
                                <a href="##">
                                <img src="${pageContext.request.contextPath }/resources/img/4.jpg" alt="hotel4">
                                </a>
                            </div>
                        </div>

                        <!-- 좌우 위치 버튼 없애고 싶으면 지울수도 있다 -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!--객실검색-->
        <div class="container">
           <div class="row">
                <div class="col-xs-12 reserve">
                   <div class="col-md-5 left">
                    <ul class="check">
                        <li><strong>체크인</strong></li>
                        <li class="checkDate"><input type="text" class="selector"></li>
                    </ul>
                    <ul class="check">
                        <li><strong>체크아웃</strong></li>
                        <li class="checkDate"><input type="text" class="selector"></li>
                    </ul>
                    </div>
                   <div class="col-xs-12 col-md-5 left">
                        <ul class="sel">
                            <li><strong>객실</strong></li>
                            <select class="form-control" id="sel1">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                            </select>
                        </ul>
                        <ul class="sel">
                            <li><strong>성인</strong></li>
                              <select class="form-control" id="sel1">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                              </select>
                        </ul>
                        <ul class="sel">
                            <li><strong>어린이 <span class="glyphicon glyphicon-question-sign childSel">
                               <span class="hidden">안내</span>
                                <span class="child">37개월 이상~만 12세 이하</span>
                            </span></strong></li>
                            <select class="form-control" id="sel1">
                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                              </select>
                        </ul>
                        <ul class="sel">
                            <li><strong>유아 <span class="glyphicon glyphicon-question-sign kidsSel">               
                                <span class="kids">36개월이하</span></span></strong></li>
                            <select class="form-control" id="sel1">
                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                              </select>
                        </ul>                        
                    </div> 
                    <div class="col-xs-12 col-md-2 searchBtn">
                        <button type="button" class="btn btn-info" onclick="searchBtn()">검색</button>
                    </div>
                </div>
            </div>
        </div>
		
        <!--스페셜 오퍼-->
        <div class="container">
            <div class="row">
                <div class="col-xs-12 budae-list">
                    <a class="budae-title" href="##">
                        <h1 style="color: black">스페셜 오퍼</h1>
                        <h4 style="color: black">SPECIAL OFFERS</h4>
                    </a>
                </div>
            </div>
        </div>

        <div class="container aa">
            <div class="row">
                <div class="col-xs-12 budae-a">
                    <ul class="col-md-7 budae">
                        <li class="budae-ulli img1">
                            <a href="##">
                                <img src="${pageContext.request.contextPath }/resources/img/pool2.jpg">
                            </a>
                        </li>                        
                        <ul class="budae-link budae-ulli">
                            <li class="col-sm-6 budae-link3 budae-ulli imgleft">
                                <a href="##">
                                    <img src="${pageContext.request.contextPath }/resources/img/golf.jpg" style="margin-bottom: 10px; margin-top: 10px;">
                                </a>
                            </li>
                            <li class="col-sm-6 budae-link3 budae-ulli imgright">
                                <a href="##">
                                    <img src="${pageContext.request.contextPath }/resources/img/res.jpg" style="margin-bottom: 10px; margin-top: 10px;">
                                </a>
                            </li>

                        </ul>

                    </ul>
                
                    <ul class="col-md-5 budae2">
                        <li class="img2 budae2-link budae-ulli">
                            <a href="##">
                                <img src="${pageContext.request.contextPath }/resources/img/spa.jpg">
                            </a>
                        </li>
                        <li class="img3 budae2-link budae-ulli">
                            <a href="##">
                                <img src="${pageContext.request.contextPath }/resources/img/pool1.jpg">
                            </a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        
        <!--호텔소개-->
        <div class="container">
            <div class="row">
               <div class="col-xs-12 hotel-title">
                    <h1 class="ht1">호텔 소개</h1>
               </div>
               <div class="col-xs-12 hotel-info">
                   <div class="col-xs-12 col-md-5 hotel-left">
                       <div class="col-xs-12 h-info">
                           <p class="ht2">
                               더 벤자민 호텔은 서울에 머무는 국내외 비즈니스 고객과 관광객을 위한 객실특화형 프리미엄 비즈니스 호텔입니다. 지하철과 버스를 비롯한 대중교통 이용이 매우 편리하며, 서울 도심 및 시내 관광지로의 접근성이 뛰어납니다.
                           </p>
                       </div>
                       <div class="col-xs-12 hotel-weather">
                           <p class="ht3">현재 날씨</p>
                           <div class="r">
                               
                           <div class="r1">
                               <p class="ht4">지역: <span id="w1">서울</span></p>
                               <p class="ht4">최고온도: <span id="w2-1">2</span></p>
                               <p class="ht4">최저온도: <span id="w2-2">2</span></p>
                           </div>
                           <div class="r2">
                               <p class="ht4">온도: <span id="w2">2</span></p>
                               <p class="ht4">습도: <span id="w3">10</span></p>                           
                            </div>
                           </div>
                           </div>
                   </div>
                   <div class="col-xs-12 col-md-7 hotel-right">
                       <div id="map" style="width:100%;height:400px;"></div>
                   </div>
               </div>
                
            </div>
            
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 gallery">
                   <div class="col-xs-12 g-title">
                       <h1 class="g1">갤러리</h1>
                       <h4 class="g2">GALLERY</h4>
                   </div>
                    <div class="col-xs-12 g-video">
                        <iframe width="100%" height="100%" src="https://www.youtube.com/embed/81xxCLvADlU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
   <jsp:include page="include/footer.jsp"></jsp:include>

    <!--검색창 물음표-->
        <script>
        $(".sel .childSel").hover(function(){
          $(".sel .child").css("display","inline-block");
        },function(){
            $(".sel .child").css("display","none");
        });
        
        $(".sel .kidsSel").hover(function(){
          $(".sel .kids").css("display","inline-block");
        },function(event){
            $(".sel .kids").css("display","none");
        });
            
        /*날짜 선택 달력*/
        $(".selector").flatpickr({
            dateFormat: "Y. m. d. D"
        });
            
        /*오늘 날짜*/
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        var time = year+". "+month+". "+day+". "+getTodayLabel();
        
        function getTodayLabel() {
            var week = new Array('Sun', 'Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat');

            var today = new Date().getDay();
            var todayLabel = week[today];

            return todayLabel;
        };
        
        $(document).ready(function(){
            $(".selector").val(time);
        })
    
    </script>
    
    <!--현재날씨-->
    <script>
        $.ajax({
            url: "http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=4b5196b9a0cc94a23d0d5367b82286cf",
            dataType: "json",
            type: "GET",
            async: "false",
            success: function(resp) {
            	$("#w1").html(resp.name);
                $("#w2").html((resp.main.temp- 273.15).toPrecision(2)+"°C" );
                $("#w2-1").html((resp.main.temp_max- 273.15).toPrecision(2)+"°C" );
                $("#w2-2").html((resp.main.temp_min- 273.15).toPrecision(2)+"°C" );
                $("#w3").html(resp.main.humidity+"%" );               
            }
        })
   
    </script>
    <!--지도-->
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.496687, 127.030119), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다 
        var markerPosition = new kakao.maps.LatLng(37.496687, 127.030119);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    
    </script>
    
    <!-- 관리자 접근제한 -->
    <script>
    	var msg = '${msg}';
    	if(msg != ''){
    		alert(msg);
    	}
    </script>
</body>


</html>
