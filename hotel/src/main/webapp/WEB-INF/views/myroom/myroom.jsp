<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>방 목록</h2>
	<table border="1">
			<c:choose>
			<c:when test="${empty mlist}">
			
			<h3>등록된 방이 없습니다.</h3>
			
			</c:when>
			<c:otherwise>
			<tr>
				<th width="30px">ROOM PICTURE</th>
				<th width="150px">ROOM NAME</th>
				<th width="50px">PRICE</th>
				<th>RESERVATION</th>
			</tr>
			
			<c:forEach var="item" items="${mlist}"> 
			<tr>
				<td align="center"><img src="http://localhost:9000/hotel/resources/upload/${item.mid}" width="200"></a></td>
				<td>${item.bid}</td>
				<td>${item.radatestart}</td>
				<td>${item.radateend}</td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</table>
	<button type="submit">예약</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/myroom.do?mid=${svo.mid}'">나의 예약목록 확인</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/main.do'">홈으로</button>
	
		</div>
</body>
</html>