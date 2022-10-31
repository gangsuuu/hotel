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
<script src="http://localhost:9000/hotel/resources/js/showModal.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="content">
	<div class="modal-background"></div>
       <div class="content_lists">
            <div class="content_inmenu">
             	<h2 class="suject">부대시설</h2>
                <ul>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillastay/facilities/meetingRoom.do" class="content_list ">미팅룸</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillastay/facilities/businessRoom.do" class="content_list content_selected">비즈니스 코너</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillastay/facilities/fitnessRoom.do" class="content_list ">피트니스 센터</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 부대시설 ></span>
        	  <span> 비즈니스 코너</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/facilites/R0000000LM1E_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-facilites">
	            <img src="http://localhost:9000/hotel/resources/img/facilites/R00000009IOT_KR.jpg">
            </div>
            <div class="content-facilites-content">
	           <img src="http://localhost:9000/hotel/resources/img/facilites/R000000093QV_KR.gif">
           </div>
           <div>
           		<a href="javascript:showModal('floorMap')"><img src="http://localhost:9000/hotel/resources/img/facilites/FloorMap.gif"></a>
           </div>
        </div>
 	</div>
 	<div class="modal-background"></div>
 	<div class="content-modal" id="floorMapmodal">
		<div class="modal-header">
			<div>
				<img src="http://localhost:9000/hotel/resources/img/facilites/R000000093SB_KR.gif">
			</div>
			<div class="modal-close btn">
				<img src="http://localhost:9000/hotel/resources/img/accommodation/popLayerBtnClose.gif">
			</div>
		</div>
		<div class="modal-content-one-container">
			<img class="modal-content-one"  src="http://localhost:9000/hotel/resources/img/facilites/R000000093S7_KR.gif">
   		</div>
 	</div>
 	
 	<%@ include file="../footer.jsp" %>
 	<script>
 	$("[data-nav=facilites]").css("display","block");
 	$("[data-nav=facilites]").children().eq(1).children().first().css("color","white");
 	</script>
 	<script src="http://localhost:9000/hotel/resources/js/showModal.jsp"></script>
</body>
</html>