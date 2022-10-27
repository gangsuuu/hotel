<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/login.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>

</head>

<body>
 <section>
        <div class="content">
            <div class="loginintro">
                <h1>아이디/비밀번호 찾기</h1>
                <p>아이디 혹은 비밀번호를 잊으셨나요?</p>
                <p>휴대폰이나 이메일 인증을 통해 찾으세요.</p>
            </div>
            <div class="findid-container">
                <div class="findid-container-left">
                    <div class="findid-label">
                        <p>아이디 찾기</p>
                    </div>
                    <form>
                        <div class="findid-inputs">
                            <input type="text" id="hname" name="hname" class="findid-input findid-name" placeholder="이름">   
                            <div class="findid-input-phone">
                                <select id="hpum1" name="hpum1" class="findid-input findid-phone-select">
                                    <option selected>선택</option>	
                                    	<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
                                </select>
                                <input id="hpum2" name="hpum2" class="findid-input findid-phone">
                                <input id="hpum3" name="hpum3" class="findid-input findid-phone">
                                <div class="findid-input-arrow"></div>
                            </div>
                        </div>
                        <div>
                            <button id="findid" type="button" class="findid-btn btn" >확인</button>
                        </div>
                    </form>
                </div>
                <div class="search-blocks">
                    <div class="search-block"></div>
                    <p>OR</p>
                    <div class="search-block"></div>
                </div>
                <div class="findid-container-right">
                    <div class="findpass-label">
                        <p>비밀번호 찾기</p>
                    </div>
                    <form>
                        <div class="findpass-inputs">
                            <input id="mid" name="mid" class="findpass-input findpass-name" placeholder="아이디">   
                            <div class="findpass-input-phone">
                                <input id="hemail" name="hemail"  placeholder="이메일" class="findpass-input findpass-email1">                    
                                <div class="findpass-input-arrow"></div>
                            </div>
                        </div>
                            <button id="findpw" type="button" class="findpass-btn btn" >임시패스워드 전송</button>
                    </form>
                </div>
            </div>
        </div>
        </section>
</body>
</html>