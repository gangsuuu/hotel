<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hotel login</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/mycgv_jquery.js"></script>
<script>
	let join_result = '${join_result}';
	let login_result = '${login_result}';
	let auth_result = '${auth}';
	
	if(auth_result == 'fail'){
		alert("접근 권한이 없습니다! 관리자로 로그인 해주세요.");
	}
	
	if(login_result == 'fail'){
		alert("아이디 또는 패스워드가 다릅니다. 다시 로그인해주세요");	
	}
	
	if(join_result == 'ok'){
		alert("회원가입에 성공하셨습니다.");
	}
	
	$(document).ready(function(){
		$("#btnLogin").click(()=>{
			if($("#id").val() == ""){
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return false;
			}else if($("#pass").val() == ""){
				alert("패스워드를 입력해주세요");
				$("#pass").focus();
				return false;
			}else{
				//서버전송
				loginForm.submit();
			}
		});//click
		
	});//ready
	
	
</script>
</head>
<body>
<%-- 여기서 el태그 사용이 안됨. mv로 받아서 가져와야함 auth====>>> ${auth} --%>
auth====>>> ${auth}
	<!-- Header Include -->
	<iframe></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
	 <h1>Login</h1>
		<form name="loginForm" action="loginCheck.do" method="post">
		<ul>
			<li>
				<label>아이디</label>
				<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
			</li>
			<li>
				<button type="button" id="btnLogin">로그인</button>
			</li>
		</ul>
		</form>
	</div>
	
	<!-- footer Include -->
	<iframe src="hotel_footer.do" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







