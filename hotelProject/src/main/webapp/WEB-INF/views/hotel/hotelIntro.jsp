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
    <link href="${pageContext.request.contextPath }/resources/css/hotelIntro.css" rel="stylesheet">


    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
	<style type="text/css">
	           .s001-content{
	           overflow:hidden;
	        }
	</style>

</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <section>

        <div class="container tab">
            <h2 class="room-tit">벤자민의 안락한 객실</h2>
            <ul class="nav nav-tabs room-tog">
                <li class="col-xs-6  col-md-2 col-sm-6  col-lg-2 in active"><a data-toggle="tab" href="#home">스탠다드 더블</a></li>
                <li class="col-xs-6  col-md-2 col-sm-6  col-lg-2"><a data-toggle="tab" href="#menu1">스탠다드 트윈</a></li>
                <li class="col-xs-6  col-md-2 col-sm-6  col-lg-2"><a data-toggle="tab" href="#menu2">스탠다드 패밀리</a></li>
                <li class="col-xs-6  col-md-2 col-sm-6  col-lg-2"><a data-toggle="tab" href="#menu4">디럭스</a></li>
                <li class="col-xs-6  col-md-2 col-sm-6  col-lg-2"><a data-toggle="tab" href="#menu3">프리미어 디럭스</a></li>
                <li class="col-xs-6  col-md-2 col-sm-6  col-lg-2"><a data-toggle="tab" href="#menu5">그랜드</a></li>
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


    <script>
    $(document).ready(function(){
    	roomgetList();
		 
		function roomgetList(){
			$.getJSON(
				"../admin/roomgetList",
				function(data){
					var str="";
					var str2="";
					for(var i=0;i<data.length;i++){
						console.log(data);
						//str2+="<li class='col-xs-6  col-md-2 col-sm-6  col-lg-2'><a data-toggle='tab' href='#home' id='lia'>스탠다드 더블</a></li>";
						
						str +="<h3>"+data[i].hotelName+"</h3>";
						str +="<ul class='itemList roomList'>";
						str +="<li class='item'>";
						str +="<a href='##' class='itemImg'>";
						str +="<div class='col-xs-12 sizeHi'>";
						str +="<img src='../admin/view?fileLoca="+data[i].hotelfileLoca+"&filename="+data[i].hotelfilename+"&Name="+data[i].hotelName+"'>";
						str +="</div>";
						str +="</a>";
						str +="<div class='col-xs-12 itemInfo'>";
						str +="<div class='itemDes'>"+data[i].hotelContent+"</div>";
						str +="<div class='col-xs-12 s001-information__inner'>";
						str +="<h3 class='s001-information__title'>객실　개요</h3>";
						str +="<div class='s001-content'>";
						str +="<ul class='s001-content__col'>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>위치</div>";
						str +="<div class='s001-content__text text--dotline' style='overflow-wrap: break-word;'>"+data[i].hotelLoca+"</div>";
						str +="</li>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>침대</div>";
						str +="<div class='s001-content__text text--dotline' style='overflow-wrap: break-word;'>"+data[i].hotelBed+"</div>";
						str +="</li>";
						str +="</ul>";
						str +="<ul class='s001-content__col'>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold'>인원</div>";
						str +="<div class='s001-content__text text--dotline' style='overflow-wrap: break-word;'>"+data[i].hotelPeople+"</div>";
						str +="</li>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>전망</div>";
						str +="<div class='s001-content__text text--dotline' style='overflow-wrap: break-word;'>"+data[i].hotelView+"</div>";
						str +="</li>";
						str +="</ul>";
						str +="<ul class='s001-content__col'>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>객실크기</div>";
						str +="<div class='s001-content__text text--dotline' style='overflow-wrap: break-word;'>"+data[i].hotelsize+"m²</div>";
						str +="</li>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>체크인/아웃</div>";
						str +="<div class='s001-content__text text--dotline' style='overflow-wrap: break-word;'>"+data[i].hotelCheckin+"/"+data[i].hotelCheckout+"</div>";
						str +="</li>";
						str +="</ul>";
						str +="</div>";
						str +="</div>";
						str +="<div class='s124-information'>";
						str +="<div class='col-xs-12 s001-information__inner'>";
						str +="<h3 class='s001-information__title'>특별서비스</h3>";
						str +="<div class='s001-content'>";
						str +="<ul class='s001-content__col'>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word;'>";
						str +="<p>▶ 전 객실 초고속 무료인터넷(유선, 와이파이)</p>";
						str +="<p>▶ 서울 시내중심에서 스카이라인을 감상하며 즐기는 야외 수영장</p>";
						str +="<p>▶ 안전하게 편안하게 즐기는 실내 수영장</p>";
						str +="<p>▶ 웰빙 라이프를 실현할 수 있는 피트니스 짐</p>";
						str +="<p>▶ 쉬는 동안에도 놓칠 수 없다, 골프 필드</p>";
						str +="<p>▶ 안락하고 따뜻한 스파</p>";
						str +="</div>";
						str +="</li>";
						str +="</ul>";
						str +="</div>";
						str +="</div>";
						str +="<div class='col-xs-12 s001-information__inner'>";
						str +="<h3 class='s001-information__title'>객실서비스</h3>";
						str +="<div class='s001-content'>";
						str +="<ul class='s001-content__col'>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>일반</div>";
						str +="</li>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word;'>";
						str +="<p>TV/손전등/슬리퍼</p>";
						str +="<p>전화기/금고/티포트</p>";
						str +="<p>구두클리너/미니바</p>";
						str +="</div>";
						str +="</li>";
						str +="</ul>";
						str +="<ul class='s001-content__col'>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>욕실</div>";
						str +="</li>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word;'>";
						str +="<p>1회용 칫솔 및 치약</p>";
						str +="<p>면도기/가운/욕실용품</p>";
						str +="<p>헤어드라이어/비데</p>";
						str +="</div>";
						str +="</li>";
						str +="</ul>";
						str +="<ul class='s001-content__col'>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word; font-weight: bold;'>기타</div>";
						str +="</li>";
						str +="<li class='s001-content__item'>";
						str +="<div class='s001-content__title text--dotline' style='overflow-wrap: break-word;'>";
						str +="<p>케이블/위성 TV 채널</p>";
						str +="<p>무료 생수 1일 2병</p>";
						str +="<p>무료 차(TEA)서비스</p>";
						str +="</div>";
						str +="</li>";
						str +="</ul>";
						str +="</div>";
						str +="</div>";
						str +="</div>";
						str +="</div>";
						str +="</li>";
						str +="</ul>";
						str +="</div>";	
					
						if(data[i].hotelName == "Standard Family Room"){
							//$(".room-tog").html(str2);
							//$("#lia").attr("href","#menu2");
							//$("#lia").html("스탠다드 패밀리")
							$("#menu2").html(str);
							str="";
						}else if(data[i].hotelName == "Standard Double Room"){
							//$("#lia").attr("href","#home");
							//$("#lia").html("스탠다드 더블")
							$("#home").html(str);
							str="";
						}else if(data[i].hotelName == "Standard Twin Room"){
							//$("#lia").attr("href","#menu1");
							//$("#lia").html("스탠다드 트윈")
							$("#menu1").html(str);
							str="";
						}else if(data[i].hotelName == "Deluxe Room"){
							//$("#lia").attr("href","#menu4");
							//$("#lia").html("디럭스")
							$("#menu4").html(str);
							str="";
						}else if(data[i].hotelName == "Premier Deluxe Room"){
							//$("#lia").attr("href","#menu3");
							//$("#lia").html("프리미어 디럭스")
							$("#menu3").html(str);
							str="";
						}else if(data[i].hotelName == "Grand Room"){
							//$("#lia").attr("href","#menu5");
							//$("#lia").html("그랜드")
							$("#menu5").html(str);
							str="";
						}
					}
					
					
				}
			)	
			
		}
	})
    </script>

</body></html>