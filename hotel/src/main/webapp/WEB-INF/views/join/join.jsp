<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <title>Page Title</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/login.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
        <script>
        $(".join-getid").click(function(){
            let checked  = $("input[id=join-getid]:checked").val();
            if(checked == "on"){
                let id = $("input[name=mid]").val()
                $("input[name=hemail]").val(id);
                $(".join-getid-point").addClass("join-id-checked");
            }else{
                $("input[name=hemail]").val("");
                $(".join-getid-point").removeClass("join-id-checked");
            }
        })
    </script>
    <script>
$(document).ready(function(){
	
	//중복확인 버튼 이벤트 처리  AJAX 
	$("#idCheck").click(function(){
		
		if($("#mid").val() == ""){
			alert("아이디를 입력해주세요");
			$("#mid").focus();
		}else{
		
			$.ajax({
				url:"id_check.do?mid="+$("#mid").val(),
				success:function(result){  	
					if(result == 1){
						alert("사용중인 아이디입니다. 다시 입력해주세요")
						$("#mid").val("").focus();						
					}else{
						alert("사용 가능한 아이디 입니다.")		
						$("#pass").focus();
						
					}
				}//success
			});//ajax
		}//if 종료
	}); // click 함수
	}); //ready 함수

</script>

</head>
<body>
	<!-- Header Include -->
	<%@ include file="../header.jsp" %>

<form name="joinForm"  action="joinCheck.do"  method="post">
    <main>
        <article class="content">
            <div class="joinintro">
                <h1>회원가입</h1>
                <p>신라리워즈 멤버쉽 회원만을 위한</p>
                <p>다양한 혜택과 서비스를 누려보세요.</p>
            </div>
            <div class="join-container">
                <div class="join-container-inner">
                    <div class="join-acount-container">
                        <div class="join-intro-container">
                            <p class="join-input-list">아이디 및 비밀번호</p>
                            <p class="join-input-notice">*필수 입력항목</p>
                        </div>
                        <ul>
                            <li class="join-input-box">
                                <h2>아이디*</h2>
                                <input name="mid" id="mid" class="join-input input-type1 join-input-id">
                                <button type="button" id="idCheck" class="join-input join-idCheck">중복확인</button>
                                <span id="idCheckMsg"></span>
                                <p class="input-idcheck-msg"></p>
                            </li>
                        </ul>
                        <ul class="input-pass-container">
                            <li class="join-input-box">
                                <h2>비밀번호*</h2>
                                <input type="password" name="pass" id="pass" class="join-input input-type1 join-input-pass">
                            </li>
                            <li class="join-input-box">                 
                                <h2>비밀번호 확인*</h2>         
                                <input type="password" name="hpass" id="hpass" class="join-input  input-type1 join-input-passcheck">
                          		 <!--     <span id="passCheckMsg4"></span> --> 
                            </li>
                        </ul>
                    </div>
                    <div class="join-block"></div>
                    <div class="join-userinfo-container">
                        <div class="join-intro-container">
                            <p class="join-input-list">기본 정보</p>
                            <p class="join-input-notice">*필수 입력항목</p>
                        </div>
                        <div class="join-user-info">
                           <div class="join-userinfo-left">
                                <ul>
                                    <li class="join-input-box">
                                        <h2>이름(한글)*</h2>
                                        <input name="hname" id="hname" class="join-input join-input-name">
                                        
                                       <h2>성별*</h2>
                                        <select name="gender" id="gender" class="join-input join-input-gender" >
                                            <option value="default">선택</option>
                                            <option value="m">남자</option>
                                            <option value="w">여자</option>
                                        </select>
                                    </li>
                                    <li class="join-input-box">
                                        <h2>이메일*</h2>
                                        <input type="text" id="hemail" name="hemail" class="join-input input-type1 join-input-email">
                                    </li>
                                    <li class="join-input-box">
                                        <p>일부 도메인은 수신에 제한이 있을 수 있습니다.</p>
                                        <p>스팸메일함으로도 수신이 되지 않을 경우,다른 이메일을 사용하시기 바랍니다.</p>
                                        <input class="join-getid" id="join-getid"type="checkbox">
                                        <label class="btn" for="join-getid"><span class="join-getid-point "></span></label>
                                        <span>아이디와 동일</span>

                                    </li>
                                </ul>
                           </div>
                           <div class="join-userinfo-right">
                                <ul>
                                    <li class="join-input-box">
                                        <h2>이름(영문)*</h2>
                                        <input id= "ename1" name="ename1" class="join-input input-type2 join-input-fristname" placeholder="First Name(이름)">
                                        <input id= "ename2" name="ename2"class="join-input input-type2 join-input-lastname" placeholder="First Name(성)">
                                        
                                    </li>
                                    <li class="join-input-box">
                                        <h2>휴대폰 번호*</h2>
                                        <select name="hpum1" id="hpum1" class="join-input input-type4 join-input-firstnum">
                                          <option value="default">선택</option>
												<option value="010">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
										</select>
                            
                                        <input type="text" name="hpum2" id="hpum2" class="join-input input-type4 join-input-phone1"></input>

                                        <input type="text" name="hpum3" id="hpum3" class="join-input input-type4 join-input-phone2"></input>
                                    </li>
                                    <li class="join-input-box">
                                        <h2>주소</h2>
                                        <input type="text" name="zonecode" id="zonecode" class="join-input  join-input-zonecode">
                                        <button type="button" class="join-input join-addrbtn" id="btnSearchAddr">우편번호 검색</button>
                                        <input type="text" name="haddr1" id="haddr1" class="join-input input-type1 join-input-addr1">
                                        <input type="text" name="haddr2" id="haddr2" class="join-input input-type1 join-input-addr2">
                                    </li>
                                </ul>
                           </div>
                        </div>
                    </div>
                    <div class="join-block"></div>
                    <div class="join-submit-btn-container">
                        <button type="submit" class="join-submit-btn" id="btnJoin">확인</button>
                    </div>
                </div>
            </div>
        </article>

    </main>
</form>

	<!-- Footer Include -->
	<%@ include file="../footer.jsp" %>
	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(2).children().first().css("color","white");
 	</script> 
</body>
</html>