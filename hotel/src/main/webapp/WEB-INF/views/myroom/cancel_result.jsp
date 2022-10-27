<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	let result='${cancel_result}';
	
	if(result=="ok"){
		alert("예약취소가 완료되었습니다");
		location.href = "shillaStay.do";
	}
</script>
<body>

</body>
</html>