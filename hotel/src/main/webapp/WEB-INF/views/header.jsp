<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<title>Insert title here</title>
</head>
<body>
	<header class='theme2'>
		<div class='header'>
			<div class='header_top_left theme2'>
			</div>
			<div class='header_top_mid'>
				<a href='http://localhost:9000/hotel/shillaStay.do' class='header_top_mid_logo logo_hub'>
					<img src="http://localhost:9000/hotel/resources/img/logo-ghm.png">
				</a>
			</div>
			<div class='header_top_right'>
				<div>
					<img src="http://localhost:9000/hotel/resources/img/public/header-call.png">
				</div>
				<div class='header_top_guest theme2_guest'>
					<a class='header_login' href='http://localhost:9000/hotel/login.do'>로그인</a>
					<a href='#'>예약확인</a>
				</div>
			</div>
		</div>
			<div class='header_categori_container theme2_categori'>
				<ul class='header_maincategori_lists theme2_main'>
					<div>
						<li class='header_maincategori theme2_after'>
							<a href='#'>스페셜 오퍼</a>
							<ul class='header_subcategori_list theme2_sub_container' data-nav="Special">
								<li><a class='theme2_sub' id='header_subcategori' href='#'>객실 패키지</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='#'>이벤트</a></li>
							</ul>
						</li>
						<li class='header_maincategori theme2_after' >
							<a href='http://localhost:9000/hotel/accommodation/standard.do'>객실</a>
							<ul class='header_subcategori_list theme2_sub_container' data-nav="rooms">
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/accommodation/standard.do'>스탠다드</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/accommodation/deluxe.do'>디럭스</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/accommodation/primierDeluxe.do'>프리미어 디럭스</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/accommodation/grand.do'>그랜드</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/accommodation/allrooms.do'>전체 객실 보기</a></li>
							</ul>
						</li>
						<li class='header_maincategori theme2_after'>
							<a href='#'>다이닝</a>
							<ul class='header_subcategori_list theme2_sub_container' data-nav="restaurant">
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/shillastay/dining/resturant.do'>레스토랑</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/shillastay/dining/lounge.do'>라운지 & 바</a></li>
							</ul>
						</li>
						<li class='header_maincategori theme2_after'>
							<a href='#'>부대시설</a>
							<ul class='header_subcategori_list theme2_sub_container' data-nav="facilites">
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/shillastay/facilities/meetingRoom.do'>미팅룸</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/shillastay/facilities/businessRoom.do'>비지니스 코너</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/shillastay/facilities/fitnessRoom.do'>피트니스 센터</a></li>
							</ul>
						</li>
						<li class='header_maincategori theme2_after'>
							<a href='#'>고객서비스</a>
							<ul class='header_subcategori_list theme2_sub_container' data-nav="service">
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/guestservice/introhotel.do'>호텔안내</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/guestservice/viewGuestService.do'>인근명소</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/inquiry_list.do'>고객센터</a></li>
								<li><a class='theme2_sub' id='header_subcategori' href='http://localhost:9000/hotel/notice_list.do'>공지사항</a></li>
							</ul>
						</li>
					</div>
					<div>
						<li class='header_maincategori_seach'>
							<a class='theme2_main_seach' href='#'>위치찾기</a>
						</li>
						<li class='header_maincategori_res'>
							<a class='theme2_main_res' href='http://localhost:9000/hotel/list.do'>예약</a>
						</li>
					</div>
				</ul>
			</div>
	</header>
</body>
</html>