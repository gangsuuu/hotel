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
             	<h2 class="suject">소개</h2>
                <ul>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillaStay/hotelinfo.do" class="content_list ">호텔정보</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillaStay/hotelMap.do" class="content_list ">층별안내도</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillaStay/hotellocation.do" class="content_list content_selected">오시는길</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 소개 ></span>
        	  <span> 오시는길</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000LM5Y_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-hotellocation">
	            <img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000001E6X8_KR.jpg">
            </div>
            <div class="content-hotellocation-second">
           		<img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000BR9U_KR.gif">
           </div>
           <div class="content-hotellocation-bus">
           		<img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000BRA1_KR.gif">	
           </div>
           <div class="content-hotellocation-toairport">
           		<div class="content-hotellocation-menubar inchen-btn btn">
           			<img class="content-hotellocation-menuimg" src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000BRAD_KR.gif">
           			<div class="content-hotellocation-direction inchen-direction"></div>	
           		</div>
           		<div class="content-hotellocation-content inchen-content">
	           		<img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000KKQQ_KR.gif">	
           		</div>
           </div>
           <div class="content-hotellocation-toairport">
           		<div class="content-hotellocation-menubar gimpo-btn btn">
           			<img class="content-hotellocation-menuimg" src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000BRAF_KR.gif">
           			<div class="content-hotellocation-direction gimpo-direction"></div>	
           		</div>
           		<div class="content-hotellocation-content gimpo-content">
	           		<img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000OQWL_KR.gif">	
           		</div>
           </div>
        </div>
 	</div>
 	<%@ include file="../footer.jsp" %>
 	<script>
		$(".inchen-btn").click(function(){
			$(".inchen-content").toggle();
			$(".inchen-direction").toggleClass("revers-btn");
		})	
		$(".gimpo-btn").click(function(){
			$(".gimpo-content").toggle();
			$(".gimpo-direction").toggleClass("revers-btn");
		})	
 	</script>
</body>
</html>