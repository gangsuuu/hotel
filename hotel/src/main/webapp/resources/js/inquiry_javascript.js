 /******************************
 	inquiry-list / javascript
 *******************************/
	function modalopen(iid){ 
			$("#passCheck").attr('onclick',"checkPass('"+iid+"')");
		 }
		 
	function checkPass(iid){
			
		const pass = $("#inputPass").val();
			
		$.ajax({
			url:"inquiry_passCheck.do?iid="+iid+"&pass="+pass,
			success:function(result){
					if(result == 'ok'){
						location.replace("inquiry_content.do?iid="+iid);
					}else{
						$("#passCheckText").text("비밀번호가 틀렸습니다.").css("color","red");
						$("#inputPass").val("").focus();
						//alert("비밀번호가 틀렸습니다.");	 
					}				
				}
			}); 	
				
		}//checkPass
		
 /******************************
 	inquiry-write / javascript
 *******************************/
 	//문의글 글쓰기에서 띄어쓰기 넣기
 	function mykey(){
		var key = $("#content").val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$("#content").val(key);
		
		var key = $("#content").val();
		key = key.split('<br>').join("\r\n");
		$("#content").val(key);
	}//mykey
	
	
	
 /******************************
 	inquiry-content / javascript
 *******************************/	
 	//전체글 수정하기 버튼 클릭 시, 비번체크
	function modalopen2(iid){ 
		$("#passCheck").attr('onclick',"checkPass2('"+iid+"')");
	 }
 
	 function checkPass2(iid){
		
		const pass = $("#inputPass").val();
		
		
		$.ajax({
			url:"inquiry_passCheck.do?iid="+iid+"&pass="+pass,
			success:function(result){
					if(result == 'ok'){
						location.replace("inquiry_update.do?iid="+iid);
					}else{
						$("#passCheckText").text("비밀번호가 틀렸습니다.").css("color","red");
						$("#inputPass").val("").focus();
						//alert("비밀번호가 틀렸습니다.");	 
					}				
				}
			}); 	
			
		}//checkPass2()
		
		//전체글이면 삭제실행전에 비번체크하기 후 삭제
		function modalopen3(iid){
			$("#passCheck").attr('onclick',"checkPass3('"+iid+"')");
		 }
	 
		 function checkPass3(iid){
			const pass = $("#inputPass").val();
			
			$.ajax({
				url:"inquiry_passCheck.do?iid="+iid+"&pass="+pass,
				success:function(result){
						if(result == 'ok'){
							inquiryDeleteForm.submit();
		
						}else{
							$("#passCheckText").text("비밀번호가 틀렸습니다.").css("color","red");
							$("#inputPass").val("").focus();
						}				
					}
				}); 	
				
			}//checkPass3()
 
 
 
 