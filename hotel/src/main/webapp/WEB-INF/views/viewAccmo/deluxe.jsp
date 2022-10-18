<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script>
	var hotelname = "stayhub";
</script>
</head>
<body>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header_find_hotel.js"></script>
	<div class="content">
       <div class="content_lists">
            <div class="content_inmenu">
             	<h2 class="suject">객실</h2>
                <ul>
                    <li><a href="http://localhost:9000/hotel/accommodation/standard.do" class="content_list">스탠다드</a></li>
                    <li class=" content_selected"><a href="http://localhost:9000/hotel/accommodation/deluxe.do" class="content_list">디럭스</a></li>
                    <li><a href="http://localhost:9000/hotel/accommodation/deluxe.do" class="content_list content_selected">디럭스</a></li>
                    <li><a href="http://localhost:9000/hotel/accommodation/deluxeOnDol.do" class="content_list">디럭스 온돌</a></li>
                    <li><a href="http://localhost:9000/hotel/accommodation/primierDeluxe.do" class="content_list">프리미어 디럭스</a></li>
                    <li><a href="http://localhost:9000/hotel/accommodation/grand.do" class="content_list">그랜드</a></li>
                    <li><a href="http://localhost:9000/hotel/accommodation/allrooms.do" class="content_allrooms btn">전체 객실 보기</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/locaton.gif">
        	  <span>> 객실 ></span>
        	  <span> 전체객실</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/accommodation/R0000000LML5_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-rooms">
	            <img src="http://localhost:9000/hotel/resources/img/accommodation/R0000001EC8Y_KR.jpg">
            </div>
            <div class="content-rooms-info">
            	<div class="content-rooms-info-left">
            		 <div>
            		   <img src="http://localhost:9000/hotel/resources/img/accommodation/R0000001DKN4_KR.jpg">
            		 </div>
            		 <div class="content-room-amenity">
            		   <a href="#">
            		     <img src="http://localhost:9000/hotel/resources/img/accommodation/btnAmenityview.gif">
            		   </a>
            		 </div>
            		 <div class="content-room-info-block"></div>
            		 <div class="content-rooms-info-inroom">
            		 	<div class="content-rooms-info-inroom-img">
            		 	  <img src="http://localhost:9000/hotel/resources/img/accommodation/inRoom.gif">
            		 	</div>
            		 	<div class="content-rooms-info-ul">
            		 		<ul>
            		 			<li>40" LED TV (36개 채널)</li>
            		 			<li>책상</li>
            		 			<li>냉장고</li>
            		 			<li>무료커피/티백</li>
            		 			<li>무료 생수 2병 (1박 기준)</li>
            		 			<li>무료 유무선 인터넷</li>
            		 			<li>유닙셜 어댑터(220V 전용)</li>
            		 			<li>개인금고</li>
            		 			<li>다회용 어메니티</li>
            		 		</ul>
            		 	</div>
            		 </div>
            		 <div class="content-room-info-block"></div>   
            		 <div class="content-rooms-info-inhotel">
						<div class="content-rooms-info-inroom-img">
            		 	  <img src="http://localhost:9000/hotel/resources/img/accommodation/inHotel.gif">
            		 	</div>
            		 	<div class="content-rooms-info-ul">
            		 		<ul>
            		 			<li>피트니스 센터 무료 이용(안전상의 이유로 16세 이상 입장 가능합니다.)</li>
            		 			<li>비즈니스 코너 인터넷 무료</li>
            		 		</ul>
            		 	</div>
            		 </div>
            		 <div class="content-room-info-block"></div>  
            	</div>
            	<div class="content-rooms-info-right">
            		<div class="content-rooms-info-btns">
            			<a href="#">
            				<img src="http://localhost:9000/hotel/resources/img/accommodation/btnFloorPlanView.gif">
            			</a>
            			<a href="#">
            				<img src="http://localhost:9000/hotel/resources/img/accommodation/btnInquiry.gif">
            			</a>
            			<a href="#">
            				<img src="http://localhost:9000/hotel/resources/img/accommodation/btnBooking.gif">
            			</a>
            		</div>
            		<div class="content-rooms-info-hotelinfo">
            			<div class="content-rooms-info-content">
            				<img src="http://localhost:9000/hotel/resources/img/accommodation/dlHtInfoTit.gif">
            				<div>
    							<div class="content-info-container">
    								<p class="content-info-title">체크인/체크아웃 시간</p>
    								<div  class="content-info-content">
	    								<p>-체크인 : 오후3시 이후</p>
	    								<p>-체크아웃 : 정오</p>
    								</div>
    							</div>        					
    							<div class="content-info-container">
    								<p class="content-info-title">주차 안내</p>
    								<div  class="content-info-content">
    								<p>- 객실 이용시 1박당 5,000원</p>
    								<p>· 객실당 1대, 추가 차량 이용 불가</p>
    								<p>· 호텔 주차장 만차 시, 인근 외부 주차장 이용</p>
    								</div>
    							</div>        					
    							<div class="content-info-container">
    								<p class="content-info-title">Cafe 이용안내</p>
    								<div class="content-info-content">
    								<p>- [조식]</p>
    								<p class="content-info-content-dept">(주중)  06:30~09:30</p>
    								<p class="content-info-content-dept">(주말,공휴일)  07:00~10:00</p>
    								<p>-[중식]</p>
    								<p class="content-info-content-dept">(주중) 11:30 ~ 14:00</p>
    								<p class="content-info-content-dept">(주말,공휴일) 12:00~14:00</p>
    								<p>-[라운지_Bar]</p>
    								<p class="content-info-content-dept">(주중, 주말, 공휴일) 18:00~23:00</p>
    								</div>
    							</div>        					
    							<div class="content-info-container">
    								<p class="content-info-title">피트니스 센터 이용 안내</p>
    								<div  class="content-info-content">
    								<p>- 06:00 ~ 23:00</p>
    								</div>
    							</div>        					
    							<div class="content-info-container">
    								<p class="content-info-title">예약 변경 및 취소 </p>
    								<div  class="content-info-content"> 
    								<p>- 숙박예정일 1일전 18시까지는 위약금 없이 취소 가능</p>
    								<p>- 위 기간 이후 취소 또는 변경시(No Show포함)</p>
    								<p>· 성수기(4,5,6,10,11월, 12/24, /12/31) : 최대 1박 요금의 80%부과</p>
    								<p>· 비수기(성수기 외 기간) : 최초 1박 요금의 10% 부과</p>
    								</div>
    							</div>        					
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
        </div>
 	</div>
</body>
</html>