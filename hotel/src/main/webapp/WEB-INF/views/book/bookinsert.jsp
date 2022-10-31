<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
   
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
   <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
   
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="http://localhost:9000/hotel/resources/css/detail.css"/>
    <link rel="stylesheet" type="text/css" href="http://localhost:9000/hotel/resources/css/nav.css"/>
    
    <script>
    $("[data-nav=service]").css("display","block");
    $("[data-nav=service]").children().eq(2).children().first().css("color","white");
    </script> 
   
   <script>    
    $(document).ready(function () {  
       $.datepicker.setDefaults($.datepicker.regional['ko']);             
       $( ".sdate" ).datepicker({                 
          changeMonth: true,                  
          changeYear: true,                 
          nextText: '다음 달',                 
          prevText: '이전 달',                  
          dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],                 
          dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],                  
          monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
          monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
          dateFormat: "yy-mm-dd",                 minDate: 0,                       
          // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 가능)                 
          onClose: function( selectedDate ) {                          
             //시작일(startDate) datepicker가 닫힐때                      
             //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                     
             $(this).datepicker( "option", "minDate", selectedDate );                 
             }                 
             });            
             $( ".edate" ).datepicker({                 
                changeMonth: true,                  
                changeYear: true,                 
                nextText: '다음 달',                 
                prevText: '이전 달',                  
                dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],                 
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],                  
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
                dateFormat: "yy-mm-dd",                 minDate: 0,                       
                // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)                 
                onClose: function( selectedDate ) {                         
                   // 종료일(endDate) datepicker가 닫힐때                     
                   // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정                     
                   $(this).datepicker( "option", "maxDate", selectedDate );  
                   }                 
                   });  
                      $( this ).val($(this).attr("id"));
                   });
    </script>
    <script>
     $( document ).ready( function() {
        var bprice = '${vo.bprice}';
        
         $( '#startDate_, #endDate_' ).change( function() {
            var start= $( '#startDate_' ).val();
             var d = new Date(start);
            
             var end = $( '#endDate_' ).val();
             var v = new Date(end);
             var sum=(v.getTime() - d.getTime()) / (1000 * 3600 * 24);//총 날짜
             var day = sum;
             var last = (sum)*bprice;
            
              if(end == "" ){
                 $( '#per_date' ).text( "" );
                  $( '#sumprice' ).text( "" );
                  $( '#total' ).text( "" );
              }else if(last<=0){
                 alert("날짜를 정확히 확인해주시기 바랍니다.");
                 location.reload();
              }
              else{
               last=last.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
               $( '#per_date' ).text( day );
               $( '#sumprice' ).text( last );
               $( '#price' ).val( last );               
               $( '#total' ).text( last );
             }
           
         });
        
       });
    
    </script>
 <script type="text/javascript">
    
    function eve(){
       var mid         = $("#mid").val();
       var radatestart = $("#startDate_").val();
       var radateend   = $("#endDate_").val();
       
       if(radatestart==""){
          alert("입실 날짜를 선택해 주세요");
          return false;
       }else if(radateend==""){
          alert("퇴실 날짜를 선택해 주세요");
          return false;
       }else if(mid==""){
          alert("로그인후 예약을 진행해 주세요");
          location.reload();
          return false;
       }
       bookinsert.submit();
    }
    
    
    </script>
<title>Insert title here</title>
</head>
<body>
   <%@ include file="../header.jsp" %>
   <form name="bookinsert" action="bookinsertresult.do" method="POST">
   <input type="hidden" id="mid" name="mid" value="${svo.mid}"/>
   <input type="hidden" name="bid" value="${vo.bid}"/>
   <input type="hidden" id="price" name="price" value=""/>
   <input type="hidden" name="bsfile" id="bsfile" value="${vo.bsfile}" />
   <input type="hidden" name="brname" id="brname" value="${vo.brname}"/>
      

<!--본문-->
<!-- 숙소 이미지-->
<div>
    <div class="left_side">
        <img src="http://localhost:9000/hotel/resources/upload/${vo.bsfile}"/>
    </div>
    <div class="middle_side">
        <img src="http://localhost:9000/hotel/resources/img/hotel1.jpg"/>
        <img src="http://localhost:9000/hotel/resources/img/hotel2.jpg"/>
    </div>
    <div class="right_side">
        <img src="http://localhost:9000/hotel/resources/img/hotel3.jpg"/>
        <img src="http://localhost:9000/hotel/resources/img/hotel4.jpg"/>
    </div>
