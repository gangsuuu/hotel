<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항상 즐거움이 있는 SHILLA STAY!</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/notice.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/inquiry.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<style>
footer{
margin-top:300px;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp" %>
<div class="content">
<div class="common_wrap_yy">
	<div class="common_inner">
		<div class="location" id="lnb"><ul>
		<li><a href="http://localhost:9000/hotel/shillaStay.do">메인페이지</a></li>
		<li><a href="http://localhost:9000/hotel/notice_list.do">공지사항</a></li>
		<li><a href="http://localhost:9000/hotel/notice_content.do?nid=${vo.nid }">글 상세보기</a></li>
		</ul>
		</div>
	</div>
</div>

	<!-------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
			<!-- 좌측 메뉴 -->
			<div class="content_lists">
				 <div class="content_inmenu">
					  <h2 class="suject">고객서비스</h2>
		              <ul>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/introhotel.do" class="content_list">호텔안내</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/viewGuestService.do" class="content_list">인근명소</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list content_selected" >공지사항</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_list.do" class="content_list ">고객센터</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_my_list.do?mid=${sessionScope.svo.mid }" class="content_list_two"> - 내문의함</a></li>
		              </ul>
				 </div>
			 </div>
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents">
				<div class="ctnInquires ctnCtUs">
					<div class="sub_title">
						<h2>공지사항</h2>
						<p>Notice</p>
						<span>항상 즐거움이 있는 곳! 신라 호텔</span>
					</div>
					<div class="location">
						<p class="list">
							<span class="crPosit"></span>
							 고객서비스 > 공지사항 >
							<strong>content</strong>
						</p>
					</div>
					<div class="headTit">
						<h3 class="tit">공지사항</h3>
						<div class="content-block"></div>
					</div>
				</div>
				
				<div class="clear">
				<div class="admin-write-bottons">
					<a href="event_list.do">
						<button type="button" class="btn_style">리스트</button>
					</a>
				</div>
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
		</table>	
	</div>
</div>	
	<%@ include file="../footer.jsp" %>
</body>
</html>