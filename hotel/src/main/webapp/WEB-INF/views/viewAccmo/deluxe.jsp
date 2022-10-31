<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신라스테이</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="content">
       <div class="content_lists">
            <div class="content_inmenu">
             	<h2 class="suject">객실</h2>
                <ul>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/standard.do" class="content_list">스탠다드</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/deluxe.do" class="content_list">디럭스</a></li>
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/accommodation/deluxe.do" class="content_list sub_list content_selected">디럭스</a></li>
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/accommodation/deluxeOnDol.do" class="content_list sub_list">디럭스 온돌</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/primierDeluxe.do" class="content_list ">프리미어 디럭스</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/grand.do" class="content_list">그랜드</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/allrooms.do" class="content_allrooms btn">전체 객실 보기</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 객실 ></span>
        	  <span> 디럭스</span>
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
            		   <a href="javascript:showModal('amenity')">
            		     <img src="http://localhost:9000/hotel/resources/img/accommodation/btnAmenityview.gif">
            		   </a>
            		   <div id="amenity-modal" class="content-modal">
            		   		<div class="modal-header">
            		   			<div>
            		   				<img src="http://localhost:9000/hotel/resources/img/accommodation/accAmenityPopTitle.gif">
            		   			</div>
            		   			<div class="amnity-close btn">
            		   				<img src="http://localhost:9000/hotel/resources/img/accommodation/popLayerBtnClose.gif">
            		   			</div>
            		   		</div>
            		   		<div class="modal-content-container">
	            		   		<div class="modal-content">
	            		   			<div class="modal-content-list">
	            		   				<img src="http://localhost:9000/hotel/resources/img/accommodation/accBathroomTit.gif">
	            		   				<div class="modal-content-list-in">
	            		   					<div>다회용 어메니티</div>
	            		   					<div>덴탈 키트</div>
	            		   					<div>머리빗</div>
	            		   					<div>코튼세트(면봉, 화장솜)</div>
	            		   					<div>헤어드라이기</div>
	            		   					<div>배스로브</div>
	            		   					<div>배스타월</div>
	            		   					<div>핸드타월</div>
	            		   					<div>워시타월</div>
	            		   					<div>배스매트</div>
	            		   					<div>비상벨</div>
	            		   				</div>
	            		   			</div>
	            		   			<div class="modal-content-list modal-content-center">
	            		   				<img src="http://localhost:9000/hotel/resources/img/accommodation/accBedroomTit.gif">
	            		   				<div class="modal-content-list-in">
	            		   					<div>침대</div>
	            		   					<div>거위털 이불</div>
	            		   					<div>오리털 베개</div>
	            		   					<div>전화기</div>
	            		   					<div>개별 냉난방 조절기</div>
	            		   					<div>유니버셜 어탭터</div>
	            		   				</div>
	            		   			</div>
	            		   			<div class="modal-content-list modal-content-last">
	            		   				<img src="http://localhost:9000/hotel/resources/img/accommodation/accClosetTit.gif">
	            		   				<div class="modal-content-list-in">
		            		   				<div>개인금고</div>
		            		   				<div>다리미 세트</div>
		            		   				<div>구둣주걱</div>
		            		   				<div>슈 클리너</div>
		            		   				<div>비상 손전등</div>
	            		   				</div>
	            		   			</div>
	            		   		</div>
            		   		</div>
            		   </div>
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
            			<a href="javascript:showModal('drawing')">
            				<img src="http://localhost:9000/hotel/resources/img/accommodation/btnFloorPlanView.gif">
            			</a>
            			<a href="http://localhost:9000/hotel/inquiry_list.do">
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
 	 <div id="amenitymodal" class="content-modal">
   		<div class="modal-header">
   			<div>
   				<img src="http://localhost:9000/hotel/resources/img/accommodation/accAmenityPopTitle.gif">
   			</div>
   			<div class="modal-close btn">
   				<img src="http://localhost:9000/hotel/resources/img/accommodation/popLayerBtnClose.gif">
   			</div>
	   	</div>
	   	<div class="modal-content-container">
		  	<div class="modal-content">
		   		<div class="modal-content-list">
		   			<img src="http://localhost:9000/hotel/resources/img/accommodation/accBathroomTit.gif">
		   			<div class="modal-content-list-in">
		   				<div>다회용 어메니티</div>
		   				<div>덴탈 키트</div>
		   				<div>머리빗</div>
		   				<div>코튼세트(면봉, 화장솜)</div>
		   				<div>헤어드라이기</div>
		   				<div>배스로브</div>
		   				<div>배스타월</div>
		   				<div>핸드타월</div>
		   				<div>워시타월</div>
		   				<div>배스매트</div>
		   				<div>비상벨</div>
		   			</div>
		   		</div>
		   		<div class="modal-content-list modal-content-center">
		   			<img src="http://localhost:9000/hotel/resources/img/accommodation/accBedroomTit.gif">
		   			<div class="modal-content-list-in">
		   				<div>침대</div>
		   				<div>거위털 이불</div>
		   				<div>오리털 베개</div>
		   				<div>전화기</div>
		   				<div>개별 냉난방 조절기</div>
		   				<div>유니버셜 어탭터</div>
		   			</div>
		   		</div>
		   		<div class="modal-content-list modal-content-last">
		   			<img src="http://localhost:9000/hotel/resources/img/accommodation/accClosetTit.gif">
		   			<div class="modal-content-list-in">
			   			<div>개인금고</div>
			   			<div>다리미 세트</div>
						<div>구둣주걱</div>
			   			<div>슈 클리너</div>
			   			<div>비상 손전등</div>
		   			</div>
	  			</div>
	  		</div>
		</div>
	</div>
	<div class="content-modal" id="drawingmodal">
		<div class="modal-header">
			<div>
				<img src="http://localhost:9000/hotel/resources/img/accommodation/bzDelxpopTitle.gif">
			</div>
			<div class="modal-close btn">
				<img src="http://localhost:9000/hotel/resources/img/accommodation/popLayerBtnClose.gif">
			</div>
		</div>
		<div class="modal-drawaings-container">
			<ul class="modal-content-room-list">
				<li class="modal-content-room-inner">
					<a class="modal-content-roomchange-btn selected-drawing-btn" href="javascript:changeDrawing('twin')" data-room='twin'>Twin</a>
					<div class="modal-drawing-container selected-drawing" data-room="twin">
						<img class="modal-room-drawing-img"src="http://localhost:9000/hotel/resources/img/accommodation/R00000008Z06_KR.gif">
					</div>	
				</li>
			</ul>
			<ul class="modal-content-room-list">
				<li class="modal-content-room-inner">
					<a class="modal-content-roomchange-btn roomchangebtn-second" href="javascript:changeDrawing('double')" data-room='double'>Double</a>
					<div class="modal-drawing-container" data-room="double">
						<img class="modal-room-drawing-img"src="http://localhost:9000/hotel/resources/img/accommodation/R00000008Z04_KR.gif">
					</div>	
				</li>
			</ul>
   		</div>
 	</div>
 	<div class="modal-background"></div>
 	<%@ include file="../footer.jsp" %>
 	<script>
 	$("[data-nav=rooms]").css("display","block");
 	$("[data-nav=rooms]").children().eq(1).children().first().css("color","white");
 	</script>
 	<script src="http://localhost:9000/hotel/resources/js/showModal.jsp"></script>
</body>
</html>