</div>

<div class="row">
    <!--        숙소 이름, 간략정보-->
    <div class="left_column">
        <div class="item" id="leftSideTop">
            <div class="hotel_info">
                <div class="hotel_name">
                    ${vo.brname }
                </div>
                <div style="font-size: 16px; margin-bottom:10px">
                     SEOUL HOTEL
                </div>
                <div style="font-size: 16px;">
                    <span>인원 2명</span>&nbsp;
                    <span>침실 1개</span>&nbsp;
                    <span>침대 1개</span>&nbsp;
                    <span>욕실 1개</span>
                </div>
            </div>
            <div class="line"></div>

        </div>
        <!--숙소설명-->
        <div class="item" id="leftSideMiddle">
            <div class="hotel_info">
                <div class="hotel_description">
                    독창적으로 설계된 객실 컬렉션<br/>사진 갤러리에 표시된 객실 중 하나가 제공됩니다.<br/> 장식은 다르지만 크기, 편의 시설 및 위치는 동일합니다. 궁금한 점이 있으면 저에게 연락하십시오.<br/><br/>우리 아파트는 모든 현대적인 가구로 새로 지어진 여행자에게 완벽합니다. 집에 대한 자세한 내용과 편의 시설은 아래를 참조하십시오.<br/><br/>숙소<br/>공간은 다음을 포함합니다 :<br/>* 25 평방 미터의 생활 공간 (약 269 평방 피트)<br/>* 넓은 바닥에서 천장까지의 창문이있는 밝고 아늑한 공간<br/>* 발코니 지역<br/>* 1 또는 2 인용 발코니 좌석<br/>* 2 인용 침대 (140cm x 200cm)<br/>* 기본 일본식 케이블 (NHK, TBS 등)이있는 32 인치 SHARP LED TV<br/>* 기본 세면 용품 (바디워시, 샴푸, 컨디셔너, 타올)<br/>* 비데 비데 기능을 갖춘 화장실<br/>* 헤어 드라이어<br/>* 전장 거울<br/>* 전신 욕조<br/>* 세탁기<br/>* 건조기 실 (욕실 내장 기능)<br/>* 다리미와 다리미판<br/>* 객실 내 초고속 인터넷 (WIFI)<br/>* 스토브 레인지가있는 주방, 냉장고<br/>* 전자 레인지, 토스터 오븐, 생선 그릴, 주전자<br/>* 가벼운 조리를위한 기본 주방 조리기구 및기구<br/>* 2 인용 책상 또는 식탁<br/>* Googl Chromecast (YouTube, Netflix 등)<br/>* 열쇠가없는 SmartLock 엔트리 시스템
                </div>
            </div>
            <div class="line"></div>
            <!--숙소위치-->
            <div class="hotel_info">
                <div class="hotel_map">
                    <div class="location">
                        <span>숙소 위치</span>&nbsp;
                    </div>
                </div>
                <div id="map"></div>
            </div>
            <div class="line"></div>
        </div>

        <!--숙소후기-->
        <div class="item" id="leftSideBottom">
            <div class="hotel_info">
                
                    <div class="hotel_review">
                        <div style="font-weight: bold; font-size: 17px;">
                            <span> 평점 3.9 </span>&nbsp;
                            <span>후기 22</span>
                        </div>
                    </div>
                    <div class="line"></div>
                    
                        <div class="tray">
                            <div style="width:100%">
                                <div class="review_profile">
                                    <div class="profile_img">
                                        <img src="https://img.icons8.com/ios-filled/256/000000/user-male-circle.png"/>
                                    </div>
                                    <div class="profile_info">
                                        <div>지수</div>
                                        <p class="margin_top">2020년 7월 26일</p>
                                    </div>
                                </div>
                                <div class="review_detail">
                                    <div>
                                        <div class="margin_top">교통편, 편의시설이 좋았고 숙소가 가격대비 괜찮아요
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                    
                        <div class="tray">
                            <div style="width:100%">
                                <div class="review_profile">
                                    <div class="profile_img">
                                        <img src="https://img.icons8.com/ios-filled/256/000000/user-male-circle.png"/>
                                    </div>
                                    <div class="profile_info">
                                        <div>인행</div>
                                        <p class="margin_top">2020년 7월 26일</p>
                                    </div>
                                </div>
                                <div class="review_detail">
                                    <div>
                                        <div class="margin_top">숙소가 생각보다 작아요 아침에 햇살비치는건 좋네요
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                    
                        <div class="tray">
                            <div style="width:100%">
                                <div class="review_profile">
                                    <div class="profile_img">
                                        <img src="https://img.icons8.com/ios-filled/256/000000/user-male-circle.png"/>
                                    </div>
                                    <div class="profile_info">
                                        <div>상수</div>
                                        <p class="margin_top">2020년 7월 26일</p>
                                    </div>
                                </div>
                                <div class="review_detail">
                                    <div>
                                        <div class="margin_top">숙소를 어렵지않게 찾아갔어요 지하철가까워요 집은 깨끗했어요 주변에 식당도 많아서 괜찮았어요
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                    
                        <div class="tray">
                            <div style="width:100%">
                                <div class="review_profile">
                                    <div class="profile_img">
                                        <img src="https://img.icons8.com/ios-filled/256/000000/user-male-circle.png"/>
                                    </div>
                                    <div class="profile_info">
                                        <div>동옥</div>
                                        <p class="margin_top">2020년 7월 26일</p>
                                    </div>
                                </div>
                                <div class="review_detail">
                                    <div>
                                        <div class="margin_top">지하철이 근처에 있어서 편했어요
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                    
                        <div class="tray">
                            <div style="width:100%">
                                <div class="review_profile">
                                    <div class="profile_img">
                                        <img src="https://img.icons8.com/ios-filled/256/000000/user-male-circle.png"/>
                                    </div>
                                    <div class="profile_info">
                                        <div>준범</div>
                                        <p class="margin_top">2020년 7월 26일</p>
                                    </div>
                                </div>
                                <div class="review_detail">
                                    <div>
                                        <div class="margin_top">호스트가 친절해서 좋았어요 다음에 또 방문하고 싶네요
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                    
                

            </div>
        </div>
    </div>
    <!--        숙소 결제-->
    <div class="right_column">
        <div class="item">
            <div>
                <div class="per_day_charge" id="onedayprice">₩<fmt:formatNumber value="${vo.bprice}" pattern="#,###" /> / 박</div>
                <div style="margin: 20px 0 0 0; font-size: 14px">날짜</div>
                <div class="reservation_tray">
                   
                       <input type="text" name="radatestart" id="startDate_" class="sdate">
                  <input type="text" name="radateend" id="endDate_" class="edate">
                    
                </div>
            </div>
            <!--                요금표시-->
            <div class="receipt">
                <div class="charge_detail">
                    <span id="per_day_cost">₩<fmt:formatNumber value="${vo.bprice}" pattern="#,###" /></span>
                    <b>X</b><span id="per_date"></span><b>박</b>
                    <span class="charge" id="sumprice"></span>
                    <span class="currency_mark">₩</span>
                </div>

                <div class="charge_detail">
                    <span>청소비</span>
                    <span class="charge">0</span>
                    <span class="currency_mark">₩</span>
                </div>

                <div class="charge_detail">
                    <span>서비스 수수료</span>
                    <span class="charge">0</span>
                    <span class="currency_mark">₩</span>
                </div>

                <div class="charge_detail" id="chargeSum">
                    <span>총 합계</span>
                    <span class="charge" id="total"></span>
                    <span class="currency_mark">₩</span>

                </div>
            </div>
            <!--                예약버튼-->
            <div style="padding: 0 20px; margin:20px 0">
                
                   
                    <input type="button" id="greenBtn" onclick="eve()" value="예약하기"/>
                    <input type="button" id="greenBtn" onclick="location.href='http://localhost:9000/hotel/shillaStay.do'" value="홈으로"/>
                
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <h5>Hotel reservation dummy site</h5>
</div>

<!--get_url-->
<!-- <script src="/static/js/get_url.js"></script>

maps API 관련 코드
<script src="/static/js/api/hotel_map.js"></script>

모달처리 JS
<script src="/static/js/modal/login_modal.js"></script>

일정 그리고 숙박요금 계산 JS
<script src="/static/js/room/detail.js"></script> -->

<!--구글 맵스 API-->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBq4C8917Pxr1jaL8LAMhaIKwASCPRYpok"></script>
   </form>
   <%@ include file="../footer.jsp" %>
</body>
</html>
