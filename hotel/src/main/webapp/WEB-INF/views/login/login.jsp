<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/login.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
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
</head>

<body>
	
<form name= "loginForm" action="loginCheck.do" method="post">
    <section>
        <div class="content">
            <div class="loginintro">
                <h1>로그인</h1>
                <p>신라스테이 광화문에 오신 것을 환영합니다.</p>
                <p>로그인을 하시고 더 편리하게 이용하세요.</p>
            </div>
            <div class="login-container">
                <div class="login-container-left">
                    <div class="login-type">
                        <div class="login-type-btns login-user-selected">
                            <a class="login-type-btn" href="">회원</a>
                        </div>
                      
                    </div>
                    <form>
                        <div>
                            <input type="text" id="mid" name="mid" class="login-input" placeholder="아이디를 입력해 주세요.">   
                            <input type="password" id="pass" name="pass" class="login-input" placeholder="비밀번호를 입력해 주세요.">    
                        </div>
                        <div>
                            <button type="submit" id="btnLogin" class="login-btn btn">로그인</button>
                        </div>
                        <div class="login-find-acount">
                            <a class="login-find-acount-link" href="search.do">아이디/비밀번호 찾기</a>
                        </div>
                    </form>
                </div>
                <div class="login-block">
                </div>
                <div class="login-container-right">
                    <div class="login-join-text">
                        <p>아직 회원이 아니신가요?</p>
                        <p>회원이 되시면 신라스테이 회원으로서</p>
                        <p>더 큰 혜택과 편리함을 누릴 수 있습니다.</p>
                    </div>
                    <div>
                        <a class="login-join-acount" href="joinstep.do">회원가입</a>
                    </div>
                </div>
            </div>
        </div>
        
    </section>
	

</form>

</body>