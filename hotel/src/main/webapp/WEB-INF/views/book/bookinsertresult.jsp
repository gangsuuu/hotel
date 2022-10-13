<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	let result='${book_result}';
	
	if(result=="ok"){
		alert("예약이 완료되었습니다");
		location.href = "book.do";
	}
</script>
<title>Insert title here</title>
</head>
<body>

</body>
</html>