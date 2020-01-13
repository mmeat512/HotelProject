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
    
    <!--calendar-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!--개인 디자인-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/hotelSpecial.css" rel="stylesheet">
    
    
    <script scr="//code.jquery.com/jquery-1.12.4.min.js"></script>
  
  
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section>
      
        <div class="container tab">
            <h2 class="room-tit">벤자민의 Special Offers</h2>
                <ul class="nav nav-tabs room-tog2">
                    <li class="col-xs-6  col-md-2 col-sm-2  col-lg-2 in active"><a data-toggle="tab" href="#home">레스토랑</a></li>
                    <li class="col-xs-6  col-md-2 col-sm-2  col-lg-2"><a data-toggle="tab" href="#menu1">야외 수영장</a></li>
                    <li class="col-xs-6  col-md-2 col-sm-2  col-lg-2"><a data-toggle="tab" href="#menu2">실내 수영장</a></li>
                    <li class="col-xs-6  col-md-2 col-sm-2  col-lg-2"><a data-toggle="tab" href="#menu3">실내 스파</a></li>
                    <li class="col-xs-6  col-md-2 col-sm-2  col-lg-2 "><a data-toggle="tab" href="#menu4">골프장</a></li>
                    <li class="col-xs-6  col-md-2 col-sm-2  col-lg-2 "><a data-toggle="tab" href="#menu5">피트니스</a></li>
                </ul>
                <div class="col-xs-12 col-sm-12 section-inner tab-content">
                    <div id="home" class="tab-pane fade in active">
                       
                    </div>
                    <div id="menu1" class="tab-pane fade">
                        
                    </div>
                    <div id="menu2" class="tab-pane fade">
                        
                    </div>
                     <div id="menu3" class="tab-pane fade">
                       
                    </div>
                   <div id="menu4" class="tab-pane fade">
                       
                    </div>
                     <div id="menu5" class="tab-pane fade">
                       
                    </div>
            </div>
             
        </div>
    </section>
