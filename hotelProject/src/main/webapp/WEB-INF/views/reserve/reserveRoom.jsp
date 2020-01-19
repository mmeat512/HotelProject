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
    <!--개인 스타일-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/reserve.css">
    
    <style type="text/css">
       .glyphicon-chevron-left:before{
          content: "\e257";
       }
       .glyphicon-chevron-right:before{
          content: "\e258";
       }
    </style>
 
</head>

<body>
<jsp:include page="../include/header.jsp"></jsp:include>    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 stepFirst">
                    <div class="titleSapn">
                           <a>객실선택</a>
                           <span>></span><a>옵션선택</a>
                           <span>></span><a>고객정보입력</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
           <div class="row">
                <div class="col-xs-12 reserve">
                   <div class="col-md-5 left">
                    <ul class="check">
                        <li><strong>체크인</strong></li>
                        <li class="checkIn"><input type="text" class="selector" id="checkIn"></li>
                    </ul>
                    <ul class="check">
                        <li><strong>체크아웃</strong></li>
                        <li class="checkOut"><input type="text" class="selector" id="checkOut" ></li>
                    </ul>
                    </div>
                   <div class="col-xs-12 col-md-5 left">
                        <ul class="sel">
                            <li><strong>객실</strong>
                            <select class="form-control" id="room" class="sel1">
                                <option ${room == 1 ? 'selected' : '' }>1</option>
                                <option ${room == 2 ? 'selected' : '' }>2</option>
                            </select>
                            </li>
                        </ul>
                        <ul class="sel">
                            <li><strong>성인</strong>
                              <select class="form-control" id="adult" class="sel1">
                                <option ${vo.reserveAdult == 1 ? 'selected' : '' }>1</option>
                                <option ${vo.reserveAdult == 2 ? 'selected' : '' }>2</option>
                                <option ${vo.reserveAdult == 3 ? 'selected' : '' }>3</option>
                                <option ${vo.reserveAdult == 4 ? 'selected' : '' }>4</option>
                              </select>
                             </li>
                        </ul>
                        <ul class="sel">
                            <li><strong>어린이 <span class="glyphicon glyphicon-question-sign childSel">
                               <span class="hidden">안내</span>
                                <span class="child">37개월 이상~만 12세 이하</span>
                            </span></strong>
                            <select class="form-control" id="kid" class="sel1">
                                <option ${vo.reserveKid == 0 ? 'selected' : '' }>0</option>
                                <option ${vo.reserveKid == 1 ? 'selected' : '' }>1</option>
                                <option ${vo.reserveKid == 2 ? 'selected' : '' }>2</option>
                                <option ${vo.reserveKid == 3 ? 'selected' : '' }>3</option>
                                <option ${vo.reserveKid == 4 ? 'selected' : '' }>4</option>
                              </select>
                             </li>
                        </ul>
                        <ul class="sel">
                            <li><strong>유아 <span class="glyphicon glyphicon-question-sign kidsSel">                     
                               <span class="hidden">안내</span>
                                <span class="kids">36개월이하</span></span></strong>
                            <select class="form-control" id="baby" class="sel1">
                                <option ${vo.reserveBaby == 0 ? 'selected' : '' }>0</option>
                                <option ${vo.reserveBaby == 1 ? 'selected' : '' }>1</option>
                                <option ${vo.reserveBaby == 2 ? 'selected' : '' }>2</option>
                                <option ${vo.reserveBaby == 3 ? 'selected' : '' }>3</option>
                                <option ${vo.reserveBaby == 4 ? 'selected' : '' }>4</option>
                              </select>
                            </li>
                        </ul>                        
                    </div> 
                    <div class="col-xs-12 col-md-2 searchBtn">
                        <button type="button" class="btn btn-info reserveSearchBtn" id="search" onclick="reserveSearchBtn()">　검색　</button>
                    </div>
                </div>
            </div>
        </div>

    <div class="searchResult">
        <div class="container">
            <div class="row searchRoom">
            
            </div>
        </div>
        <!--모달창-->
        <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">

        </div>
      </div>
  </div>
