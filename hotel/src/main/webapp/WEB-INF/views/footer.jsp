<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
</head>
<body>
	<footer>
		<div class='foot hub_foot footdongtan'>
			<div class='localBox'>
				<div class='localBoxer'>
					<div class='compInfo btn'>
						<img src="http://localhost:9000/hotel/resources/img/public/localBoxCompInfo_ghm.gif">
						<a class='footer_logo' href='shillastayindex.do'>
							<img src="http://localhost:9000/hotel/resources/img/logo-ghm.png">
						</a>
						<div class='foot_hotelinfo'>
							<p>신라스테이 광화문</p>
							<p>서울특별시 종로구 삼봉로 71</p>
							<span>(지번주소:서울특별시 종로구 수송동 51-8)</span>
							<p>TEL. 02-6060-9000</p>
						</div>
					</div>
					<div class='linkInfo'>
						<div class='Infolst'>
							<ul>
								<li>소개</li>
								<li><a href='http://localhost:9000/hotel/shillaStay/hotelinfo.do'>호텔정보</a></li>
								<li><a href='http://localhost:9000/hotel/shillaStay/hotelMap.do'>층별안내도</a></li>
								<li><a href='http://localhost:9000/hotel/shillaStay/hotellocation.do'>오시는 길</a></li>
								<li><a href='http://localhost:9000/hotel/shillaStay/gallery.do'>갤러리</a></li>
							</ul>
							<ul>
								<li>고객문의</li>
								<li><a href='#'>연락처</a></li>
								<li><a href='#'>FAQ</a></li>
								<li><a href='http://localhost:9000/hotel/inquiry_list.do'>문의하기</a></li>
							</ul>
						</div>
					</div>
					<div class='snsNews'>
						<dl class='sns'>
							<dt class='dt'>SNS</dt>
							<dd class='facebook'><a title='Facebook - popup' target='_blank' href='#'><span>Facebook</span></a></dd>
							<dd class='instagram'><a title='Instagram - popup' target='_blank' href='#'><span>instagram</span></a></dd>
							<dd class='blog'><a title='Blog - popup' target='_blank' href='#'><span>Blog</span></a></dd>
						</dl>
					</div>
				</div>
			</div>
			<div class='footer'>
				<div class='footer_topbox'>
					<div class='linkBox'>
						<ul>
							<li><a href='#'>신라스테이소개</a></li>
							<li><a href='#'>사이트맵</a></li>
							<li><a href='#'>개인정보취급방침</a></li>
							<li><a href='#'>이메일무단수집금지</a></li>
							<li><a href='#'>윤리경영(부정제보)</a></li>
						</ul>
					</div>
				</div>
				<div class='adressBox'>
					<p>신라스테이 주식회사    서울특별시 중구 다산로 210  (우 : 04586) 대표이사 박상오 </p>
					<p>사업자등록번호 201-86-40254 통신판매신고번호 중구0882호 TEL. 02-2230-3000   FAX. 02-2230-3800</p>
					<p>COPYRIGHT © HOTEL SHILLA CO., LTD. ALL RIGHTS RESERVED.</p>
				</div>
			</div>
		</div>
	</footer>
	<script>
		$(".compInfo").click(function(){
			$(location).attr('href','http://localhost:9000/hotel/shillaStay.do')
		})
	</script>
</body>
</html>