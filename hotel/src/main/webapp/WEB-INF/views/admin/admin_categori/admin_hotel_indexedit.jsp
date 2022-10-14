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
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/admin.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/public.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
		hotelname = "stayhub"
</script>
<script type="text/javascript">
	$( function() {
    	$( ".index_edit_container" ).sortable({
    		items:">div:not(.endedtitable)",
    		start: function(){
    		},
    		update: function(event, ui){
    		}
    	});
    	 $( ".index_edit_container div" ).disableSelection();
  	} );
</script>
<script>
	///f로고등록
	function editLogo(){
		let edit = confirm("사진을 등록하시겠습니까?");
		if(edit){
			let selectedhotel = $("#hotel_List").val()  
			$("#hotel_edit_hotelname").val(selectedhotel)
	 		$("#insert_logo").click();
	 		$("#insert_logo").change(function(){
	 			var form = $('.hotel_edit_input_logo')[0];
	 			var formData = new FormData(form);
	 			$.ajax({
	 				data : formData,
	 				type : 'POST',
	 				contentType : false,
	 				processData : false,
	 				url:"indexEdit_logo.do",
	 				success:function(result){
	 					edit_index_hotel()
	 				}
	 			})//ajax
	 		});
		}
	}
	
	//add 방향이동 버튼
	function editAddMoveBtn(direction){
		let addCount = $(".index_edit_add_content").length;
		let selectedNum  = $(".selected").attr("data-addNumber");
		
		if(direction == "next"){
			let newSeletedNum = parseInt(selectedNum) + 1;
			$(".selected").removeClass("selected");
			
			if(newSeletedNum > addCount){
				$("[data-addNumber=1]").addClass('selected');	
			}else{
				$("[data-addNumber="+newSeletedNum+"]").addClass('selected');				
			}
		}else{
			let newSeletedNum = parseInt(selectedNum) - 1;
			$(".selected").removeClass("selected");
			
			if(newSeletedNum == 0){
				$("[data-addNumber="+addCount+"]").addClass('selected');	
			}else{
				$("[data-addNumber="+newSeletedNum+"]").addClass('selected');				
			}
		}
	}
	//사진 관리
	function editAddInsert(){
		let insert = confirm("사진을 등록하시겠습니까?");
		if(insert){
	 		$("#insert_add").click();
	 		$("#insert_add").off("change").change(function(){
	 			var upload = document.querySelector("#insert_add");
				var filename = upload.files[0].name;
				var reader = new FileReader();
				var addCount = $(".index_edit_add_content").length;
				var newNum = parseInt(addCount) + 1;
				
				reader.onload = function(event){
					var li = $("<li>");
					li.css("background-image","url("+event.target.result+")");
					li.attr("class","index_edit_add_content");
					li.attr("data-addNumber",newNum);
					if(addCount == 0){
						li.addClass('selected');
						$('.index_edit_add_list').append(li)
					}else{
						$(".selected").removeClass('selected');
						li.addClass('selected');
						$('.index_edit_add_list').children().last().after(li);
					}
				}
				reader.readAsDataURL(event.target.files[0]);
	 		});
		}
	}
	//사진 관리
	function editAddDelete(){
		
		
		let Adddelete = confirm("사진을 삭제하시겠습니까?");
		
		if(Adddelete){
			let selectedNum = $(".selected").attr("data-addNumber");
			let liCount  = $(".index_edit_add_content").length;
			if(parseInt(liCount) == 1){
				$(".selected").remove();
			}else if(selectedNum == liCount){
				var	getprevtNum = parseInt(selectedNum) - 1;
				$(".selected").remove();
				$("[data-addNumber="+getprevtNum+"]").addClass("selected");
			}else{
				for(let i = selectedNum; i < liCount; i++){
					var	getNextNum = parseInt(i) + 1;
					$(".selected").remove();
					$("[data-addNumber="+getNextNum+"]").attr("data-addNumber",i);
				}
				$("[data-addNumber="+selectedNum+"]").addClass("selected");
			}
		}
	}
	//사진 관리
	function editAddUpdate(){
		alert("펑션작동!");
	}
	
	
</script>
<script>
    
	
	//컨텐츠 등록
	function edit_index_hotel(){
		let selectedname = $("#hotel_List").val()
		if(selectedname == null){
			selectedname = "stayhub";
		}
		$.ajax({
			url:"edit_index_getfiles.do?hotelname="+selectedname,
			success:function(result){
				let files = JSON.parse(result);
				$(".index_edit_header_logo").css({'background':'url()'});
				$("#edit_logo_bsfile").val("");
				for(logo of files.file){
					if(logo.position == "logo"){
						let src = logo.bsfilename;
						$(".index_edit_header_logo").css({'background':"url(http://localhost:9000/hotel/resources/upload/"+src+")", 'background-repeat' : 'no-repeat', 'background-size':'100% 100%'});
						if(src == ""){
							$("#edit_logo_bsfile").val("new");
						}else{
							$("#edit_logo_bsfile").val(src);
						}
						
						
					}
				}
			}
		})//ajax
	}
	
	$(document).ready(function(){
		edit_index_hotel();
	})
	
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
	    <div class="content_menu">       
	        <select id="hotel_List" onchange='edit_index_hotel()'>
		       	<c:forEach var='vo'  items='${list}'>
					<option value='${vo.hotelname}'>${vo.hotelname}</option>
		    	</c:forEach>
	     	</select>
	     	<div class="index_edit_container">
				<div class='endedtitable index_edit_header'>
					<div class='index_edit_header_logo' onclick="editLogo()">
					</div>
				</div>	     	
	     		<div class='endedtitable index_edit_add'>
	     			<ul class="index_edit_add_list">
	     			</ul>
	     			<div class="index_edit_add_btnlist">
	     				<div class="index_move_btn index_edit_add_prev" onclick="editAddMoveBtn('prev')">
	     				</div>
	     				<div class="index_edit_add_manage">
	     					<div class='index_edit_add_insert' onclick="editAddInsert()"></div>
	     					<input class="index_edit_header_add_input" id="insert_add" type="file">
	     					<div class="index_edit_add_update" onclick="editAddUpdate()"></div>
	     					<div class="index_edit_add_delete" onclick="editAddDelete()"></div>
	     				</div>
	     				<div class="index_move_btn index_edit_add_next" onclick="editAddMoveBtn('next')">
	     				</div>	     			
	     			</div>
	     			<ul>
	     			</ul>
				</div>
				<div class='index_edit_reservation'>
				</div>
				<div class='index_edit_gallery'>
				</div>
				<div class='index_edit_map'>
				</div>
	     	</div>
		    <div class="">
		        <button id='categori_edit_done'>수정완료</button>
		    </div>
    	</div>
    	<div>
    		<div>헤더 로고설정</div>
    		<div></div>
    	</div>
    	<form  class="hotel_edit_input_logo" name="hotel_edit_input_logo" action="indexEdit_logo.do" method="post" enctype="multipart/form-data">
    		<input class="index_edit_header_logo_input" id="insert_logo" name="categorifile1" type="file">
    		<input class="index_edit_header_logo_input" id="edit_logo_bsfile" name="hotelcontentbsfile" type="hidden">
    		<input class="index_edit_header_logo_input" id="hotel_edit_hotelname" name="hotelname" type="hidden">
    	</form>
	</div>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/footer.js"></script>
</body>
</html>