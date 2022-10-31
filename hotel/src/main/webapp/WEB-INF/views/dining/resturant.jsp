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
             	<h2 class="suject">다이닝</h2>
                <ul>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillastay/dining/resturant.do" class="content_list ">레스토랑</a></li>
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/shillastay/dining/resturant.do" class="content_list sub_list content_selected">Cafe</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillastay/dining/lounge.do" class="content_list ">라운지 & 바</a></li>
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/shillastay/dining/lounge.do" class="content_list sub_list">Bar</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 다이닝 ></span>
        	  <span> 레스토랑 ></span>
        	  <span> cafe</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZIL_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-dining">
	            <img src="http://localhost:9000/hotel/resources/img/dining/R00000009IAZ_KR.jpg">
            </div>
            <div class="content-dining-content">
            	<div class="content-dining-info">
	            	<div class=content-dining-info-left>
						<img src="http://localhost:9000/hotel/resources/img/dining/R000000166O2_KR.jpg">      
						<img src="http://localhost:9000/hotel/resources/img/dining/R0000000DLVB_KR.jpg">      
						<img src="http://localhost:9000/hotel/resources/img/dining/R0000001M396_KR.jpg">      
	            	</div>
	            	<div class="content-dining-info-right">
	            		<div class="content-dining-resturant">
	            			<div class="content-dining-content-inner">
	            				<div>
	            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZI7_KR.gif">
	            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZI5_KR.gif">
	            				</div>
	            				<div>
	            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZHW_KR.gif">
	            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZHU_KR.gif">
	            				</div>
	            				<div>
	            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZIJ_KR.gif">
	            					<img src="http://localhost:9000/hotel/resources/img/dining/R0000000WTRO_KR.gif">
	            				</div>
	            			</div>
	            		</div>
	            		<div class="content-dining-reservationbtn">
	            			<a href="#">
		            			<img src="http://localhost:9000/hotel/resources/img/dining/btnBooking.gif">
	            			</a>
	            		</div>
	            		<div>
	            			<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZI3_KR.gif">
	            			<div class="content-dining-cafemenu-download">
	            				<a href="http://localhost:9000/hotel/resources/file/dining/광화문_뷔페.pdf" download>
		            				<img src="http://localhost:9000/hotel/resources/img/dining/R0000001G6QT_KR.gif">
	            				</a>
	            				<a href="http://localhost:9000/hotel/resources/file/dining/광화문_라운지바.pdf" download >
		            				<img src="http://localhost:9000/hotel/resources/img/dining/R0000001G6QW_KR.gif">
	            				</a>
	            			</div>
	            		</div>
	            	</div>
           	 	</div>
           </div>
        </div>
 	</div>
 	<%@ include file="../footer.jsp" %>
 	<script>
 	$("[data-nav=restaurant]").css("display","block");
 	$("[data-nav=restaurant]").children().eq(0).children().first().css("color","white");
 	</script>
</body>
</html>