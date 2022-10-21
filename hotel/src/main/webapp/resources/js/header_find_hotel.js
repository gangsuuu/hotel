function findhotel(){
	$(".whiteboard").css('display','block');
	$(".header_find_hotel").css('display','block');
}
$.ajax({
	url:"header_gethotellist.do",
	success:function(result){
	let dataset = JSON.parse(result);
	let find_hotel = "";
		find_hotel += "<div class='whiteboard'>";
		find_hotel += "</div>";
		find_hotel += "<div class='header_find_hotel'>";
		find_hotel += "<div class='header_find_type'>";
		find_hotel += "<div class='header_find_type_list'>";
		find_hotel += "<a class='header_find_location_type header_find_selected' href='#'>권역별</a>";
		find_hotel += "<a class='header_find_brand_type 'href='#'>브랜드별</a>";
		find_hotel += "</div>";
		find_hotel += "<div class='header_find_close btn'>";
		find_hotel += "<div class='close_1'></div>";
		find_hotel += "<div class='close_2'></div>";
		find_hotel += "</div>";
		find_hotel += "</div>";
		find_hotel += "<div class='header_find_lists location_type'>";
		find_hotel += "<div class='header_find_locatrion_type'>국내</div>";
			
		
		find_hotel += "<div class='header_find_list'>";
		find_hotel += "<div class='header_find_location'>";
		find_hotel += "<div class='header_find_location_img'>";
		find_hotel += "</div>";
		find_hotel += "<div class='header_find_location_list'>";
		for(hotel of dataset.hotellist){
			if(hotel.hotellocation == '서울강북'){
				find_hotel += "<a href='shillastayindex.do?hotelname="+hotel.hotelname+"'>"+hotel.hotelname+"</a>";
			}
		}
		find_hotel += "</div>";
		find_hotel += "</div>";
		
		find_hotel += "<div class='header_find_location'>";
		find_hotel += "<div class='header_find_location_img'>";
		find_hotel += "</div>";
		find_hotel += "<div class='header_find_location_list'>";
		for(hotel of dataset.hotellist){
			if(hotel.hotellocation == '서울강남'){
				find_hotel += "<a href='shillastayindex.do?hotelname="+hotel.hotelname+"'>"+hotel.hotelname+"</a>";
			}
		}
		find_hotel += "</div>";
		find_hotel += "</div>";
			
		find_hotel += "<div class='header_find_location'>";
		find_hotel += "<div class='header_find_location_img'>";
		find_hotel += "</div>";
		find_hotel += "<div class='header_find_location_list'>";
		for(hotel of dataset.hotellist){
			if(hotel.hotellocation == '전국'){
				find_hotel += "<a href='shillastayindex.do?hotelname="+hotel.hotelname+"'>"+hotel.hotelname+"</a>";
			}
		}
		find_hotel += "</div>";
		find_hotel += "</div>";
		find_hotel += "</div>";
		find_hotel += "</div>";
				
		find_hotel += "<div class='header_find_lists find_hotel_brand brand_type'>";
		find_hotel += "<div class='header_find_list'>";
		
		find_hotel += "<div class='header_find_location find_brand_list'>";
		find_hotel += "<a href='http://localhost:9000/hotel/shillastayindex.do' class='header_find_location_img find_brand_img_shillastay'>";
		find_hotel += "</a>";
		find_hotel += "<div class='header_find_location_list'>";
		for(hotel of dataset.hotellist){
			if(hotel.hotelcsstype == 'type1'){
				find_hotel += "<a href='shillastayindex.do?hotelname="+hotel.hotelname+"'>"+hotel.hotelname+"</a>";
			}
		}
		find_hotel += "</div>";
		find_hotel += "</div>";
		
		find_hotel += "<div class='header_find_location find_brand_list'>";
		find_hotel += "<a href='http://localhost:9000/hotel/theshilla.do' class='header_find_location_img find_brand_img_theshilla'>";
		find_hotel += "</a>";
		find_hotel += "<div class='header_find_location_list'>";
		for(hotel of dataset.hotellist){
			if(hotel.hotelcsstype == 'type2'){
				find_hotel += "<a href='#'>"+hotel.hotelname+"</a>";
			}
		}
		find_hotel += "</div>";
		find_hotel += "</div>";
		
		find_hotel += "</div>";
		find_hotel += "</div>";
		
		find_hotel += "</div>";
		find_hotel += "</div>";
			
			
		$("header").after(find_hotel);
		
			
		$(".header_find_close").click(function(){
			$(".whiteboard").css('display','none');
			$(".header_find_hotel").css('display','none');
		})
		
		$(".header_find_brand_type").click(function(){
			$(".header_find_location_type").removeClass('header_find_selected');
			$(".header_find_brand_type").addClass('header_find_selected');
			$(".location_type").css('display','none');
			$(".brand_type").css('display','flex');
		})
		$(".header_find_location_type").click(function(){
			$(".header_find_brand_type").removeClass('header_find_selected');
			$(".header_find_location_type").addClass('header_find_selected');
			$(".brand_type").css('display','none');
			$(".location_type").css('display','flex');
		})
		
	}
});