<jsp:include page="../include/footer.jsp"></jsp:include>  
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
    
    <script>
    $(document).ready(function(){
    	specialgetList();
		 
		function specialgetList(){
			$.getJSON(
				"../admin/specialgetList",
				function(data){
					console.log(data);
					var str="";
					for(var i=0;i<data.length;i++){
						str+="<h3>"+data[i].specialName+"</h3>";
						str+="<ul class='itemList roomList'>";
						str+="<li class='item'>";
						str+="<a href='##' class='itemImg'>";
						str+="<div class='col-xs-12 sizeHi'>";
						str +="<img src='../admin/view?fileLoca="+data[i].specialfileloca+"&filename="+data[i].specialfilename+"&Name="+data[i].specialName+"'>";
						str+="</div>";
						str+="</a>";
						str+="<div class='col-xs-12 itemInfo'>";
						str+="<div class='itemDes' style='font-size: 100%; font-weight: bold;'>"+data[i].specialContent+"</div>";
						str+="<ul class='itemInfoList'>";
						str+="<li>";
						
					
						if(data[i].specialName == "Restaurant"){
							str+="<em class='infoTit'>운영 시간</em>";
							str+="<div class='infoDes'>Lunch : 12:00 ~ 14:30";
							str+="<br>Dinner : 18:00 ~ 22:00</div>";
							str+="</li>";
							str+="</ul>";
							str+="</div>";
							str+="</li>";
							str+="</ul>";
							
							$("#home").html(str);
							str="";
						}else if(data[i].specialName == "Benjamin Island"){
							str+="<em class='infoTit'>운영 방침</em>";
							str+="<div class='infoDes'>-벤자민 아일랜드는 벤자민 호텔 투숙객 전용 시설입니다.<br> -벤자민 아일랜드는 입장 혜택이 포함된 상품 외에는 이용 시 입장료가 추가로 부과됩니다.<br>-벤자민 아일랜드의 모든 지역은 금연구역입니다.<br>-벤자민 아일랜드는 다이빙이 금지되어 있습니다.<br>-신장 140cm미만인 고객은 보호자의 보호 하에 구명조끼 착용 시 이용 가능합니다.</div>";
							str+="</li>";
							str+="</ul>";
							str+="</div>";
							str+="</li>";
							str+="</ul>";
							
							$("#menu1").html(str);
							str="";
						}else if(data[i].specialName == "Swimming Pool"){
							str+="<em class='infoTit'>운영 방침</em>";
							str+="<div class='infoDes'>-실내 수영장은 벤자민 호텔 투숙객 전용 시설입니다.<br>-실내 수영장 입장 혜택이 포함된 상품 외에는 이용 시 입장료가 추가로 부과됩니다.<br>-실내 수영장의 모든 지역은 금연구역입니다.<br>-실내 수영장은 다이빙이 금지되어 있습니다.<br>-신장 140cm미만인 고객은 보호자의 보호 하에 구명조끼 착용 시 이용 가능합니다.<br>-튜브, 스노클 장비, 오리발, 수중 프로펠러등은 사용하실 수 없습니다.<br>-수영복 착용시에만 이용 가능하며, 체육복 및 평상복 착용은 불가능합니다.</div>";
							str+="</li>";
							str+="</ul>";
							str+="</div>";
							str+="</li>";
							str+="</ul>";
							$("#menu2").html(str);
							str="";
						}else if(data[i].specialName == "Spa"){
							str+="<em class='infoTit'>운영 시간</em>";
							str+="<div class='infoDes'>08:00 ~ 22:00 (연중무휴)</div>";
							str+="</li>";
							str+="<li>";
							str+="<em class='infoTit'>예약 안내</em>";
							str+="<div class='infoDes'>고객께 맞는 트리트먼트 선택을 위해 겔랑스파 리셉셔니스트와의 상담을 통해 보다 편안하게 예약을 하실 수 있습니다.</div>";
							str+="</li>";
							str+="</ul>";
							str+="</div>";
							str+="</li>";
							str+="</ul>";
							
							$("#menu3").html(str);
							str="";
						}else if(data[i].specialName == "Golf Field"){
							str+="<em class='infoTit'>운영 시간</em>";
							str+="<div class='infoDes'>Lunch : 12:00 ~ 14:30";
							str+="<br>Dinner : 18:00 ~ 22:00</div>";
							str+="</li>";
							str+="<li>";
							str+="<em class='infoTit'>운영 방침</em>";
							str+="<div class='infoDes'>-더 벤자민의 실내 골프장은 만 13세 이상 고객에게 한해 입장 가능합니다.<br>-고객 여러분의 안전을 위하여 음주 후 골프장, 피트니스 짐, 사우나, 실내 수영장 등의 스페셜 시설 이용은 제한될 수 있습니다.</div>";
							str+="</li>";
							str+="</ul>";
							str+="</div>";
							str+="</li>";
							str+="</ul>";
                     
							$("#menu4").html(str);
							str="";
						}else if(data[i].specialName == "Fitness Gym"){
							str+="<em class='infoTit'>운영 시간</em>";
							str+="<div class='infoDes'>05:30 ~ 22:30";
							str+="<br>Dinner : 18:00 ~ 22:00</div>";
							str+="</li>";
							str+="<li>";
							str+="<em class='infoTit'>정기 휴일</em>";
							str+="<div class='infoDes'>매월 세 번째 수요일</div>";
							str+="</li>";
							str+="<li>";
							str+="<em class='infoTit'>대여 품목</em>";
							str+="<div class='infoDes'>트레이닝 복, 양말, 운동화(유료)</div>";
							str+="</li>";
							str+="</ul>";
							str+="</div>";
							str+="</li>";
							str+="</ul>";
							
                           
							$("#menu5").html(str);
							str="";
						}
					}
					
				}
			)	
			
		}
	})
    </script>


</body>


</html>