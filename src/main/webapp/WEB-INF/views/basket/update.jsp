<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	 let update_result='${result}';
	if(update_result=="update_ok"){
		alert("업데이트가 완료되었습니다.");
		location.href = "main.do";
	} 


</script>
<style>
	#upload_file {
		/*border:1px solid red;*/
		position:relative;
		left:45px; top:0px;
		width:150px;  height:20px;
		display:inline-block;	
		background-color:white;	
		font-size:12px;
	}
</style>
<head>
<meta charset="UTF-8">
<title>룸 업데이트</title>
</head>
<body>
	<div align="center">
	<h2>룸 업데이트</h2>
	<form name="baskdelete_result" action="update_excute.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="bid" value="${vo.bid}">
	<input type="hidden" name="bsfile" value="${vo.bfile}">
	<input type="hidden" name="bsfile" value="${vo.bsfile}">
	<table border="1">
			<c:choose>
			<c:when test="${empty vo}">
			<h3>등록된 방이 없습니다.</h3>
			</c:when>
			<c:otherwise>
			<tr>
				<th width="30px">ROOM PICTURE</th>
				<th width="50px">PRICE</th>
				<th>ROOM NAME</th>
			</tr>
			
			<tr>
				
				<td align="center">	 <input type="file" name="file1">
				<span id="upload_file">${vo.bfile }</span>
				</td>
				<td><input type="text" name="bprice" value="${vo.bprice }"></td>
				<td><input type="text" name="brname" value="${vo.brname }"/> </td>	
			</tr>
			</c:otherwise>
			</c:choose>
	</table>
		<button type="submit">수정</button>
		<button type="button" onclick="location.href='http://localhost:9000/hotel/main.do'">홈으로</button>
	</form>
	</div>
	
</body>
</html>