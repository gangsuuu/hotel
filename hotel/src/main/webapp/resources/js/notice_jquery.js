$(document).ready(function(){
 /**********************
 	공지사항 등록폼 유효성 체크
 **********************/
	$("#btnNoticeWrite").click(()=>{
 
		if($("#ntitle").val() == ""){
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;	 
		}else{
 			boardWriteForm.submit();
 		}
	});	
	
	
	
});


