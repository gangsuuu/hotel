<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/hotel.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
<meta charset="UTF-8">

<script>
let join_result = '${join_result}';
let login_result = '${login_result}';
let auth_result = '${auth}';

if(auth_result == "fail"){
	alert("접근 권한이 없습니다. 로그인을 진행해 주세요.");
}

if(login_result == 'fail'){
	alert("아이디 또는 패스워드가 다릅니다. 다시 로그인해주세요");	
}

if(join_result == 'ok'){
	alert("회원가입에 성공하셨습니다.");
}

</script>

<!-- top -->

<section logincontain="" class="subcontain">
	<div topstyl="" logincontain="" class="sub-top-area forms">
		<div topstyl="" class="container">
			<h2 topstyl="">로그인</h2>				
		</div>
	</div>
</section>

<!-- main  -->	


	<form name= "loginForm" action="loginCheck.do" method="post">
		<div logincontain="" class="container small pddt">
			<div logincontain="" class="id-area">
				<div ct="" logincontain="" class="input-area" clearable="">
					<input ct="" id="hid" name="hid" autocomplete="on" placeholder="아이디를 입력해 주세요." maxlength="20" type="text" class="">
					
					<a ct="" href="" class=""></a>
					
				</div>
			</div>
			<div logincontain="" class="id-area">
				<div ct="" logincontain="" class="input-area">
					<input ct="" id="pass" name="pass" autocomplete="on" placeholder="비밀번호를 입력해 주세요." maxlength="14" type="password"
						class="">
				
				</div>
			</div>
			<div logincontain="" class="normal-area between">
				<div boxx="" logincontain="" class="check-area"></div>
				<div class="">
					<a logincontain="" href="search.do">아이디/비밀번호 찾기</a>
						
				</div>
			</div>
			<div logincontain="" class="normal-area mt40 btn-group">
				<div loginc="" logincontain="" class="btn_style">
					<button loginc="" type="submit" class="logincolor">로그인</button>
				</div>
				<div loginc="" logincontain="" class="btn_style">
					<button loginc="" type="button"
						onclick="location.href = 'http://localhost:9000/hotel/joinstep.do';"
						class="joincolor">회원이 아니신가요? 가입하기</button>



				</div>
			</div>
	</form>

</head>
</html>