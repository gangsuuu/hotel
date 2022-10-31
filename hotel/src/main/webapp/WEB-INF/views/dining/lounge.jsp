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
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/shillastay/dining/resturant.do" class="content_list sub_list ">Cafe</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillastay/dining/lounge.do" class="content_list ">라운지 & 바</a></li>
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/shillastay/dining/lounge.do" class="content_list sub_list content_selected">Bar</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 다이닝 ></span>
        	  <span> 라운지&바 ></span>
        	  <span> Bar</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZN2_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-dining">
	            <img src="http://localhost:9000/hotel/resources/img/dining/R0000000WTXQ_KR.jpg">
            </div>
            <div class="content-dining-content">
            	<div class="content-dining-info">
            	<div class=content-dining-info-left>
					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZMF_KR.gif">      
					<img src="http://localhost:9000/hotel/resources/img/dining/R0000000WTWY_KR.jpg">      
            	</div>
            	<div class="content-dining-info-right">
            		<div class="content-dining-lounge">
            			<div class="content-dining-content-inner">
            				<div>
            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZMN_KR.gif">
            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZML_KR.gif">
            				</div>
            				<div>
            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZN0_KR.gif">
            					<img src="http://localhost:9000/hotel/resources/img/dining/R0000001MAVS_KR.gif">
            				</div>
            				<div>
            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZMC_KR.gif">
            					<img src="http://localhost:9000/hotel/resources/img/dining/R0000001MAV1_KR.gif">
            				</div>
            				<div>
            					<img src="http://localhost:9000/hotel/resources/img/dining/R00000008ZMW_KR.gif">
            					<img src="http://localhost:9000/hotel/resources/img/dining/R0000000WTYN_KR.gif">
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
 	$("[data-nav=restaurant]").css("display","block");
 	$("[data-nav=restaurant]").children().eq(1).children().first().css("color","white");
 	</script>
</body>
</html>