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

</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="noticepage">
<div class="common_wrap_yy" style="top: 0px;">
	<div class="common_inner">
		<div class="location" id="lnb"><ul>
		<li><a href="http://localhost:9000/hotel/shillaStay.do">메인페이지</a></li>
		<li><a href="http://localhost:9000/hotel/admin_event_list.do">이벤트</a></li>
		<li><a href="http://localhost:9000/hotel/admin_event_content.do?nid=${vo.nid }">글 상세보기</a></li>
		<li><a href="http://localhost:9000/hotel/admin_event_update.do?nid=${vo.nid }">수정하기</a></li>
		</ul>
		</div>
	</div>
</div>	

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
			<!-- 좌측 메뉴 -->
		<%@ include file="../../header.jsp" %>
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents">
		<h1>공지사항-수정하기</h1>
		<form name="boardUpdateForm" action="admin_notice_update_check.do" method="post"
		enctype ="multipart/form-data">
			<input type="hidden" name="nid" value="${vo.nid }">
			<input type="hidden" name="nfile" value="${vo.nfile }">
			<input type="hidden" name="nsfile" value="${vo.nsfile }">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="ntitle" id="ntitle" value="${vo.ntitle }">
				</li>
				<li>
					<label>태그</label>
					<select name="ntag" id="ntag">
						<option value="event">이벤트</option>
						<option value="notice">공지</option>
						</select>
				</li>
				<li>
					<label>내용</label>
					<textarea name="ncontent" rows="8" cols="60">${vo.ncontent }</textarea>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1">
					<span id="upload_file">${vo.nfile }</span>
				</li>
				<li>
					<button type="submit" class="btn_style" id="btnNoticeUpdate">수정완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="admin_event_content.do?nid=${vo.nid }"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="admin_event_list.do"><button type="button" class="btn_style">리스트</button></a>
				</li>
			</ul>
		</form>
			
	</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>