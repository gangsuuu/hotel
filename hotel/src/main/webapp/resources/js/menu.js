$.ajax({
	url:'getcategorimenu.do?hotelname='+hotelname,
	success:function(result){
	
	let dataset = JSON.parse(result);
	let type = dataset.style
	let menu = "";	
	
	if(style == 'type2'){
		menu +="<div class='content_lists theme2_content_list'>";
		menu +="<div class='content_inmenu theme2_menu'>";
		for(list of dataset.categori){
			if(list.categori.dept == 0){
				menu +="<h2 class='suject theme2_subject'>list.categoriname</h2>";
			}
		}
		menu +="<ul>";
		for(list of dataset.categori){
			if(list.categori.dept == 1){
				if(list.categoriseq == categoriseq){
					menu +="<li class='content_selected theme2_selected1'><a href='#' class='content_list'>list.name</a></li>";
				}else{
					menu +="<li><a href='#' class='content_list'>list.name</a></li>";
				}
			}
		}
		menu +="</ul>";
		menu +="</div>";
		menu +="</div>";
	}else{
		menu +="<div class='content_lists theme1_content_list'>";
		menu +="<div class='content_inmenu theme1_menu'>";
		for(list of dataset.categori){
			if(list.categori.dept == 0){
				menu +="<h2 class='suject theme1_subject'>list.categoriname</h2>";
			}
		}
		menu +="<ul>";
		for(list of dataset.categori){
			if(list.categori.dept == 1){
				if(list.categoriseq == categoriseq){
					menu +="<li class='content_selected theme1_selected1'><a href='#' class='content_list'>list.name</a></li>";
				}else{
					menu +="<li><a href='#' class='content_list'>list.name</a></li>";
				}
			}
		}
		menu +="</ul>";
		menu +="</div>";
		menu +="</div>";
	}



	$('.content').children().first().before(menu);
	}
})




