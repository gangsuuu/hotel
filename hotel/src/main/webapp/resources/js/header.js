
$.ajax({
	url:"header_getCategori.do?hotelname="+hotelname,
	success:function(result){
		let dataset = JSON.parse(result);
		let type = dataset.style
		let logosrc = dataset.logoSrc
		let output = "";	
		if(type == 'hub'){
		//hub페이지 출력
			output += "<header class='hub'>";
			output += "<div class='header'>";	
			
			
			output += "<div class='header_top_left left_hub'>";
			output += "<div><a href='javascript:findhotel()'>호텔찾기</a></div>";
			output += "<div><span>예약</span></div>";  
			output += "</div>"
			
			output += "<div class='header_top_mid'>";
			output += "<a href='http://localhost:9000/index/shillastayindex.do?hotelname="+hotelname+"' class='header_top_mid_logo logo_hub'></a>"
			output += "</div>"
			
			output += "<div class='header_top_right'>";
			output += "<div class='header_top_guest'>";			
			output += "<a class='header_login' href='#'>로그인</a>";
			output += "<a href='#'>예약확인</a>";
			output += "</div>";
			
			output += "<div class='header_top_list'>";
			
			for(list of dataset.categori){
				if(list.categoridept == 1){
				output += "<a href='#'>"+list.categoriname+"</a>"
				}
			}
			output += "</div>";
			
			output += "</div>";
			output += "</div>";
			output += "</header>";
		}else if(type == 'type1'){
			output += "<header class='theme1'>";
			output += "<div class='header'>";
			output += "<div class='header_top_left theme1'>";
			output += "<div><a href='javascript:findhotel()'>호텔찾기</a></div>";
			
			//호텔찾기 페이지
			output += "<div class='whiteboard'>"
			output += "<div class='header_find_hotel'>"
			
			output += "</div>"
			output += "</div>"
			
			output += "</div>";
			output += "<div class='header_top_mid'>";
			output += "<a href='http://localhost:9000/index/shillastayindex.do?hotelname="+hotelname+"' class='header_top_mid_logo logo_hub'></a>";
			output += "</div>";
			output += "<div class='header_top_right'>";
			output += "<div class='header_top_guest theme1_guest'>";
			output += "<a class='header_login' href='#'>로그인</a>";
			output += "<a href='#'>예약확인</a>";
			output += "</div>";
			output += "</div>";
			output += "</div>";
			
			output += "<div class='header_categori_container theme1_categori'>";
			output += "<ul class='header_maincategori_lists theme1_main'>";
			
			output += "<div>";
			for(list of dataset.categori){
				if(list.categoridept == 1){
				output += " <li class='header_maincategori theme1_after'>";
				output += "<a href='#'>"+list.categoriname+"</a>";
				output += "<ul class='header_subcategori_list theme1_sub_container'>";
				for(sub of dataset.categori){
					if(list.categorigroup == sub.categorigroup && sub.categoridept == 0){
					output += "<li><a class='theme1_sub' id='header_subcategori' href='#'>sub.categoriname</a></li>";
					}	
				}
				output += "</ul>";
				
				output += "</li>";
				}
			}
			output += "</div>";
			
			output += "<div>";	
			output += "<li class='header_maincategori_res'>";
			output += "<a class='theme1_main_res' href='#'>예약</a>";
			output += "<ul class='header_subcategori_list theme1_sub_res_container'>";
			output += "<li><a class='theme1_sub_res' id='header_subcategori' href='#'>객실</a></li>";
			output += "<li><a class='theme1_sub_res' id='header_subcategori' href='#'>다이닝</a></li>";
			output += "</ul>";
			output += "</li>";
			output += "</div>";
			
			output += "</ul>";
			output += "</div>";
			output += "</header>";
		}else if(type == 'type2'){
			output += "<header class='theme2'>";
			output += "<div class='header'>";
			output += "<div class='header_top_left theme2'>";
			output += "<div><a href='javascript:findhotel()'>호텔찾기</a></div>";
			output += "</div>";
			output += "<div class='header_top_mid'>";
			output += "<a href='http://localhost:9000/index/shillastayindex.do?hotelname="+hotelname+"' class='header_top_mid_logo logo_hub'></a>";
			output += "</div>";
			output += "<div class='header_top_right'>";
			output += "<div class='header_top_guest theme2_guest'>";
			output += "<a class='header_login' href='#'>로그인</a>";
			output += "<a href='#'>예약확인</a>";
			output += "</div>";
			output += "</div>";
			output += "</div>";
			output += "<div class='header_categori_container theme2_categori'>";
			output += "<ul class='header_maincategori_lists theme2_main'>";
		
			output += "<div>";
			for(list of dataset.categori){
				if(list.categoridept == 1){
				output += " <li class='header_maincategori theme2_after'>";
				output += "<a href='#'>"+list.categoriname+"</a>";
				output += "<ul class='header_subcategori_list theme2_sub_container'>";
				for(sub of dataset.categori){
					if(list.categorigroup == sub.categorigroup && sub.categoridept == 0){
					output += "<li><a class='theme2_sub' id='header_subcategori' href='#'>"+sub.categoriname+"</a></li>";
					}	
				}
				output += "</ul>";
				output += "</li>";
				}
			}
			output += "</div>";
			
			output += "<div>";
			output += "<li class='header_maincategori_seach'>";
			output += "<a class='theme2_main_seach' href='#'>위치찾기</a>";
			output += "</li>";
			output += "<li class='header_maincategori_res'>";
			output += "<a class='theme2_main_res' href='#'>예약</a>";
			output += "</li>";
			output += "</div>";
			
			output += "</ul>";
			output += "</div>";
			output += "</header>";
		}
			$('body').children().first().before(output);
			$('.header_top_mid_logo').css({'background':"url(http://localhost:9000/index/resources/upload/"+logosrc+")", 'background-repeat' : 'no-repeat', 'background-size':'100% 100%'});
			
	}
})