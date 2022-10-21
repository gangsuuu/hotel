<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>

<script>
	var hotelname = "theshilla";
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
						$("#idCheckMsg").text("사용중인 아이디입니다. 다시 입력해주세요")
						.css("color","red").css("font-size","10px").css("margin","5px 0 0 156px");
						$("#id").val("").focus();						
					}else{
						$("#idCheckMsg").text("사용 가능한 아이디 입니다.")
						.css("color","blue").css("font-size","10px").css("margin","5px 0 0 156px");
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
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header_find_hotel.js"></script>

<div class="content">
   <h1>회원가입</h1>
   <form name="joinForm"  action="joinCheck.do"  method="post">
      <ul>
         <li>
            <label>아이디</label>
            <input type="text" name="mid" id="mid" placeholder="*영문자숫자포함 8자이상">
            	<button type="button" class="btn_style" id="idCheck">중복확인</button>
            <span id="idCheckMsg"></span>
         </li>
         <li>
            <label>비밀번호</label>
            <input type="password" name="pass" id="pass">
         </li>
         <li>
            <label>비밀번호 확인</label>
            <input type="password" name="hpass" id="hpass">
            <span id="passCheckMsg">*비밀번호를 다시 입력해주세요</span>
         </li>
         <li>
            <label>성명</label>
            <input type="text" name="hname" id="hname">
         </li>
         <li>
            <label>이메일</label>
            <input type="text" name="hemail1" id="hemail1">@
            <input type="text" name="hemail2" id="hemail2">
            <select id="hemail3" >
               <option value="default">선택</option>
               <option value="naver.com">네이버</option>
               <option value="gmail.com">구글</option>
               <option value="daum.net">다음</option>
               <option value="self">직접입력</option>
            </select>
         </li>
         <li>
      			<label>주소</label>
					<input type="text" name="zonecode" id="zonecode" placeholder="우편번호">
					<input type="text" name="haddr1" id="haddr1">
					<button type="button" class="btn_style" id="btnSearchAddr">주소찾기</button>
				</li>
				<li>
					<label>상세주소</label>
					<input type="text" name="haddr2" id="haddr2">
				</li>
         <li>
            <label>휴대폰</label>
            <input type="radio" name="hp"><span>SKT</span>
            <input type="radio" name="hp"><span>LGU+</span>
            <input type="radio" name="hp"><span>KT</span>
            <select name="hpum1">
               <option value="default">선택</option>
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="016">016</option>
               <option value="017">017</option>
            </select>  
            <input type="text" name="hpum2" id="hpum2"> -
            <input type="text" name="hpum3" id="hpum3"> 
         </li>
         <li>
            <label>
               <button type="submit" class="btn_style" id="btnJoin">가입하기</button>
               <button type="reset" class="btn_style">다시입력</button>
            </label>
         </li>
      </ul>
   
   </form>
   </div>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/footer.js"></script>
</body>
</html>