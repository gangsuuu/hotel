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
	<div class="modal-background"></div>
       <div class="content_lists">
           <div class="content_inmenu">
	           <h2 class="suject">고객서비스</h2>
	           <ul>
	               <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/introhotel.do" class="content_list content_selected">호텔안내</a></li>
		           <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/viewGuestService.do" class="content_list">인근명소</a></li>
		           <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list ">공지사항</a></li>
		           <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_list.do" class="content_list">고객센터</a></li>
		           <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_my_list.do?mid=${sessionScope.svo.mid }" class="content_list_two"> - 내문의함</a></li>
               </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 고객서비스 ></span>
        	  <span> 호텔안내</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/service/R0000000LM1Y_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-services">
	            <img src="http://localhost:9000/hotel/resources/img/service/R000000093TD_KR.jpg">
            </div>
            <div class="content-services-second">
           		<img src="http://localhost:9000/hotel/resources/img/service/R0000001E3XL_KR.jpg">
           </div>
            <div class="content-rooms-info">
            	<div class="content-service-info-left">
					<img src="http://localhost:9000/hotel/resources/img/service/R0000001M40K_KR.jpg">      
					<img src="http://localhost:9000/hotel/resources/img/service/R000000093TL_KR.gif">      		  
            	</div>
            	<div class="content-service-info-right">
            		<div class="content-service-info-hotelinfo">
            			<div class="content-service-info-content">
            				<img src="http://localhost:9000/hotel/resources/img/service/Ingo_Hotal.gif">
            				<div>
    							<div class="content-info-container-service">
    								<p class="content-info-title">체크인/체크아웃 시간</p>
    								<div  class="content-info-content">
	    								<p>-체크인 : 오후3시 이후, 체크아웃 : 낮 12시</p>
    								</div>
    							</div>        					
    							<div class="content-info-container-service">
    								<p class="content-info-title">주차 안내</p>
    								<div  class="content-info-content">
    								<p>- 1박당 10,000원 (체크아웃 당일 오후 1시까지)</p>
    								<p>· 객실당 1대, 추가 차량 이용 불가</p>
    								<p>· 호텔 주차장 만차 시 외부 지정 유료 주차장 이용</p>
    								<p>· 호텔 내/외부 주차장 이용 시 중간 출차 불가 (중간 출차 시 매회 5,000원 추가 부가)</p>
    								</div>
    							</div>        					
    							<div class="content-info-container-service">
    								<p class="content-info-title">취소</p>
    								<div  class="content-info-content">
    								<p>- 숙박예정일 1일전 18시까지는 위약금 없이</p>
    								<p> 취소가능</p>
    								<p>- 위 기간 이후 취소 또는 변경 시(No Show포함)</p>
    								<p>· 성수기(4,5,6,10,11월, 12/24, /12/31) :</p>
    								<p>최대 1박 요금의 80%부과</p>
    								<p>· 비수기(성수기 외 기간) :</p>
    								<p> 최초 1박 요금의 10% 부과</p>
    								</div>
    							</div>        					
    							<div class="content-info-container-service">
    								<p class="content-info-title">동물</p>
    								<div  class="content-info-content">
    								<p>- 안내견을 제외한 애완견 등 동물 입장은 불가능합니다.</p>
    								</div>
    							</div>        					
    							<div class="content-info-container-service">
    								<p class="content-info-title">미성년자</p>
    								<div  class="content-info-content"> 
    								<p>- 부모를 동반하지 않은 만 19세 미만 미성년자는 투숙 할 수 없습니다. (청소년 보호법 30조/58조)</p>
    								</div>
    							</div>        					
            				</div>
            			</div>
            		</div>
            	</div>
            </div>
        </div>
 	</div>
 	<%@ include file="../footer.jsp" %>
 	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(0).children().first().css("color","white");
 	</script>
</body>
</html>