$.ajax({
	url:"footer_gethotellist.do?hotelname="+hotelname,
	success:function(result){
		let dataset = JSON.parse(result)
		let footer = ""; 
		let logosrc = dataset.logoSrc
		if(hotelnmae = 'type1'){
		footer += "<footer>";
		footer += "<div class='foot hub_foot footdongtan'>";
		//footer상단부 
		footer += "<div class='localBox'>";
		footer += "<div class='localBoxer'>";
		footer += "<div class='compInfo'>";
		footer += "<a class='footer_logo' href='shillastayindex.do'></a>";
		footer += "<div class='foot_hotelinfo'>";
		footer += "<p>"+dataset.hotelname+"</p>";
		footer += "<p>"+dataset.hoteladdress+"</p>";
		footer += "<span>(지번주소:서울특별시 서초구 서초동 1339-1)</span>";
		footer += "<p>"+dataset.servicecentercall+"</p>";
		
		footer += "</div>";
		footer += "</div>";
		footer += "<div class='linkInfo'>";
		footer += "<div class='Infolst'>";
		footer += "<ul>";
		footer += "<li>소개</li>";
		footer += "<li><a href='#'>호텔정보</a></li>";
		footer += "<li><a href='#'>층별안내도</a></li>";
		footer += "<li><a href='#'>오시는 길</a></li>";
		footer += "<li><a href='#'>갤러리</a></li>";
		footer += "</ul>";
		footer += "<ul>";
		footer += "<li>고객문의</li>";
		footer += "<li><a href='#'>연락처</a></li>";
		footer += "<li><a href='#'>FAQ</a></li>";
		footer += "<li><a href='#'>문의하기</a></li>";
		footer += "</ul>";
		footer += "</div>";
		footer += "</div>";
		footer += "<div class='snsNews'>";
		footer += "<dl class='sns'>";
		footer += "<dt class='dt'>SNS</dt>";
		footer += "<dd class='facebook'><a title='Facebook - popup' target='_blank' href='#'><span>Facebook</span></a></dd>";
		footer += "<dd class='instagram'><a title='Instagram - popup' target='_blank' href='#'><span>instagram</span></a></dd>";
		footer += "<dd class='blog'><a title='Blog - popup' target='_blank' href='#'><span>Blog</span></a></dd>";
		footer += "</dl>";
		footer += "</div>";
		footer += "</div>";
		footer += "</div>";
		//footer상단부 - end 
		
		
		//footer 하단부
		footer += "<div class='footer'>";
		footer += "<div class='footer_topbox'>";
		footer += "<div class='linkBox'>";
		footer += "<ul>";
		footer += "<li><a href='#'>신라스테이소개</a></li>";
		footer += "<li><a href='#'>사이트맵</a></li>";
		footer += "<li><a href='#'>개인정보취급방침</a></li>";
		footer += "<li><a href='#'>이메일무단수집금지</a></li>";
		footer += "<li><a href='#'>윤리경영(부정제보)</a></li>";
		footer += "</ul>";
		footer += "</div>";
		footer += "</div>";
		footer += "<div class='adressBox'>";
		footer += "<p>신라스테이 주식회사    서울특별시 중구 다산로 210  (우 : 04586) 대표이사 박상오 </p>";
		footer += "<p>사업자등록번호 201-86-40254 통신판매신고번호 중구0882호 TEL. 02-2230-3000   FAX. 02-2230-3800</p>";
		footer += "<p>COPYRIGHT © HOTEL SHILLA CO., LTD. ALL RIGHTS RESERVED.</p>";
		footer += "</div>";
		footer += "</div>";
		footer += "</div>";
		//footer 하단부-end
		
		footer += "</div>";
		footer += "<footer>";
		
		}//type1
		$('body').children().last().after(footer);
		$(".footer_logo").css({'background':"url(http://localhost:9000/hotel/resources/upload/hotelfile/"+logosrc+")", 'background-repeat' : 'no-repeat', 'background-size':'100% 100%'});
	},//success
})//ajax