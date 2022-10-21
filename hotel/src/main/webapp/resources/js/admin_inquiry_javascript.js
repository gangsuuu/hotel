 /************************************
 	admin-inquiry-list / javascript
 *************************************/
	function modalopen(iid){ 
		$("#passCheck").attr('onclick',"checkPass('"+iid+"')");
	 }
	 
	function checkPass(iid){
		
		const pass = $("#inputPass").val();
		/* const getiid = $("#getIid").val();
		$("#getIid").val(iid);
		const getpass = $("#getPass").val();
		$("#getPass").val(pass); */
		/* alert($("#inputPass").val());
		alert(pass);
		alert(iid); */
		
		$.ajax({
			url:"inquiry_passCheck.do?iid="+iid+"&pass="+pass,
			success:function(result){
					if(result == 'ok'){
						location.replace("admin_inquiry_content.do?iid="+iid);
					}else{
						$("#passCheckText").text("비밀번호가 틀렸습니다.").css("color","red");
						$("#inputPass").val("").focus();
						//alert("비밀번호가 틀렸습니다.");	 
					}				
				}
			}); 	
			
		}
 