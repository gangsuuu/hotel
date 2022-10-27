<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항상 즐거움이 있는 SHILLA STAY!</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/notice.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
	var hotelname = "theshilla";
</script>
<style>
footer{
margin-top:300px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
<div class="common_wrap_yy" style="top: 0px;">
	<div class="common_inner">
		<div class="location" id="lnb"><ul>
		<li><a href="http://localhost:9000/hotel/shillaStay.do">메인페이지</a></li>
		<li><a href="http://localhost:9000/hotel/event_list.do">이벤트</a></li>
		<li><a href="http://localhost:9000/hotel/event_content.do?nid=${vo.nid }">글 상세보기</a></li>
		</ul>
		</div>
	</div>
</div>
<div class="noticepage">

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
				<!-- 좌측 메뉴 -->
			<%@ include file="./left_bar.jsp" %>
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents">
		<div class="sub_title">
					<h2>이벤트</h2>
					<p>Event</p>
				<span>항상 즐거움이 있는 곳! 신라 호텔</span>
					</div>
		<table class="boardContent">	
			<tr>				
				<th>태그</th>
				<td>${vo.ntag }</td>
				<th>등록일자</th>
				<td>${vo.ndate }</td>
				<th>조회수</th>
				<td colspan="2">${vo.nhits }</td>
			</tr>		
			<tr>				
				<th>제목</th>
				<td colspan="6">${vo.ntitle }</td>
			</tr>
			<tr>				
				<td colspan="6">
				<div>
				<c:if test="${vo.nsfile != null}">
					<img src="http://localhost:9000/hotel/resources/upload/${vo.nsfile }">
				</c:if>
				<br><br>
				${vo.ncontent }
				<br><br></td>
				</div>
			</tr>
			<tr>
				<td colspan="6">
					<a href="event_list.do">
						<button type="button" class="btn_style">리스트</button></a>
				<!-- 	<a href=""><button type="button" class="btn_style">관리자홈</button></a> -->
				</td>
			</tr>			
		</table>	
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>