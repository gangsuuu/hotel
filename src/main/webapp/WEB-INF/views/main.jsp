<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>

<script type="text/javascript"> 
	

	let insert_result= '${insert_result}';
	if(insert_result=="ok"){
		alert("등록이 완료되었습니다");
	}
 
 </script>
<head>
	<title>호텔 방 입력</title>
</head>
<body>
	<div align="center">
	<h2>호텔 방 입력</h2>
	<a href="http://localhost:9000/hotel/list.do">방 확인하기</a>
	<form name="baskForm" action="basketinsert.do" method="post" enctype="multipart/form-data">
	<table border="1">
			<tr>
				<th width="30px">ROOM ID</th>
				<th width="30px">ROOM IMAGE</th>
				<th width="50px">PRICE</th>
				<th>ROOMNAME</th>
				
			</tr>
			<tr>
				<td><input type="text" name="bid" id="bid"></td>
				<td align="center"><input type="file" name="file1"></td>
				<td><input type="text" name="bprice" id="bprice"></td>
				<td><input type="text" name="brname" id="brname"></td>
				<td>			
			</tr>
			
			
			
	</table>
	<button type="submit">등록</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/theshilla.do'">홈으로</button>
	</form>
	</div>
	
</body>
</html>