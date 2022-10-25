<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<!-- <script>
$(document).ready(function(){
	
	//페이징 리스트 출력
	var pager = jQuery('#ampaginationsm').pagination({
	
	    maxSize: 7,	    		// max page size
	    totals: '${dbCount}',	// total rows	
	    page: '${rpage}',		// initial page		
	    pageSize: '${pageSize}',	// max number items per page
	
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: '&laquo;',		
	    nextText: '&raquo;',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	//페이징 번호 클릭 시 이벤트 처리
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){		
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/mycgv/board_list.do?rpage="+e.page);         
    });
	
	});
</script>  -->
 
<head>
	<title>방 목록</title>
</head>
<body>
	<div align="center">
	<h2>방 목록</h2>
	
	<table border="1">
			<c:choose>
			<c:when test="${empty blist}">
			
			<h3>등록된 방이 없습니다.</h3>
			
			</c:when>
			<c:otherwise>
			<tr>
				<th width="30px">ROOM ID</th>
				<th width="30px">ROOM PICTURE</th>
				<th width="50px">PRICE</th>
				<th>ROOM NAME</th>
			</tr>
			
			<c:forEach var="item" items="${blist}"> 
			<tr>
				<td>${item.bid}</td>
				<td align="center"><a href="update.do?bid=${item.bid}"><img src="http://localhost:9000/hotel/resources/upload/${item.bsfile}" width="200"></a></td>
				<td>${item.bprice}</td>
				<td>${item.brname}</td>			
			</tr>
			</c:forEach>
			</c:otherwise>
			</c:choose>
	</table>
	<button type="submit">예약</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/delete.do'">삭제페이지 이동</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/theshilla.do'">홈으로</button>
	
	</div>4
	
</body>
</html>