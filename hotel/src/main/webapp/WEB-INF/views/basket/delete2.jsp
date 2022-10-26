<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	 let delete_result='${result}';
	if(delete_result=="delete_ok"){
		alert("삭제가 완료되었습니다.");
		location.href = "main.do";
	} 


</script>
<head>
<meta charset="UTF-8">
<title>예약된 방 삭제하기</title>
</head>
<body>
	<div align="center">
	<h2>호텔 삭제하기</h2>
	<form name="baskdelete_result" action="delete_result.do" method="post">
	<table border="1">
			<c:choose>
			<c:when test="${empty blist}">
			
			<h3>등록된 방이 없습니다.</h3>
			
			</c:when>
			<c:otherwise>
			<tr>
				<th width="30px">ROOM PICTURE</th>
				<th width="50px">PRICE</th>
				<th>ROOM NAME</th>
				<th>선택</th>
			</tr>
			<c:forEach var="item" items="${blist}"> 
			<tr>
				
				<td align="center">	<img src="http://localhost:9000/hotel/resources/upload/${item.bsfile}" width="200"></td>
				<td>${item.bprice}</td>
				<td><input type="hidden" name="bsfile" value="${item.bsfile}"/> ${item.brname}</td>	
				<td><input type="radio" name="bid" id="bid" value="${item.bid}"/></td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</table>
	<c:choose>
		<c:when test="${empty blist}">
		</c:when>
		<c:otherwise>
		<button type="submit">삭제</button>
		</c:otherwise>
	</c:choose>
		<button type="button" onclick="location.href='http://localhost:9000/hotel/main.do'">홈으로</button>
	</form>
	</div>
	
</body>
</html>