</div>         
            
    </section>
   
 <jsp:include page="../include/footer.jsp"></jsp:include>

    <script>
    var date1 = new Date(); //전역변수 선언
    
    /*날짜 선택 달력*/
    calendar1 = 
       $("#checkIn").flatpickr({
       minDate : "today",
        dateFormat: "Y. m. d. D", 
        onChange : function(selectedDates, dateStr, instance) {
              calendar2.set("minDate", selectedDates[0]);
              $("#checkOut").val(calendar1.formatDate(selectedDates[0], "Y. m. d. D")); 
           }
        
    });
    
    /* calendar2의 날짜 */
    calendar2 = 
    $("#checkOut").flatpickr({
       minDate : "today",
       dateFormat: "Y. m. d. D"
    });
        
    /*오늘 날짜*/
    var date = new Date();
    var year = date.getFullYear();
    var month = date.getMonth()+1;
    var day = date.getDate();
    if(day<10) {
    var time = year+". 0"+month+". 0"+day+". "+getTodayLabel();
    } else {
       var time = year+". 0"+month+". "+day+". "+getTodayLabel();
    }
    
    function getTodayLabel() {
        var week = new Array('Sun', 'Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat');

        var today = new Date().getDay();
        var todayLabel = week[today];

        return todayLabel;
    };
    
    $(document).ready(function(){
        $(".selector").val(time);
    });
    
    </script>
    <script>
      $(document).ready(function(){
         var vo = '${vo}';
         if(vo != ''){
            var checkIn = '${vo.reserveCheckin}';
            var checkOut = '${vo.reserveCheckout}';
            console.log(checkIn);
            console.log(checkOut);
            calendar1.setDate(checkIn,false, "Y. m. d. D");
            calendar2.setDate(checkOut,false, "Y. m. d. D");
            $("#search").trigger("click");
         }
      })
   
   </script>
    
    <!--모달창 스크립트-->
    <script>
        $(".modal-content").on("click",".nextRight",function(){
            var imgList = $(this).parent("div").children(".carousel-inner").children("div");
            var img1 = imgList[0].getAttribute("class");
            var img2 = imgList[1].getAttribute("class");
            var img3 = imgList[2].getAttribute("class");
            if(img1 == "item active"){
                $(".preImg1 >img").css("border","0");
                $(".preImg2 >img").css("border","3.5px solid #d0baa8");
                $(".preImg3 >img").css("border","0");
                $(".DetailRoom0").css("display","none");
                $(".DetailRoom1").css("display","block");
                $(".DetailRoom2").css("display","none");
            }
            else if(img2 =="item active"){
                $(".preImg1 >img").css("border","0");
                $(".preImg2 >img").css("border","0");
                $(".preImg3 >img").css("border","3.5px solid #d0baa8");
                $(".DetailRoom0").css("display","none");
                $(".DetailRoom1").css("display","none");
                $(".DetailRoom2").css("display","block");
            }
            else if(img3 =="item active"){
                $(".preImg1 >img").css("border","3.5px solid #d0baa8");
                $(".preImg2 >img").css("border","0");
                $(".preImg3 >img").css("border","0");
                $(".DetailRoom0").css("display","block");
                $(".DetailRoom1").css("display","none");
                $(".DetailRoom2").css("display","none");
            }
        });
        $(".modal-content").on("click",".prveLeft",function(){
            var imgList = $(this).parent("div").children(".carousel-inner").children("div");
            var img1 = imgList[0].getAttribute("class");
            var img2 = imgList[1].getAttribute("class");
            var img3 = imgList[2].getAttribute("class");
           
            if(img1 == "item active"){
                $(".preImg1 >img").css("border","0");
                $(".preImg2 >img").css("border","0");
                $(".preImg3 >img").css("border","3.5px solid #d0baa8");
                $(".DetailRoom0").css("display","none");
                $(".DetailRoom1").css("display","none");
                $(".DetailRoom2").css("display","block");
            }
            else if(img2 =="item active"){
                $(".preImg1 >img").css("border","3.5px solid #d0baa8");
                $(".preImg2 >img").css("border","0");
                $(".preImg3 >img").css("border","0");
                $(".DetailRoom0").css("display","block");
                $(".DetailRoom1").css("display","none");
                $(".DetailRoom2").css("display","none");
            }
            else if(img3 =="item active"){
                $(".preImg1 >img").css("border","0");
                $(".preImg2 >img").css("border","3.5px solid #d0baa8");
                $(".preImg3 >img").css("border","0");
                $(".DetailRoom0").css("display","none");
                $(".DetailRoom1").css("display","block");
                $(".DetailRoom2").css("display","none");
            }
        })
  </script>
   
   <!--예약하기 열기-->
   <script>
        $(".searchRoom").on("click",".resBtn",function(){
                $(this).parent("li").parent("ul").parent("div").parent("div").children(".searchDetail").css("display","inline-block");
               /* $(this).parent("div").css("display","inline-block");*/
                $(this).html("　닫기　 "+"<span class='glyphicon glyphicon-chevron-up'></span>");
                $(this).attr("class","btn btn-info closeBtn");
        });
        $(".searchRoom").on("click",".closeBtn",function(){
            $(this).parent("li").parent("ul").parent("div").parent("div").children(".searchDetail").css("display","none");
            $(this).html("예약하기 "+ "<span class='glyphicon glyphicon-chevron-down'></span>");
            $(this).attr("class","btn btn-info resBtn");

        });
    </script>
    
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
   </script>
   
    <!-- 검색 하기-->
    <script>
       function reserveSearchBtn(){
           /* 날짜와 맞지 않으면 데이터 안보임 */
           date = document.getElementsByClassName("selector");
           var myCheckin = date[0].value.split(".");
           var myCheckout = date[1].value.split(".");

           if(myCheckin[0]>myCheckout[0]) {
              alert("날짜 설정을 다시 확인해주세요.");
            return false;
           } else if(myCheckin[1]>myCheckout[1]) {
              alert("날짜 설정을 다시 확인해주세요.");
            return false;
           } else if(myCheckin[2]>=myCheckout[2]) {
              alert("날짜 설정을 다시 확인해주세요.");
            return false;
           }
           $(".searchResult").show();
          var vo = '${vo}';
          if(vo == ''){
               var checkin = $("#checkIn").val();
               var checkout = $("#checkOut").val();
               var adult = $("#adult option:selected").val();
               var kid = $("#kid option:selected").val();
               var baby = $("#baby option:selected").val();
               console.log(checkin);
               console.log(checkout);
               console.log(adult);
               console.log(kid);
               console.log(baby);
               var json = {"reserveCheckin":checkin , 
                       "reserveCheckout":checkout, 
                       "reserveAdult":adult, 
                       "reserveKid":kid, 
                       "reserveBaby":baby}
               $.ajax({
                    type:"POST",
                    url:"reserveSearch",
                    data:JSON.stringify(json),
                    contentType:"application/json; charset=utf-8",
                    success:function(data){
                       var str = "";
                       console.log(data);
                       var arr = [];
                       for(var i = 0 ; i < data.length; i++){
                          arr[i] = data[i].hotelName2;
                          arr = uniqArr(arr);
                          console.log(arr[2]);
                         if(data[i].hotelName2 == arr[i]){
                            var lastIndex = data[i].hotelName.lastIndexOf(" ");
                            var index = data[i].hotelName.indexOf(" ");
                            var length = data[i].hotelName.length;
                            if(data[i].hotelName.includes('Standard')){
                               data[i].hotelName = data[i].hotelName.substring(0,index)+data[i].hotelName.substring(lastIndex,length);
                               data[i].hotelsize = "26㎡~42㎡";
                               data[i].hotelBed = "더블/트윈/패밀리트윈";
                            }
                              str += "<div class='"+data[i].hotelName+"'>";
                                 str += "<div class='col-xs-12 reserveSearch'>";
                                 str += "<input type='hidden' value='"+data[i].hotelfileLoca+"' id='fileloca'>";
                                 str += "<input type='hidden' value='"+data[i].hotelfilename+"' id='filename'>";
                                 str += "<input type='hidden' value='"+data[i].hotelName+"' id='hotelname'>";
                                 str += "<ul class='col-sm-4'>";
                                 str += "<li><img src='../admin/view?fileLoca="+data[i].hotelfileLoca+"&filename="+data[i].hotelfilename+"&Name="+data[i].hotelName+"'></li>";
                                 str += "</ul>";
                                 str += "<ul class='col-sm-4'>";
                                 str += "<li class='roomName'>"+data[i].hotelName+"</li>";
                                 str += "<li>객실크기 : "+data[i].hotelsize+"㎡</li>";
                                 str += "<li>침대타입 : "+data[i].hotelBed+"</li>";
                                 str += "<li class='roomMore'><a href='"+data[i].hotelName+"' data-toggle='modal' class='moreDetail'>더보기</a></li>";
                                 str += "</ul>";
                                 str += "<ul class='col-sm-4 reserveSel'>";
                                 str += "<li class='reservePrice'>";
                                 str += "<div class='price'>"+numberWithCommas(data[i].hotelPrice*getDateDiff(checkin,checkout))+"원 ~</div>";
                                 str += "<div>"+getDateDiff(checkin,checkout)+" 박</div>";
                                 str += "</li>";
                                 str += "<li style='display: inline-block; '>";
                                 str += "<button type='button' class='btn btn-info resBtn'>예약하기 <span class='glyphicon glyphicon-chevron-down'></span></button>";                            
                                 str += "</li>";
                                 str += "</ul>";
                                 str += "</div>";
                          		 str += searchDetail(data,i);
                                str += "</div>";
                         } 
                       }
                       $(".searchRoom").html(str);
                    },
                    error:function(status){
                       alert("다시시도해주세요"+status);
                    }
                 })
                 
              }else{
                     var checkin = '${vo.reserveCheckin}';
                  var checkout = '${vo.reserveCheckout}';
                  var adult = '${vo.reserveAdult}';
                  var kid = '${vo.reserveKid}';
                  var baby = '${vo.reserveBaby}';
                  console.log(checkin);
                  console.log(checkout);
                  console.log(adult);
                  console.log(kid);
                  console.log(baby);
                  var json = {"reserveCheckin":checkin , 
                          "reserveCheckout":checkout, 
                          "reserveAdult":adult, 
                          "reserveKid":kid, 
                          "reserveBaby":baby}
                  $.ajax({
                       type:"POST",
                       url:"reserveSearch",
                       data:JSON.stringify(json),
                       contentType:"application/json; charset=utf-8",
                       success:function(data){
                          var str = "";
                          console.log(data);
                          var arr = [];
                          for(var i = 0 ; i < data.length; i++){
                             arr[i] = data[i].hotelName2;
                             arr = uniqArr(arr);
                             console.log("왜안나와:"+arr[i]);
                            if(data[i].hotelName2 == arr[i]){
                               var lastIndex = data[i].hotelName.lastIndexOf(" ");
                               var index = data[i].hotelName.indexOf(" ");
                               var length = data[i].hotelName.length;
                               if(data[i].hotelName.includes('Standard')){
                                  data[i].hotelName = data[i].hotelName.substring(0,index)+data[i].hotelName.substring(lastIndex,length);
                                  data[i].hotelsize = "26㎡~42㎡";
                                  data[i].hotelBed = "더블/트윈/패밀리트윈";
                               }
                                 str += "<div class='"+data[i].hotelName+"'>";
                                    str += "<div class='col-xs-12 reserveSearch'>";
                                    str += "<input type='hidden' value='"+data[i].hotelfileLoca+"' id='fileloca'>";
                                    str += "<input type='hidden' value='"+data[i].hotelfilename+"' id='filename'>";
                                    str += "<input type='hidden' value='"+data[i].hotelName+"' id='hotelname'>";
                                    str += "<ul class='col-sm-4'>";
                                    str += "<li><img src='../admin/view?fileLoca="+data[i].hotelfileLoca+"&filename="+data[i].hotelfilename+"&Name="+data[i].hotelName+"'></li>";
                                    str += "</ul>";
                                    str += "<ul class='col-sm-4'>";
                                    str += "<li class='roomName'>"+data[i].hotelName+"</li>";
                                    str += "<li>객실크기 : "+data[i].hotelsize+"㎡</li>";
                                    str += "<li>침대타입 : "+data[i].hotelBed+"</li>";
                                    str += "<li class='roomMore'><a href='"+data[i].hotelName+"' data-toggle='modal' class='moreDetail'>더보기</a></li>";
                                    str += "</ul>";
                                    str += "<ul class='col-sm-4 reserveSel'>";
                                    str += "<li class='reservePrice'>";
                                    str += "<div class='price'>"+numberWithCommas(data[i].hotelPrice*getDateDiff(checkin,checkout))+"원 ~</div>";
                                    str += "<div>"+getDateDiff(checkin,checkout)+" 박</div>";
                                    str += "</li>";
                                    str += "<li style='display: inline-block; '>";
                                    str += "<button type='button' class='btn btn-info resBtn'>예약하기 <span class='glyphicon glyphicon-chevron-down'></span></button>";                            
                                    str += "</li>";
                                    str += "</ul>";
                                    str += "</div>";
                               str += searchDetail(data,i);
                                   str += "</div>";
                            } 
                          }
                          $(".searchRoom").html(str);
                       },
                       error:function(status){
                          alert("다시시도해주세요"+status);
                       }
                    })
              }
       }
    
       //중복값제거
          function uniqArr(arr) {
               var chk = [];
               for (var i = 0; i < arr.length; i++) {
                   if (chk.length == 0) {
                       chk.push(arr[i]);
                   } else {
                       var flg = true;
                       for (var j = 0; j < chk.length; j++) {
                           if (chk[j] === arr[i]) {
                               flg = false;
                               break;
                           }
                       }
                       if (flg) {chk.push(arr[i]);}
                   }
               }
              
               console.log("중복:"+chk);
               return chk;
           }
 
    </script>
    
    <script>
       function searchDetail(data,cnt){
          var checkin = $("#checkIn").val();
          var checkout = $("#checkOut").val();
          console.log(data);
          console.log(cnt);
         var str = "";
         console.log(data[cnt].roomType);
         for(var a = 0; a <= cnt; a++){
            str = "";
            for(var c = 0; c < data.length; c++){
               if(data[cnt].roomType == data[c].roomType){
                       str += "<div class='col-xs-12 searchDetail'>";
                     str += "<div class='col-xs-12 Detail'>";
                     str += "<div class='col-sm-6 left'>";
                     str += "<label class='radio-inline' style='height: 10px; line-height: 10px;'>";
                     str += "<input type='radio' name='optradio' id='bedType' value='"+data[c].bedType+"'>";
                     str += "<img src='${pageContext.request.contextPath }/resources/img/double.JPG'> "+data[c].hotelView+"/"+data[c].bedType+"";
                     str += "<a href=''../hotel/hotelIntro'>자세히 보기</a>";
                     str += "</label>";
                     str += "</div>";
                     str += "<div class='col-sm-6 right'>";
                     //값넘기기
                     str += "<input type='hidden' value='"+data[c].roomType+"' id='roomType'>";

                     str += "<button type='button' class='btn btn-info reserveBtn'>예약하기</button>";
                     str += "<strong class='detailPrice'>"+numberWithCommas(data[c].hotelPrice*getDateDiff(checkin,checkout))+" 원</strong>";
                     str += "</div>";
                     str += "</div>";
                     str += "</div>";
               }
            }
          }
         return str;
       }
    </script>
    
    <!-- 예약하기 -->
    <script>
       $(".searchRoom").on("click",".reserveBtn",function(){
    	   var userId = '${sessionScope.userId}';
    	   if(userId == ''){
    		   alert("로그인 후 이용가능합니다.");
    		   location.href='../users/userLogin';
    		   return false;
    	   }
          var checkin = $("#checkIn").val();
          var checkout = $("#checkOut").val();
          var room = $("#room option:selected").val();
          var adult = $("#adult option:selected").val();
          var kid = $("#kid option:selected").val();
          var baby = $("#baby option:selected").val();
          var roomType = $(this).parent("div").children("#roomType").val();
          var bedType = $("input[name='optradio']:checked").val();
          if(!$('input:radio[name=optradio]').is(':checked')){
             alert("객실을 선택하세요");
             return false;
          }
          
          //사진
          var fileloca = $(this).parent("div").parent("div").parent("div").parent("div").children(".reserveSearch").children("#fileloca").val();
          var filename = $(this).parent("div").parent("div").parent("div").parent("div").children(".reserveSearch").children("#filename").val();
          var hotelname = $(this).parent("div").parent("div").parent("div").parent("div").children(".reserveSearch").children("#hotelname").val();
          
          //가격
          var hotelprice = $(this).parent("div").children("strong").html()
          hotelprice = hotelprice.substring(0,hotelprice.lastIndexOf(" ")).replace(/,/g, "");
          hotelprice = parseInt(hotelprice);
          console.log(hotelprice);
          var detailArr = {"reserveCheckin":checkin,
                      "reserveCheckout":checkout,
                      "room":room,
                      "reserveAdult":adult,
                      "reserveKid":kid,
                      "reserveBaby":baby,
                      "roomType":roomType,
                      "bedType":bedType,
                      "fileloca":fileloca,
                      "filename":filename,
                      "hotelname":hotelname,
                      "hotelprice":hotelprice};
         console.log(detailArr);
          var form = document.createElement("form");
          
          form.setAttribute("charset", "UTF-8");
          form.setAttribute("method", "Post");  //Post 방식
          form.setAttribute("action", "reserveForm"); //요청 보낼 주소
         
          for(var b in detailArr){
             var hiddenField = document.createElement("input");
             hiddenField.setAttribute("type", "hidden");
             hiddenField.setAttribute("name", b);
             hiddenField.setAttribute("value", detailArr[b]);
             form.appendChild(hiddenField);
          }
          document.body.appendChild(form);

          form.submit();
       })
    </script>
    
    <!-- 날짜 -->
    <script>
      function getDateDiff(date1,date2) {
           var arrDate1 = date1.split(". ");
           var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1])-1,parseInt(arrDate1[2]));
           var arrDate2 = date2.split(". ");
           var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1])-1,parseInt(arrDate2[2]));
           
           var getDiffTime = getDate2.getTime() - getDate1.getTime();
             
           return Math.floor(getDiffTime / (1000 * 60 * 60 * 24));
        }
    </script>
    
    <!-- 모달창 -->
    <script>
       $(".searchRoom").on("click",".moreDetail",function(event){
          event.preventDefault();
          var hotelname = $(this).attr("href");
          hotelname = hotelname.substring(0, hotelname.indexOf(" "));
          console.log(hotelname);
            var str = "";
          $.getJSON(
             "reserveDetail/"+hotelname,
             function(data){
                console.log(data);
                var hotelName = data[0].hotelName
                  str += "<div class='modal-header'>";
                  str += "<button type='button' class='close' data-dismiss='modal'>&times;</button>"
                  str += "<h4 class='modal-title' style='font-weight: bold;''>"+hotelName.substring(0, hotelName.indexOf(" "))+"</h4>"
                   str += "</div>"
                   str += "<div class='modal-body'>"
                          //<!--캐러셀-->
                    str += "<div id='myCarousel' class='carousel slide' data-ride='carousel' data-interval='false'>"
                        //<!-- Indicators -->
                  str += "<ol class='carousel-indicators'>";
                  str += "<li data-target='#myCarousel' data-slide-to='0' class='active'></li>";
                  if(data.length != 1){
                     for(var i = 1; i < data.length; i++){
                        str += "<li data-target='#myCarousel' data-slide-to='"+i+"'></li>";
                     }
                  }
                  str += "</ol>";
                       //<!-- Wrapper for slides -->
                  str += "<div class='carousel-inner'>";
                  for(var j = 0; j  < data.length; j++){
                     if(j == 0){
                        str += "<div class='item active'>";
                     }else{
                         str += "<div class='item'>";
                     }
                     str += "<img src='../admin/view?fileLoca="+data[j].hotelfileLoca+"&filename="+data[j].hotelfilename+"&Name="+data[j].hotelName+"' style='width:100%;'>";
                     str += "</div>";
                  }
                  str += "</div>";
                        //<!-- Left and right controls -->
                  if(data.length != 1){
                     str += "<a class='left carousel-control prveLeft' href='#myCarousel' data-slide='prev'>";
                     str += "<span class='glyphicon glyphicon-chevron-left'></span>";
                     str += "<span class='sr-only'>Previous</span>";
                     str += "</a>";
                     str += "<a class='right carousel-control nextRight' href='#myCarousel' data-slide='next'>";
                     str += "<span class='glyphicon glyphicon-chevron-right'></span>";
                     str += "<span class='sr-only'>Next</span>";
                     str += "</a>";
                  }
                  str += "</div>";
                  str += "</div>";
                  str += "<div class='modal-body'>";
                  str += "<div class='row'>";
                  str += "<div class='col-xs-12 imgPre'>";
                  for(var k = 0; k <data.length; k++){
                     str += "<div class='col-sm-3 col-xs-4 preImg"+(k+1)+"'>";
                     if(k == 0){
                        str += "<img src='../admin/view?fileLoca="+data[k].hotelfileLoca+"&filename="+data[k].hotelfilename+"&Name="+data[k].hotelName+"' style='border:3.5px solid #d0baa8;'>";
                     }else{
                        str += "<img src='../admin/view?fileLoca="+data[k].hotelfileLoca+"&filename="+data[k].hotelfilename+"&Name="+data[k].hotelName+"'>";
                     }
                     str += "</div>";
                  }
                  str += "<div class='col-xs-12 detail2'>";
                  for(var m = 0; m <data.legnth; m++){
                     str += data[m].hotelContent;
                     str += "123";
                  }
                  str += "</div>";
                  for(var l = 0; l <data.length; l++){
                     if(l != 0){
                        str += "<div class='col-xs-12 col-sm-6 DetailRoom"+l+"' style='margin-bottom: 20px; display:none;'>";
                     }else{
                        str += "<div class='col-xs-12 col-sm-6 DetailRoom"+l+"' style='margin-bottom: 20px;'>";
                     }
                     str += "<ul class='col-xs-6' style='padding: 0px;'>";
                     str += "<li><strong>체크인</strong> : "+data[l].hotelCheckin+"</li>";
                     str += "<li><strong>체크아웃</strong> : "+data[l].hotelCheckout+"</li>";
                     str += "</ul>";
                     str += "<ul class='col-xs-6' style='padding:0px;'>";
                     str += "<li><strong>침대</strong> : "+data[l].hotelBed+"</li>";
                     str += "<li><strong>인원</strong> : "+data[l].hotelPeople+"명</li>";
                     str += "<li><strong>전망</strong> : "+data[l].hotelView+"</li>";
                     str += "<li><strong>객실크기</strong> : "+data[l].hotelsize+"m²</li>";
                     str += "</ul>";
                      str += "</div>";
                  }
                  str += "<div class='col-xs-12 col-sm-6 roomService' >";
                  str += "<div class='col-xs-5' style='padding: 0; font-weight: bold;'>";
                  str += "객실이용";
                  str += "</div>";
                  str += "<ul class='col-xs-7 roomDetail'>";
                  str += "<li>TV/손전등/슬리퍼</li>";
                  str += "<li>전화기/금고/티포트</li>";
                  str += "<li>구두클리너/미니바</li>";
                  str += "<li>1회용 칫솔 및 치약</li>";
                  str += "<li>면도기/가운/욕실용품</li>";
                  str += "<li>헤어드라이어/비데</li>";
                  str += "<li>케이블/위성 TV 채널</li>";
                  str += "<li>무료 생수 1일 2병</li>";
                  str += "<li>무료 차(TEA)서비스</li>";
                  str += "</ul>";
                  str += "</div>";
                  str += "</div>";
                  str += "</div>";
            
                  $(".modal-content").html(str);
                $("#myModal").modal("show");
             }
          )
                    
       })
    </script>
    
    <!-- 가격 -->
    <script>
       function numberWithCommas(x) {
          return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      }
    </script>
    
</body>
</html>