$(document).ready(function(){


 /**********************
 	inquiry-my-list
 **********************/
	//문의글 검색
		var search="${search}";
		
		if(search == "search"){
				$(".search_list").val("${searchlist}").prop("selected", true);
			}else{
				$(".search_list").val("title").prop("selected", true);
			}
			
		$("#btnSearch").click(function(){
			if($("#searchName").val()==""){
				alert("내용을 입력해 주세요.");
				$("#searchName").focus();
			}else{
				my_list_search.submit();
			}
		
	});//click		

});//ready

