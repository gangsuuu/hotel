/*********************
	회원가입 폼 유효성 체크 --> 서버의 효율성을 높이기위함:부하를 줄임
**********************/
joinCheck = () => {
	const hid = document.getElementById("hid");
	const pass = document.getElementById("pass");
	const hpass = document.getElementById("hpass");
	const hname = document.getElementById("hname");
	const hemail1 = document.getElementById("hemail1");
	const hemail2 = document.getElementById("hemail2");
	const hemail3 = document.getElementById("hemail3");
	const haddr1 = document.getElementById("haddr1");s
	const haddr2 = document.getElementById("haddr2");
	const hpum1 = document.getElementById("hpum1");
	const hpum2 = document.getElementById("hpum2");
	const hpum3 = document.getElementById("hpum3");
	
	if(hid.value == ""){
		alert("아이디를 입력해주세요");
		hid.focus();
		return false;
	}else if(pass.value == ""){
		alert("패스워드를 입력해주세요");
		pass.focus();
		return false;
	}else if(hpass.value == ""){
		alert("패스워드 확인을 입력해주세요");
		hpass.focus();
		return false;
	}else if(hname.value == ""){
		alert("성명을 입력해주세요");
		hname.focus();
		return false;
	}else if(hemail1.value == ""){
		alert("이메일을 입력해주세요");
		hemail1.focus();
		return false;
	}else if(hemail2.value == ""){
		alert("이메일 주소를 선택해주세요");
		hemail3.focus();
		return false;
	}else if(haddr1.value == ""){
		alert("주소를 입력해주세요");
		haddr1.focus();
		return false;
	}else if(haddr2.value == ""){
		alert("상세주소를 입력해주세요");
		haddr2.focus();
		return false;
	}else if(checkCount("hp") == 0){
		alert("통신사를 선택해주세요");
		return false;
	}else if(hpum1.value == "default"){
		alert("폰번호를 선택해주세요");
		hpum1.focus();
		return false;
	}else if(hpum2.value == ""){
		alert("폰번호를 입력해주세요");
		hpum2.focus();
		return false;
	}else if(hpum3.value == ""){
		alert("마지막 폰번호를 입력해주세요");
		hpum3.focus();
		return false;
	}else{
		//서버전송
		joinForm.submit();
	}
	
}


/*********************
	radio, checkbox --> checked 결과를 count로 체크
**********************/
//function checkCount(fname){
checkCount = (fname) => {
	const fnameList = document.getElementsByName(fname);
	let count = 0;
	
	for(element of fnameList){
		if(element.checked){
			count++;
		}
	}
	return count;
}


/*********************
	이메일 주소 선택
**********************/
//function emailCheck(){
emailCheck = () => {
	const hemail2 = document.getElementById("hemail2");
	const hemail3 = document.getElementById("hemail3");
	
	if(hemail3.value == "default"){
		alert("이메일 주소를 선택해주세요");
		hemail3.focus();
		hemail2.value = "";
	}else if(hemail3.value == "self"){
		hemail2.value = "";
		hemail2.focus();
	}else{
		hemail2.value = hemail3.value;
	}	
}




/*********************
	비밀번호, 비밀번호 확인 비교
**********************/
//function passCheck(){
passCheck = () =>{
	const pass = document.getElementById("pass");
	const hpass = document.getElementById("hpass");
	const msg = document.getElementById("passCheckMsg");
	
	//pass와 hpass가 비어있지 않은상태에서만 비교!!
	if(pass.value != "" && hpass.value != ""){
		if(pass.value == hpass.value){
			msg.innerHTML = "*비밀번호가 동일합니다.";
			msg.style.color = "blue";
			msg.style.fontSize = "12px";
			
		}else{
			msg.innerHTML = "*비밀번호가 동일하지 않습니다. 다시 입력해주세요.";
			msg.style.color = "red";
			msg.style.fontSize = "12px";
			pass.value = "";
			hpass.value = "";
			pass.focus();
		}
	}//else{} --> 회원가입 폼의 유효성 체크로 진행됨
}




/*********************
	로그인폼 체크 함수
**********************/
//function loginCheck(){
loginCheck = () => {  //arrow function:ES6
	const hid = document.getElementById("hid");
	const pass = document.getElementById("pass");
	
	if(hid.value == ""){
		alert("아이디를 입력해주세요");
		hid.focus();
		return false;
	}else if(pass.value == ""){
		alert("패스워드를 입력해주세요");
		pass.focus();
		return false;
	}else{
		//서버전송
		loginForm.submit();
	}
	
}//loginCheck()
