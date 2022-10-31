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
	               <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/introhotel.do" class="content_list ">호텔안내</a></li>
		           <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/viewGuestService.do" class="content_list content_selected">인근명소</a></li>
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
        	  <span> 인근명소</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/service/R0000000LM2N_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-services">
	            <img src="http://localhost:9000/hotel/resources/img/service/R0000000YXJ0_KR.jpg">
            </div>
            <div class="content-services-second">
           		<img src="http://localhost:9000/hotel/resources/img/service/R000000093V6_KR.gif">
           		<img src="http://localhost:9000/hotel/resources/img/service/R000000093UV_KR.gif">
           		<img src="http://localhost:9000/hotel/resources/img/service/R000000093UY_KR.gif">
           		<img src="http://localhost:9000/hotel/resources/img/service/R000000093V1_KR.gif">
           </div>
        </div>
 	</div>
 	<%@ include file="../footer.jsp" %>
 	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(1).children().first().css("color","white");
 	</script>
</body>
</html>