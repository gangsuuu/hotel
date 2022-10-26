<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js"></script> 
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function reservation(){
		var isCheck = $('input[name=bid]:checked').val();
		if(!isCheck){
			alert("예약하실 방을 체크해 주세요");
			window.location.reload(true);
		}else{
    		book.action="bookinsert.do";
    		book.method="post";
    		book.submit();
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
<form name="book" action="bookinsert.do" method="POST">
	<input type="hidden" name=mid value="${svo.mid}"/>
	<div align="center">
		<h2>방 목록</h2>
	<table border="1">
			<c:choose>
			<c:when test="${empty basketlist}">
			
			<h3>등록된 방이 없습니다.</h3>
			
			</c:when>
			<c:otherwise>
			<tr>
				<th width="30px">ROOM PICTURE</th>
				<th width="150px">ROOM NAME</th>
				<th width="50px">PRICE</th>
				<th>RESERVATION</th>
			</tr>
			
			<c:forEach var="item" items="${basketlist}"> 
			<tr>
				<td align="center"><img src="http://localhost:9000/hotel/resources/upload/${item.bsfile}" width="200"></a></td>
				<td>${item.brname}</td>
				<td>${item.bprice}</td>
				<td><input type="radio" name="bid" id="bid" value="${item.bid }"/></td>
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</table>
	<button type="button" onclick="reservation();">예약</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/myroom.do?mid=${svo.mid}'">나의 예약목록 확인</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/main.do'">홈으로</button>
	
		</div>
	</form>
</body>
</html>