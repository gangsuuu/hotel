<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>Insert title here</title>
<script>
	var hotelname = "stayhub";
</script>
<script>
	function insert_hotel(){
		let id = "createhotel_"
		if($("#"+id+"name").val() == ""){
			alert("호텔이름 입력해 주세요");
		}else if($("#"+id+"call").val() == 0){
			alert("호텔전화번호  입력해 주세요");
		}else if($("#"+id+"hoteladdress").val() == ""){
			alert("호텔주소를 입력해 주세요");
		}else if($("input[name=hotellocation]:checked").length == 0){
			alert("호텔권역을 선택해 주세요");
		}else if($("#"+id+"checkin_hour").val() == "" || $("#"+id+"checkin_minute").val() == ""){
			alert("체크인시간을  입력해 주세요");
		}else if($("#"+id+"checkout_hour").val() == "" || $("#"+id+"checkout_minute").val() == ""){
			alert("체크아웃시간을  입력해 주세요");
		}else{
			let checkin = $("#"+id+"checkout_hour").val() + " : " + $("#"+id+"checkout_minute").val()
			let checkout = $("#"+id+"checkin_hour").val() + " : " + $("#"+id+"checkin_minute").val()
			$("input[name='checkout']").val(checkout)
			$("input[name='checkin']").val(checkin)
			insert_hotel_form.submit();
		}
		//$("input[name='checkout']")$("#"+id+"checkout_hour").val()+":"+$("#"+id+"checkout_minute").val()
		//$("input[name='checkin']")$("#"+id+"checkin_hour").val()+":"+$("#"+id+"checkin_minute").val()	
		//$("#"+id+"name").val()
	}
</script>
</head>
<body>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header_find_hotel.js"></script>
 	<div class="content">
        <div class="content_lists">
            <div class="content_inmenu">   
                <h2 class="suject">Admin</h2>
                <ul>
                   <li><a href="http://localhost:9000/hotel/admin_inquiry_list.do" class="content_list">문의사항 관리</a></li>
                   <li><a href="http://localhost:9000/hotel/admin_notice_list.do" class="content_list">공지사항 관리</a></li>
                   <li><a href="http://localhost:9000/hotel/admin_hotel_categori.do" class="content_list">카데고리 수정</a></li>
                   <li class=" content_selected"><a href="http://localhost:9000/hotel/createhotel.do" class="content_list content_selected">호텔 생성</a></li>
                   <!-- 백그라운드 컬러,  after 보더 컬러-->
                   <li><a href="http://localhost:9000/hotel/edit_index.do" class="content_list">인덱스페이지</a></li>
                </ul>
            </div>
       	</div>
	    <div class="content_menu" style="border:1px solid black">
	    	<form name="insert_hotel_form" action="insert_hotel.do" method="POST">
	    		<ul>
	    			<li>
						<label>호텔이름</label>
						<input id="createhotel_name" name="hotelname">	    			
	    			</li>
	    			<li>
	    				<label>호텔전화번호 </label>
	    				<input id="createhotel_call" name="servicecentercall"> 
	    			</li>
	    			<li>
	    				<label>체크인</label>
	    				<select id="createhotel_checkin_hour">
	    					<option value="">시간</option>
	    					<option value="00">00</option>
	    					<option value="01">01</option>
	    					<option value="02">02</option>
	    					<option value="03">03</option>
	    					<option value="04">04</option>
	    					<option value="05">05</option>
	    					<option value="06">06</option>
	    					<option value="07">07</option>
	    					<option value="08">08</option>
	    					<option value="09">09</option>
	    					<option value="10">10</option>
	    					<option value="11">11</option>
	    					<option value="12">12</option>
	    					<option value="13">13</option>
	    					<option value="14">14</option>
	    					<option value="15">15</option>
	    					<option value="16">16</option>
	    					<option value="17">17</option>
	    					<option value="17">18</option>
	    					<option value="18">19</option>
	    					<option value="19">20</option>
	    					<option value="20">21</option>
	    					<option value="21">22</option>
	    					<option value="22">23</option>
	    				</select>
	    				<label>:</label>
	    				<select id="createhotel_checkin_minute">
	    					<option value="">분</option>
	    					<option value="00">00</option>
	    					<option value="05">05</option>
	    					<option value="10">10</option>
	    					<option value="15">15</option>
	    					<option value="20">20</option>
	    					<option value="25">25</option>
	    					<option value="30">30</option>
	    					<option value="35">35</option>
	    					<option value="40">40</option>
	    					<option value="45">45</option>
	    					<option value="50">50</option>
	    					<option value="55">55</option>
	    				</select>
	    				<input type="hidden" name="checkin">
	    			</li>
	    			<li>
	    				<label>체크아웃</label>
	    				<select id="createhotel_checkout_hour">
	    					<option value="">시간</option>
	    					<option value="00">00</option>
	    					<option value="01">01</option>
	    					<option value="02">02</option>
	    					<option value="03">03</option>
	    					<option value="04">04</option>
	    					<option value="05">05</option>
	    					<option value="06">06</option>
	    					<option value="07">07</option>
	    					<option value="08">08</option>
	    					<option value="09">09</option>
	    					<option value="10">10</option>
	    					<option value="11">11</option>
	    					<option value="12">12</option>
	    					<option value="13">13</option>
	    					<option value="14">14</option>
	    					<option value="15">15</option>
	    					<option value="16">16</option>
	    					<option value="17">17</option>
	    					<option value="17">18</option>
	    					<option value="18">19</option>
	    					<option value="19">20</option>
	    					<option value="20">21</option>
	    					<option value="21">22</option>
	    					<option value="22">23</option>
	    				</select>
	    				<label>:</label>
	    				<select id="createhotel_checkout_minute">
	    					<option value="">분</option>
	    					<option value="00">00</option>
	    					<option value="05">05</option>
	    					<option value="10">10</option>
	    					<option value="15">15</option>
	    					<option value="20">20</option>
	    					<option value="25">25</option>
	    					<option value="30">30</option>
	    					<option value="35">35</option>
	    					<option value="40">40</option>
	    					<option value="45">45</option>
	    					<option value="50">50</option>
	    					<option value="55">55</option>
	    				</select>
	    				<input type="hidden" name="checkout">
	    			</li>
	    			<li>
	    				<label>호텔주소</label>
	    				<input id="createhotel_hoteladdress"name="hoteladdress">
	    			</li>
	    			<li>
	    				<label>호텔지역</label>
	    				<div>
		    				<label>서울 강북</label>
		    				<input type="radio" name="hotellocation" value="서울강북">
		    				<label>서울 강남</label>
		    				<input type="radio" name="hotellocation" value="서울강남">
		    				<label>전국</label>
		    				<input type="radio" name="hotellocation" value="전국">
	    				</div>
	    			</li>
	    			<li>
	    				<label>호텔 브랜드</label>
	    				<div id="createhotel_brand" class="createhotel_brandlogo">
		    				<div>
		    					<p>신라스테이</p>
			    				<input type="radio" name="hotelcsstype" value="type1" checked>
			    			</div>
	    					<div>
	    						<p>더 신라호텔</p>
	    						<input type="radio" name="hotelcsstype" value="type2">
	    					</div>
	    				</div>
	    			</li>
	    		</ul>
	    		<button class="createhotel_btn" type="button" onclick="insert_hotel()">호텔등록 완료</button>
	    	</form>
	    </div> 
	</div>
</body>
</html>