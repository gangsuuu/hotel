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
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillaStay/hotelMap.do" class="content_list content_selected">층별안내도</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/shillaStay/hotellocation.do" class="content_list ">오시는길</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 소개 ></span>
        	  <span> 층별안내도</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000LM2S_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="content-hotelmap">
	            <img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000LM2Q_KR.gif">
            </div>
            <div class="content-hotelinfo-map">
            	<div class="content-hotelinfo-eightfloors">
	           		<img src="http://localhost:9000/hotel/resources/img/hotelinfo/Information.gif">
	           		<a href="javascript:showModal('floorMap')"><img src="http://localhost:9000/hotel/resources/img/hotelinfo/R0000000BROT_KR.gif"></a>
           		</div>
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
 	<script src="http://localhost:9000/hotel/resources/js/showModal.jsp"></script>
</body>
</html>