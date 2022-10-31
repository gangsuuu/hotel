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
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/accommodation/deluxe.do" class="content_list sub_list">디럭스</a></li>
                    <li id="content_list_bundle"><a href="http://localhost:9000/hotel/accommodation/deluxeOnDol.do" class="content_list sub_list">디럭스 온돌</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/primierDeluxe.do" class="content_list">프리미어 디럭스</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/grand.do" class="content_list">그랜드</a></li>
                    <li id="content_list_one"><a href="http://localhost:9000/hotel/accommodation/allrooms.do" class="content_allrooms btn">전체 객실 보기</a></li>
                </ul>
            </div>
        </div>
        <div class="content_menu">
        	<div class="content-location">
        	  <img src="http://localhost:9000/hotel/resources/img/inquiry/locaton.gif">
        	  <span>> 객실 ></span>
        	  <span> 전체객실</span>
        	</div>
        	<div>
        	  <img src="http://localhost:9000/hotel/resources/img/accommodation/R0000000BQ5N_KR.gif">
        	</div>
        	<div class="content-block"></div>
        	<div class="all-rooms">
	            <img src="http://localhost:9000/hotel/resources/img/accommodation/R0000001DKLI_KR.jpg">
            </div>
        </div>
 	</div>
 	<%@ include file="../footer.jsp" %>
 	<script>
 	$("[data-nav=rooms]").css("display","block");
 	$("[data-nav=rooms]").children().eq(4).children().first().css("color","white");
 	</script>
</body>
</html>