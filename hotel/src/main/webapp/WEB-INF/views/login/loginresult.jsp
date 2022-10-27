<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	let result='${login_result}';
	

	if(result=="ok"){
		alert("로그인이 성공하셨습니다");
		if("${svo.mid}"=="admin"){
			location.href = "main.do";//관리자 페이지로 이동
		}else{
		location.href = "shillaStay.do";
		}
	}else if(result=="fail"){
		alert("아이디를 확인해주시길 바랍니다");
		location.href = "login.do";
	} 
</script>
<head>
<meta charset="UTF-8">
<title>로그인 처리 페이지</title>
</head>
<body>

</body>
</html>


