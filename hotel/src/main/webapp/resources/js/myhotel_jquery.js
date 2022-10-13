$(document).ready(function(){
	
	/*********************
		비밀번호 찾기
	 **********************/
	$("#findpw").click(function(){
		if($("#hid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#hid").focus();
			
		}else if($("#hemail").val() == ""){
			alert("이메일을 입력해주세요");
			$("#hemail").focus();
		}else{
			//비밀번호 찾기
			let hid=$("#hid").val();
			let hemail=$("#hemail").val(); 
			
			$.ajax({
				url : "findpw.do",
				type : "POST",
				data : {
					hid : $("#hid").val(),
					hemail : $("#hemail").val()
				},
				success : function(result) {
					alert(result);
				},
			}); //ajax
		}
		});
	
	/*********************
		회원가입 - 주소찾기
	 **********************/
	$("#btnSearchAddr").click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	           
	            $("#zonecode").val(data.zonecode);
	            $("#haddr1").val(data.address);
	            $("#haddr2").focus();
	        }
	    }).open(); 
	});
	/*********************
		회원가입 폼 유효성 체크 --> 서버의 효율성을 높이기위함:부하를 줄임
	**********************/
	$("#btnJoin").click(()=>{		
		
		if($("#hid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#hid").focus();
			return false;
		}else if($("#pass").val() == ""){
			alert("패스워드를 입력해주세요");
			$("#pass").focus();
			return false;
		}else if($("#hpass").val() == ""){
			alert("패스워드 확인을 입력해주세요");
			$("#hpass").focus();
			return false;
		}else if($("#hname").val() == ""){
			alert("성명을 입력해주세요");
			$("#hname").focus();
			return false;
		}else if($("#hemail1").val() == ""){
			alert("이메일을 입력해주세요");
			$("#hemail1").focus();
			return false;
		}else if($("#hemail2").val() == ""){
			alert("이메일 주소를 선택해주세요");
			$("#hemail3").focus();
			return false;
		}else if($("#haddr1").val() == ""){
			alert("주소를 입력해주세요");
			$("#haddr1").focus();
			return false;
		}else if($("#haddr2").val() == ""){
			alert("상세주소를 입력해주세요");
			$("#haddr2").focus();
			return false;
	 	}else if($("input[name='hp']:checked").length == 0){
			alert("통신사를 선택해주세요");
			return false;			
		}else if($("#hpum1").val() == "default"){
			alert("휴대폰번호를 선택해주세요");
			$("#hpum1").focus();
			return false;
		}else if($("#hpum2").val() == ""){
			alert("휴대폰번호를 입력해주세요");
			$("#hpum2").focus();
			return false;
		}else if($("#hpum3").val() == ""){
			alert("마지막 번호를 입력해주세요");
			$("#hpum3").focus();
			return false;
		}else{
			//서버전송
			joinForm.submit();
		}
		
	});
	/*********************
		이메일 주소 선택
	**********************/
	$("#hemail3").change(()=>{
		if($("#hemail3").val() == "default"){
			alert("이메일 주소를 선택해주세요");
			$("#hemail3").focus();
			$("#hemail2").val("");
		}else if($("#hemail3").val() == "self"){
			$("#hemail2").val("").focus();
		}else{
			$("#hemail2").val($("#hemail3").val());
		}	
	});		
	
	
	/*********************
		비밀번호, 비밀번호 확인 비교
	**********************/
	$("#hpass").on("blur",()=>{
		if($("#pass").val() != "" && $("#hpass").val() != ""){
			if($("#pass").val() == $("#hpass").val()){
				$("#passCheckMsg").text("*비밀번호가 동일합니다.")
					.css("color","blue").css("font-size","12px");
			
			}else{
				$("#passCheckMsg").text("*비밀번호가 동일하지 않습니다. 다시 입력해주세요.")
					.css("color","red").css("font-size","12px");

				$("#hpass").val("");
				$("#pass").val("").focus();
			}
		}//else{} --> 회원가입 폼의 유효성 체크로 진행됨
	});
	
	
	
	/*********************
		로그인폼 체크 함수
	**********************/
	$("#btnLogin").click(()=>{
		if($("#hid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#hid").focus();
			return false;
		}else if($("#hpass").val() == ""){
			alert("패스워드를 입력해주세요");
			$("#hpass").focus();
			return false;
		}else{
			//서버전송
			loginForm.submit();
		}
	});

});//ready function

	












