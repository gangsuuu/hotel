$(document).ready(function(){
 /**********************
 	inquiry-write
 **********************/
 	//문의글 등록하기 - Validation
	$("#btnInquiryWrite").click(function(){
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
			}else if($("#secretNum").val()==""){
				alert("비밀번호 숫자 4자리를 입력하세요.");
				$("#secretNum").focus();
				return false;
			}else if($("input[name='privacyChk']:checked").length==0){
				alert("약관동의를 체크해주세요.");
				$("#privacyChk1").focus();
				return false;
			}else{
				//서버전송
				inquireWriteForm.submit();
			}
		});//click


 /**********************
 	inquiry-update
 **********************/
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


 /**********************
 	inquiry-content
 **********************/
	//삭제 버튼 누르면 삭제 실행하기 - 비밀은 바로 삭제
		$("#modal_delete").on('click', function (){
			inquiryDeleteForm.submit();
		});//click
		
		
		//문의글 답변 상세보기 iid값 받아서 replyContent()실행
		$("input[name=iid]").each(function(){
			replyContent($(this).attr("value"));
		}); 
			
		
		//문의글 답변 상세보기 출력
		function replyContent(iid){
			//alert("상세보기 iid="+iid);
			$.ajax({
				url : "admin_reply_content_json.do?iid="+iid,
				success : function(result){
					//alert(result);
					let data = JSON.parse(result);
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
						text += "<td id='replycontent' height=100px colspan='4'>"+ data.recontent +"</td>";										
						text += "</tr>";
						text += "</table>";
				
						//출력
						if(data.hcount != 0){
							$("#replytable").remove();
							$(".customerBoard").after(text);
							
						}else{
							$("#replytable").remove();
						}
					}//if-end
					
				}//success
				
			});//ajax
			
		}//replyContent() 
		
	
});//ready

