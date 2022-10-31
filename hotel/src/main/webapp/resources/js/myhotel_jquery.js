$(document).ready(function(){
	 /*********************
      조인스텝 체크박스
   **********************/
   $("#btnJoinStep").click(()=>{   
      
      if($("input[name='noti01']:checked").length == 0){
         alert("홈페이지 이용약관을 동의해주세요.");
         return false;
      }else if($("input[name='noti02']:checked").length == 0){
         alert("신라스테이 리워즈 회원 이용약관을 동의해주세요.");
         return false;
      }else if($("input[name='noti03']:checked").length == 0){
         alert("개인정보수집 및 이용에 대한 동의를 동의해주세요.");
         return false;
      }else{
         
         $(location).attr("href","http://localhost:9000/hotel/join.do");
      }
    });
	
	/*******************
	 	프로필수정 
	**********************/
	$("#btnupdateC").click(()=>{
	 
		alert("회원정보가 수정되었습니다");
			memberUpdate.submit();
	});
	

	
	/*********************
			현재비밀번호,id 체크 AJAX 
	**********************/
	
	//현재비밀번호,id 체크 AJAX 
	$("#mbrpass").blur(function(){
		
		 
		
		if($("#mbrpass").val() != ""){
			
			$.ajax({
				url:"mbrpass_check.do?mid="+$("#mid").val()+"&pass="+$("#mbrpass").val(),
				success:function(result){  	
				// alert(result);
									 
				if(result == 1){
				alert("비밀번호가 동일합니다. 새로운 비밀번호를 입력해주세요");
						$("#mbrpass").after("<input type='midden' name='pass' value='"+$("#mbrpass").val()+"'>");
						$("#npass").val("").focus();						
					}else{
					alert("현재 비밀번호가 동일하지 않습니다.");
						$("#mbrpass").val("").focus();
						
					} 
				}//success
			});//ajax
		}//if 종료
	}); // click 함수
	
	/*********************
		새비밀번호, 새비밀번호 확인 비교
	**********************/
	$("#nhpass").on("blur",()=>{
		if($("#npass").val() != "" && $("#nhpass").val() != ""){
			if($("#npass").val() == $("#nhpass").val()){
				$("#passCheckMsg4").text("*비밀번호가 동일합니다.")
					.css("color","blue").css("font-size","12px");
			
			}else{
				$("#passCheckMsg4").text("*비밀번호가 동일하지 않습니다. 다시 입력해주세요.")
					.css("color","red").css("font-size","12px");

				$("#nhpass").val("");
				$("#npass").val("").focus();
			}
		}
	});
	/*********************
		새비밀번호파트 유효성 검사
	**********************/
	$("#btnpassupdate").click(()=>{	
	
	if($("#mbrpass").val() == ""){
			alert("현재 비밀번호를 입력해주세요");
			$("#mbrpass").focus();
			return false;
		}else if($("#npass").val() == ""){
			alert("새 비밀번호를 입력해주세요");
			$("#npass").focus();
			return false;
		}else if($("#nhpass").val() == ""){
			alert("새 비밀번호 확인을 입력해주세요");
			$("#nhpass").focus();
			return false;
		}else{	
			alert("비밀번호 수정이 완료되었습니다")
			passcheckupdate.submit();
		}
		
	});
	
	/*****************
		아이디 찾기
	*******************/
	
	$("#findid").click(function(){
		
		if($("#hname").val() == ""){
		alert("이름을 입력해주세요");
		$("hname").focus();
	
	}else if($("#hpum1").val() == ""){
		alert("휴대폰번호를 입력해주세요");
		$("#hpum1").focus();
	}else if($("#hpum2").val() == ""){
		alert("휴대폰번호를 입력해주세요");
		$("#hpum2").focus();
	}else if($("#hpum3").val() == ""){
		alert("휴대폰번호를 입력해주세요");
		$("#hpum3").focus();
	
		}else{
		 //아이디찾기
		 let hname=$("#hname").val();
		 let pnumber=$("#pnumber").val();
	
		 		$.ajax({
				url : "findid.do",
				type : "POST",
				data : {
					hname : $("#hname").val(),
					hpum1 : $("#hpum1").val(),
					hpum2 : $("#hpum2").val(),
					hpum3 : $("#hpum3").val()
				},
				success : function(result) {
					alert(result);
				},
			}); //ajax	
		}
	});

	
	/*********************
		비밀번호 찾기
	 **********************/
	$("#findpw").click(function(){
		if($("#mid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#mid").focus();
			
		}else if($("#hemail").val() == ""){
			alert("이메일을 입력해주세요");
			$("#hemail").focus();
		}else{
			//비밀번호 찾기
			let mid=$("#mid").val();
			let hemail=$("#hemail").val(); 
			
			$.ajax({
				url : "findpw.do",
				type : "POST",
				data : {
					mid : $("#mid").val(),
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
		
		if($("#mid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#mid").focus();
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
		}else if($("#ename1").val() == ""){
			alert("영문이름을 입력해주세요");
			$("#ename1").focus();
			return false;
		}else if($("#ename2").val() == ""){
			alert("영문이름을 입력해주세요");
			$("#ename2").focus();
			return false;
		}else if($("#gender").val() == "default"){
			alert("성별을 선택해주세요");
			$("#gender").focus();
			return false;
		}else if($("#hemail").val() == ""){
			alert("이메일을 입력해주세요");
			$("#hemail").focus();
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
		}else if($("#haddr1").val() == ""){
			alert("주소를 입력해주세요");
			$("#haddr1").focus();
			return false;
		}else if($("#haddr2").val() == ""){
			alert("상세주소를 입력해주세요");
			$("#haddr2").focus();
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
				$("#passCheckMsg4").alert("비밀번호가 동일합니다.");
					
			}else{
				$("#passCheckMsg4").alert("비밀번호가 동일하지 않습니다. 다시 입력해주세요.");
					
				$("#hpass").val("");
				$("#pass").val("").focus();
			}
		}//else{} --> 회원가입 폼의 유효성 체크로 진행됨
	});
	
	
	
	/*********************
		로그인폼 체크 함수
	**********************/
	$("#btnLogin").click(()=>{
		if($("#mid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#mid").focus();
			return false;
		}else if($("#pass").val() == ""){
			alert("패스워드를 입력해주세요");
			$("#pass").focus();
			return false;
		}else{
			//서버전송
			loginForm.submit();
		}
	});

});//ready function

	












