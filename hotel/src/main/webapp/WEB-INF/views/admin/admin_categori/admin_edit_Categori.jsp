<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>Insert title here</title>
<script>
	var hotelname = "stayhub";
</script>
 	 <style>
        table, tr, th,td{
            border:1px solid black;
            border-collapse: collapse;
        }
        
        .test{
        	background-color:red;
        }
    </style>
    <script type="text/javascript">

    var newlist = {
			"hotelname":[],
			"categorigroup":[],
			"categoridept":[],
			"categoriname":[],
			"categorinum":[],
			"categoritype":[],
			"active":[],
	}
    var editelist = {
    		"hotelname":[],
			"categorigroup":[],
			"changegroup":[],
			"categoridept":[],
			"categoriname":[],
			"categorinum":[],
			"changenum":[],
			"categoritype":[],
			"active":[],
    }
    var del_update_date = {
    		"categoridept":[],
    		"hotelname":[],
			"categorigroup":[],
			"changegroup":[],
			"categorinum":[],
			"changenum":[]
    }
    var update_data = {
			"categorigroup":[],
			"categoriname":[],
			"categorinum":[],
    		"active":[],
    		"categoriseq": []
    }
    //호텔변경
   	function hotel_change(){
   		showcategorilist();
   	}
    
    showcategorilist();
   
    function showcategorilist(){
    	$.ajax({
    		url:"admin_categorilist.do",
    		success:function(result){
    			var newobject = new Array();
    			var newJson = JSON.stringify(newobject);
    			
    			let dataset = JSON.parse(result);
    			let selectedhotel  = $("#hotel_List").val();
    			
    			let output = "";
    			
    			output += "<table>";
    			output += "<tr class='table_list'>";
    			output += "<th>선택</th>"
    			output += "<th>카테고리 타이틀</th>";
    			output += "<th>카테고리 타입</th>";
    			output += "<th>카테고리 분류</th>";
    			output += "<th>카테고리 순서</th>";
    			output += "<th>게시물</th>";
    			output += "<th>활성화</th>";
    			output += "</tr>";
    			
    			//리스트 출력
    			for(list of dataset.categori){
    				if(list.hotelname ==  selectedhotel){
    					if(list.categoridept == 1){
	    					output += "<tr class='main' data-group='"+list.categorigroup+"'>";
	    					output += "<td ><input type='radio' name='selecte'></td>";
	    					output += "<td>"+list.categoriname+"</td>";
		    				output += "<td>Main</td>";
	    					output += "<td>"+list.type+"</td>";
	    					output += "<td data-cseq='"+list.categoriseq+"'>"+list.categorigroup+"</td>";
	    					output += "<td>게시물 수량</td>";
	    					
	    					if(list.active == 'active'){
	    						output += "<td>활성화</td>";
	    					}else{
	    						output += "<td>비활성화</td>";
	    					}
	    					output += "</tr>";
	    					
	    					for(sub of dataset.categori){
	    						if(sub.categoridept == 0 && sub.categorigroup == list.categorigroup){
	    							output += "<tr class='sub' data-group='"+list.categorigroup+"'>";
	        						output += "<td><input type='radio' name='selecte'></td>";
	    	    					output += "<td>"+sub.categoriname+"</td>";
	    		    				output += "<td>Sb</td>";
	    	    					output += "<td>"+sub.type+"</td>";
	    	    					output += "<td data-cseq='"+sub.categoriseq+"'>"+sub.categorinum+"</td>";
	    	    					output += "<td>게시물 수량</td>";
	    	    					if(list.active == 'active'){
	    	    						output += "<td>활성화</td>";
	    	    					}else{
	    	    						output += "<td>비활성화</td>";
	    	    					}
	    	    					output += "</tr>";
	    						}//dept, gorup 찾기
	    					}//서브카테고리 출력
    					}//main카테고리 출력
    				}//
    			}//리스트 출력
    			
    			
	        	output += "<tr>"    
    	        output += "<td colspan='7'>"
	            output += "<button id='creatCategori'>생성</button>"
	            output += "<button id='categori_edit' >수정</button>"
	            output += "<button id='categori_del'>삭제</button>"
	        	output += "</tr>"    

				output += "</tabele>";
				output += "</div>"
				
				$('table').remove();
    			$("#hotel_List").after(output);
    			
    			
    			//카테고리 만들기
				$("#creatCategori").click(function(){
					let createCategori = '';
					let selectedhotel  = $("#hotel_List").val();
					
					createCategori +="<div class='create_categori'>"
					
					createCategori +="<div class='categori_select'>"
					createCategori +="<label>카테고리 타입</label>"
					createCategori +="<select id='categori_select'>"
					createCategori += "<option value='maincategori'>메인 카테고리</option>"
					createCategori += "<option value='subcategori'>보조 카테고리</option>"
					createCategori +="</select>"
					createCategori +="</div>"
					
					createCategori +="<div class='categori_select_detail'>"
					createCategori +="<label>카테고리 리스트</label>"
					createCategori +="<select id='categori_select_detail' disabled>"
					createCategori +="</select>"
					createCategori +="</div>"

					
					createCategori +="<div>"
					createCategori +="<label>카테고리 이름</label>"
					createCategori +="<input type='text' id='new_categori_name'>"
					createCategori +="</div>"
					
					
					createCategori +="<div>"
					createCategori += "<input id='type' name='type' type='radio' value='list'>리스트 형"
					createCategori += "<input id='type' name='type' type='radio' value='content'>컨텐츠 형"
					createCategori +="</div>"
					
					createCategori +="<div>"
					createCategori += "<button id='categori_insert'>등록 완료</button>"
					createCategori += "<button id='categori_cancel'>취소<button>"
					createCategori +="</div>"
					
					createCategori += "</div>"
					
					
					//이미 카테고리 등록이 출력되있는지 확인
					if($(".create_categori").length == 0 && $(".categori_edit").length != 0){
						var check = confirm("수정을 취소하시겠습니까?");
						if(check){
						$(".categori_edit").remove();
						$("table").after(createCategori);
						}
					}else if($(".create_categori").length == 0){
						$("table").after(createCategori);
					}
					
					
					//카테고리 변경
				 	$("#categori_select").change(function(){
				 		let categoriValue = $("#categori_select").val()
				 		let subcategori = '';
				 		if(categoriValue == 'maincategori'){
				 			for(sublist of dataset.categori){
				 				if(selectedhotel == sublist.hotelname && 1 == sublist.categoridept){
				 					subcategori += "<option value='"+sublist.categoriname+"'>"+sublist.categoriname+"</option>";
				 				}
				 			}
				 			$("#categori_select_detail").append(subcategori);
				 			$("#categori_select_detail").attr('disabled',true)
				 		}else{
				 			$("#categori_select_detail").attr('disabled',false)
				 			let maincount = $(".main").length;
				 			subcategori += "<option value=''>카테고리를 선택해 주세요</option> "
							for(var i = 0; i < maincount; i++){
								let group = $(".main").eq(i).data('group');
								let name = $(".main").eq(i).children().eq(1).text();
								subcategori += "<option value='"+group+"'>"+name+"</option>";
							}
				 		}
				 			$("#categori_select_detail").empty();
				 			$("#categori_select_detail").append(subcategori);
				 	})//카테고리 변경
				 	
				 	//카테고리 등록
				 	$("#categori_insert").click(function(){
				 		if($("#new_categori_name").val() == ""){
				 			alert("카테고리 제목을 입력해 주세요");
				 		}else if($("#categori_select").val() == "subcategori" && $("#categori_select_detail").val() == ""){
				 			alert("카테고리를 선택해 주세요");
				 			 //&& $("#categori_select_detail").val() == ""
				 		}else if($("input[name='type']:checked").length == 0){
				 			alert("게시물 타입을 선택해 주세요")
				 		}else{
					 		let categoriValue = $("#categori_select").val()
					 		if(categoriValue == 'maincategori'){
					 			let maincount = $('.main').length;
					 			let categori_insert = '';
					 			let newcount = 1 + maincount
					 			//let subgroup = $("[data-group="+maincount+"]").length;
					 			
					 			categori_insert += "<tr class='main' data-group="+newcount+">";
					 			categori_insert += "<td><input type='radio' name='selecte'></td>";
					 			categori_insert += "<td>"+$("#new_categori_name").val()+"</td>";
					 			categori_insert += "<td>Main</td>";
					 			categori_insert += "<td>"+ $("input[name='type']:checked").val()+"</td>";
					 			categori_insert += "<td>"+newcount+"</td>";
					 			categori_insert += "<td>게시물 수량</td>";
					 			categori_insert += "<td>활성화</td>";
					 			categori_insert += "</tr>";
					 			
					 			//json등록
					 			newlist = {
				    					"hotelname":selectedhotel,
				    					"categorigroup":newcount,
				    					"categoridept":1,
				    					"categoriname":$("#new_categori_name").val(),
				    					"categorinum":newcount,
				    					"categoritype": $("input[name='type']:checked").val(),
				    					"active":"active",	
					 			}
					 			newobject.push(newlist);
					 			newJson = JSON.stringify(newobject);
					 			
					 			$(".create_categori").remove();
					 			if(maincount == 0){
					 				$(".table_list").after(categori_insert);
					 			}else{
					 				//$(".main").last().after(categori_insert);
			    					$("[data-group="+maincount+"]").last().after(categori_insert);
					 			}
					 		}else{
					 			let subcount  = $('#categori_select_detail').val();
					 			let subgroup = $("[data-group="+subcount+"]").length;
					 			let categori_insert = '';
					 			
					 			categori_insert += "<tr class='sub' data-type='new' data-group="+subcount+" >";
					 			categori_insert += "<td><input type='radio' name='selecte'></td>";
					 			categori_insert += "<td>"+$("#new_categori_name").val()+"</td>";
					 			categori_insert += "<td>Sb</td>";
					 			categori_insert += "<td>"+ $("input[name='type']:checked").val()+"</td>";
					 			categori_insert += "<td>"+subgroup+"</td>";
					 			categori_insert += "<td>게시물 수량</td>";
		    					categori_insert += "<td>활성화</td>";
		    					categori_insert += "</tr>";
		    					
		    					//json등록
					 			newlist = {
				    					"hotelname":selectedhotel,
				    					"categorigroup":$("#categori_select_detail").val(),
				    					"categoridept":0,
				    					"categoriname":$("#new_categori_name").val(),
				    					"categorinum":subgroup,
				    					"categoritype": $("input[name='type']:checked").val(),
				    					"active":"active",	
					 			}
					 			newobject.push(newlist);
					 			newJson = JSON.stringify(newobject);
					 			
		    					$(".create_categori").remove();
		    					$("[data-group="+subcount+"]").last().after(categori_insert);
					 		}//else
				 			$.ajax({
								method: 'POST',
								url: "admin_categori_insert.do",
								traditional: true,
								data: {
								       data: newJson
								},
								dataType:'json',
								success:function(result){
								    showcategorilist();
								},
								error:function(jqXHR, textStatus, errorThrown){
								    showcategorilist();
								}
							});
				 		}//if done
				 	})//카테고리 등록
				 	
				 	//카테고리등록 취소
				 	$("#categori_cancel").click(function(){
				 		$(".create_categori").remove();
				 	})//카테고리 등록 취소
				
				})//카테고리 만들기
				
				
				//생성 카테고리 등록
				$("#categori_edit_done").click(function(){
					var mainlength = $(".main").length;
					var sublength = $(".sub").length;
					
					var totallength = mainlength + sublength;
					for(var i = 0; i < mainlength ;i++){
						update_data = {
								"categorigroup":$(".main").eq(i).data('group'),
								"categoriname": $(".main").eq(i).children().eq(1).text(),
								"categorinum": $(".main").eq(i).children().eq(4).text(),
					    		"active":"active",
					    		"categoriseq": $(".main").eq(i).children().eq(4).data('cseq')
					    }
						newobject.push(update_data);
			 			newJson = JSON.stringify(newobject);
					}
					for(var i = 0; i < sublength ;i++){
						update_data = {
								"categorigroup":$(".sub").eq(i).data('group'),
								"categoriname": $(".sub").eq(i).children().eq(1).text(),
								"categorinum": $(".sub").eq(i).children().eq(4).text(),
								"active":"active",
					    		"categoriseq": $(".sub").eq(i).children().eq(4).data('cseq')
					 }
						newobject.push(update_data);
			 			newJson = JSON.stringify(newobject);
					}
					
					$.ajax({
						method: 'POST',
						url: "admin_categori_update.do",
						traditional: true,
						data: {
						       data: newJson
						},
						dataType:'json',
						success:function(result){
							alert(result);
						},
						error:function(result){
						}
					});
			 	})//생성 카테고리 제거
    		   
    			 
			 	//tr 선택
			 	$(document).on("click","tr",function (){
			 		
			 		if($(this).attr('class') == 'main' || $(this).attr('class') == 'sub'){
					$(".test").removeClass('test');
					$(this).addClass("test");
					}
			 	})//tr 선택
				
			 	
				//삭제
				$('#categori_del').click(function(){
					let dept;
					let text = $(".test").children();
					if($(".test").attr('class') == 'main test'){
						dept = 1;
						var delgorupnum = $(".test").data('group');
						var grouplength = $(".main").length;
						for(var i = delgorupnum; i < grouplength; i++){
							var changegroup = parseInt(i)+1
							$("[data-group="+changegroup+"][class='main']").children().eq(4).text(i);
							$("[data-group="+changegroup+"]").data("group",i);
							$("[data-group="+changegroup+"]").attr("data-group",i);
							
							del_update_date = {
									"categoridept":dept,
						    		"hotelname": selectedhotel,
									"categorigroup": changegroup,
									"changegroup": i,
									"categorinum":null,
									"changenum": null,
						    }//dat - set
							newobject.push(del_update_date);
				 			newJson = JSON.stringify(newobject);
						}//for- end
					}else{
						dept = 0;
						var delgroupnum = $(".test").data('group');
						var delnum = $(".test").children().eq(4).text();
						var numlength = $("[data-group="+delgroupnum+"]").length;
						for(var i = delnum ; i < numlength; i++){
							var changenum = parseInt(i)+1
							$("[data-group="+delgroupnum+"]").eq(changenum).children().eq(4).text(i);
							del_update_date = {
									"categoridept":dept,
						    		"hotelname": selectedhotel,
									"categorigroup": delgroupnum,
									"changegroup": null,
									"categorinum": changenum,
									"changenum": i
						    }//dat - set
				 			newobject.push(del_update_date);
				 			newJson = JSON.stringify(newobject);
						}//for-end

					}//if-end
					
					if($(".test").length == 1){
						var data={
							"hotelname":  selectedhotel,
							"categoridept": dept ,
							"categoriname": text.eq(1).text(),
							"categorigroup": $('.test').data('group'),
							"categoriseq": $('.test').children().eq(4).data('cseq')
						};
						
						$.ajax({
							method:'POST',
							url:'admin_categorid_del.do',
							data: data,
							traditional: true,
							success:function(del){
								$.ajax({
									method:'POST',
									url:'admin_categorid_del_update.do',
									traditional: true,
									data: {
									       data: newJson
									},
									dataType:'json',
									success:function(del){
									  showcategorilist();
									},
									error:function(){
									  showcategorilist();
									}
								})//ajax
							},
							error:function(){
								$.ajax({
									method:'POST',
									url:'admin_categorid_del_update.do',
									traditional: true,
									data: {
									       data: newJson
									},
									dataType:'json',
									success:function(del){
									  showcategorilist();
									},
									error:function(){
								  	  showcategorilist();
									}
							})//ajax
							}
							
						})//ajax end
						 
					}//선택tr 있는지 확인
				})//삭제
			 	
				//카테고리 수정
				$("#categori_edit").on("click",function(){
					var content = $(".test");
					var text = "";
					text += "<div class='categori_edit'>";
			
					text += "<div>"
					text += "<label>카테고리 선택</label>"
					text += "<select id='categori_change'>";
					if(content.attr("class") == "main test"){
						$('#categori_change').attr('disabled',true);
					}else{
						let maincount = $(".main").length;
						for(var i = 0; i < maincount; i++){
							let group = $(".main").eq(i).data('group');
							let name = $(".main").eq(i).children().eq(1).text();
							if(content.data('group') == group){
								text += "<option value='"+group+"' selected>"+name+"</option>";
							}else{
								text += "<option value='"+group+"'>"+name+"</option>";
							}//if
						}//for
					}//if
					text += "</select>";
					text += "</div>";
					
					text += "<div>";
					text += "<label>카테고리 순서</label>"
					text += "<select id='categori_edit_num'>";
					if(content.attr("class") == "main test"){
						for(var i=0; i < $(".main").length; i++){
							var j= i+1
							if(j == content.data('group')){
								text += "<option value='"+j+"' selected>"+j+"</option>";
							}else{
								text += "<option value='"+j+"'>"+j+"</option>";
							}//if
						}//for 
					}else{
						var num = content.data('group');
						var group = $("[data-group="+num+"]").not(".main");
						for(var i = 0; i < group.length; i++){
							var j= i+1
							if(j == content.children().eq(4).text()){
								text += "<option value='"+j+"' selected>"+j+"</option>";
							}else{
								text += "<option value='"+j+"'>"+j+"</option>";
							}//if
						}//for						
					}//else
					text += "</select>";
					text += "</div>";
					
					text += "<div>";
					text += "<label>카테고리 이름<label>";
					text += "<input type='text'id='edite_categori_name' value='"+content.children().eq(1).text()+"'>";
					text += "</div>";

					text +="<div>"
					text +="<label>활성화</label>"
					if(content.children().eq(6).text() == "활성화"){
						text +="<input type='checkbox' name='active' value='active' checked='checked'>"					
					}else{
						text +="<input type='checkbox' name='active' value='active'>"	
					}
					text +="</div>"
					
					text +="<div>"
					text += "<button id='categori_update'>등록 완료</button>"
					text += "<button id='categori_cancel'>취소<button>"
					text +="</div>"
					
					text += "</div>";
					text += "";
					
					//에디트 출력 확인
					if($('.test').length == 0){
						alert('선택해 주세요');
					}else if($(".create_categori").length == 1 && $(".categori_edit").length == 0){
						$(".create_categori").remove();
						$("table").after(text);
					}else if($(".categori_edit").length == 0){
						$("table").after(text);
					}
					
					//에디트 취소 버튼
					$("#categori_cancel").click(function(){
						var check = confirm("수정을 취소 하시습니까?");
						if(check){
							$(".categori_edit").remove();
						}
					})
					$("#categori_change").change(function(){
						var getgroup =  $("#categori_change").val();
						var group = $("[data-group="+getgroup+"]").not(".main");
						var text = '';
						if(group.length == 0){
							text += "<option value='"+1+"' selected>"+1+"</option>";	
						}else{
							for(var i = 0; i < group.length+1; i++){
								var j= i+1
									if(j == 1 ){
										text += "<option value='"+j+"' selected>"+j+"</option>";
									}else{
										text += "<option value='"+j+"'>"+j+"</option>";
									}
							}//for
						}
						$("#categori_edit_num").empty();
			 			$("#categori_edit_num").append(text);
					 });
					
					
					//카테고리 수정 등록
					$("#categori_update").click(function(){
						content.children().eq(1).text($("#edite_categori_name").val());
						if($("input[name='active']:checked").length != 0){
							content.children().eq(6).text("활성화");
						}else{
							content.children().eq(6).text("비활성화");
						}
						if(content.attr("class") == "main test"){
							var orggroup = content.data('group');
							var changegroup = $("#categori_edit_num").val();
							var group = $("[data-group="+orggroup+"]")
							if(orggroup > changegroup){
								$("[data-group="+changegroup+"]").first().before(group);
								for(var i = orggroup; i > changegroup; i--){
									var groupnum = parseInt(i)-1
									$("[data-group="+groupnum+"][class='main']").children().eq(4).text(i);
									$("[data-group="+groupnum+"]").attr("data-group",i);
									$("[data-group="+groupnum+"]").data("group",i);
								}//for
							}else if(orggroup < changegroup){
								$("[data-group="+changegroup+"]").last().after(group);
								for(var i = orggroup; i < changegroup; i ++){
									var groupnum = parseInt(i)+1
									$("[data-group="+groupnum+"][class='main']").children().eq(4).text(i);
									$("[data-group="+groupnum+"]").attr("data-group",i);
									$("[data-group="+groupnum+"]").data("group",i);
								}//for
							}//if 
							group.attr("data-group",changegroup);
							group.data("group",changegroup);
							content.data("group",changegroup);
							$(".test").children().eq(4).text(changegroup);
						}else{
							if($("#categori_change").val() == content.data('group')){
								//보조 카테고리 -> 같은 그룹
								var orgnum = content.children().eq(4).text()
								var group = content.data('group');							
								var changenum = $("#categori_edit_num").val();
								if(orgnum > changenum){
									$("[data-group="+group+"]").eq(changenum).before(content);
									for(var i = orgnum; i > changenum; i--){
										$("[data-group="+group+"]").eq(i).children().eq(4).text(i);
									}//for
									content.children().eq(4).text(changenum);
								}else{
									//위로 이동
									$("[data-group="+group+"]").eq(changenum).after(content);
									for(var i = orgnum; i < changenum; i++){
										$("[data-group="+group+"]").eq(i).children().eq(4).text(i);
									}//for
									content.children().eq(4).text(changenum);
								}
							}else{
								//보조 카테고리 -> 다른 그룹
								var orgnum = content.children().eq(4).text()
								var changenum = $("#categori_edit_num").val();
								var orggroup = content.data('group');
								var newgroup = $("#categori_change").val();
								var orglength = $("[data-group="+orggroup+"]").length;
								var newlength = $("[data-group="+newgroup+"]").length;
								if(changenum = newlength){
									$("[data-group="+newgroup+"]").last().after(content);
								}else{
									$("[data-group="+newgroup+"]").eq(changenum).before(content);
								}
								for(var i = orgnum; i < orglength; i++){
									$("[data-group="+orggroup+"]").eq(i).children().eq(4).text(i);
								}
								for(var i = changenum; i < newlength; i++){
									var newgroupnum  = parseInt(i)+1
									$("[data-group="+newgroup+"]").eq(i).children().eq(4).text(newgroupnum);
									//$("[data-group="+newgroup+"]").eq(i).data('group',newgroupnum);
								}
								content.data('group',newgroup);
								content.attr('data-group',newgroup);
								content.children().eq(4).text(changenum);
							}
						}//else
						$('.categori_edit').remove();
					})//카테고리 수정 등록
				});//카테고리 수정
				//수정 등록
				
    		}//success 		
    	})//ajax
    }//showcategorilist

	</script>
</head>
<body>
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
                   <li><a href="http://localhost:9000/hotel/edit_index.do" class="content_list">인덱스페이지</a></li>
                </ul>
            </div>
            
       	</div>
            
	        <div class="content_menu">       
	        	<select id="hotel_List" onchange='hotel_change()'>
		       		<c:forEach var='vo'  items='${list}'>
					   <option value='${vo.hotelname }'>${vo.hotelname }</option>
		    		</c:forEach>
	     		 </select>
		    <div class="">
		        <button id='categori_edit_done'>수정완료</button>
		    </div>
    	</div>
	</div>
</body>
</html>