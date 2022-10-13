<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>예약 목록</h2>
	<table border="1">
			<c:choose>
			<c:when test="${empty mlist}">
			<h3>등록된 방이 없습니다.</h3>
			
			</c:when>
			<c:otherwise>
			<tr>
				<th width="30px">USER ID</th>
				<th width="150px">ROOM NAME</th>
				<th width="150px">CHECK IN DATE</th>
				<th width="150px">CHECK OUT DATE</th>
				<th width="120px">PRICE</th>
				<th width="120px">예약번호</th>
				<th width="80px">취소</th>
			</tr>
			
			<c:forEach var="item" items="${mlist}"> 
			<tr>
				<td align="center">${item.mid}</td>
				<td align="center">${item.brname}</td>
				<td align="center">${item.radatestart}일</td>
				<td align="center">${item.radateend}일</td>
				<td align="center">${item.price}원</td>
				<td align="center">${item.booknum}</td>
				<td align="center"><input type="checkbox" name="mid" id="checkon" value="${item.mid}">
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</table>
	<button type="button" onclick="check()">취소</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/myroom.do?mid=${svo.mid}'">나의 예약목록 확인</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/book.do'">홈으로</button>
	
		</div>
</body>
</html>