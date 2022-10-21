$(document).ready(function(){
 
/****************************
 	admin-inquiry-list
 ****************************/
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
				admin_list_search.submit();
			}
		
		});//click	
 
 
 /****************************
 	admin-inquiry-update
 *****************************/
	//문의글 수정하기 - Validation
	$("#btnInquiryUpdate").click(function(){
			var isCheck = $('input[name=hotelname]:checked').val();
			if(!isCheck){
				alert("호텔을 선택해 주세요.");
				$("#hotelname").focus();
				return false;
			}else if($("#category").val()=="default"){
				alert("질문유형을 선택해주세요");
				$("#category").focus();
				return false;
			}else if($("#title").val()==""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			} else if($("#secretnum").val()==""){
				alert("비밀번호에 숫자 4자리를 입력하세요");
				$("#secretnum").focus();
				return false;
			}else{
				//서버전송
				inquireUpdateForm.submit();
			}
		});	//click
		
		//파일업로드 이름 변경
		$("input[type=file]").change(function(){
			if(window.FileReader){//파일선택창이 열렸으면~
				let fname = $(this)[0].files[0].name; //$(this)[0] input타입 파일태그 여러개일때 첫번째인것
				$("#upload_file").text(fname);
			}
		});//change	


 /****************************
 	admin-inquiry-content
 *****************************/
		
		//관리자 문의글 삭제처리
		$("#modal_delete").on('click', function(){
			adminDeleteForm.submit();
		});//click
		
		
		//관리자 문의글 수정처리
		$("#btn_ReplyWrite").on('click', function(){
			replyinquiry.submit();
		});//click
		
		
		//문의글 답변 상세보기 iid값 받아서 replyContent()실행
		$("input[id=replywrite]").each(function(){
			//alert($(this).attr("value"));
			//alert($(this).attr("id"));
			replyContent($(this).attr("value"));			
		}); 
			
		
		//문의글 답변 상세보기 출력
		function replyContent(iid){
			//alert("상세보기 iid="+iid);
			$.ajax({
				url : "admin_reply_content_json.do?iid="+iid,
				success : function(result){
					let data = JSON.parse(result);
					//alert(result);
					//alert(data.hcount);
					if(data.reply == 0){
						//alert("reply=0");
					}else{
						let text = "<table border=1 class='replytable'>";
						text += "<tr>";
						text += "<th>작성자</th>";
						text += "<td>관리자</td>";
						text += "<th>등록일자</th>";
						text += "<td>"+ data.redate +"</td>";
						text += "</tr>";
						text += "<tr>";
						text += "<td id='replycontent' height=100px colspan='4'>"+ data.recontent +"<button type='button' id='replydelete'>x</button></td>";										
						text += "</tr>";
						text += "</table>";
					
						//출력
						if(data.hcount != 0){
							$("#replytable").remove();
							$(".customerBoard").after(text);
							
						}else{
							$("#replytable").remove();
						}
					
						//삭제버튼 실행
						$("#replydelete").click(function(){
							replyDeleteForm.submit();
						});
						
					}//if-end
						
				}//success
				
			});//ajax
			
		}//replyContent() 
	
	
	
	
	
});//ready

