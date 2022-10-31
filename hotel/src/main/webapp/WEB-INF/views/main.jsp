<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<html>
<script type="text/javascript"> 
	 let insert_result= '${insert_result}';
	if(insert_result=="ok"){
		alert("등록이 완료되었습니다");
	} 
	
	function book(){
		var file1=$("#file1").val();
		var bprice=$("#bprice").val();
		var brname=$("#brname").val();
		
		if(!file1){
			alert("사진을 업로드 해주세요");
			return false;
		}else if(bprice==""){
			alert("금액을 입력해 주세요");
			return false;
		}else if(brname==""){
			alert("방 이름을 입력해 주세요");
			return false;
		}
		
		baskForm.submit();
	}
 </script>
<head>
	<title>호텔 방 입력</title>
</head>
<body>
<%@ include file="./header.jsp" %>
	<div align="center">
	<h2>호텔 방 입력</h2>
	<a href="http://localhost:9000/hotel/list.do">방 확인하기</a>
	<form name="baskForm" action="basketinsert.do" method="post" enctype="multipart/form-data">
	<table border="1">
			<tr>
				<!-- <th width="30px">ROOM ID</th> -->
				<th width="30px">ROOM IMAGE</th>
				<th width="50px">PRICE</th>
				<th>ROOMNAME</th>
				
			</tr>
			<tr>
				<!-- <td><input type="text" name="bid" id="bid"></td> -->
				<td align="center"><input type="file" name="file1" id="file1"></td>
				<td><input type="text" name="bprice" id="bprice"></td>
				<td><input type="text" name="brname" id="brname"></td>
			</tr>
			
			
			
	</table>
	<button type="button" onclick="book()">등록</button>
	</form>
	</div>
	<%@ include file="./footer.jsp" %>
</body>
</html>