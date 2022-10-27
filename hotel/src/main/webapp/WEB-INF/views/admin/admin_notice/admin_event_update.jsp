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

</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="content">
<div class="common_wrap_yy">
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
			<div class="content_lists">
				 <div class="content_inmenu">
					  <h2 class="suject">Admin</h2>
		              <ul>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_notice_list.do" class="content_list">공지사항</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_event_list.do" class="content_list content_selected">이벤트</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_inquiry_list.do" class="content_list ">고객센터</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list">객실관리</a></li>
		              </ul>
				 </div>
			 </div>	
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents">
				<div class="ctnInquires ctnCtUs">
					<div class="location">
						<p class="list">
							<span class="crPosit"></span>
							 admin > 이벤트 >
							<strong>이벤트 수정</strong>
						</p>
					</div>
					<div class="headTit">
						<h3 class="tit">이벤트 수정</h3>
						<div class="content-block"></div>
					</div>
				</div>
		<form name="boardUpdateForm" action="admin_notice_update_check.do" method="post"
		enctype ="multipart/form-data">
			<input type="hidden" name="nid" value="${vo.nid }">
			<input type="hidden" name="nfile" value="${vo.nfile }">
			<input type="hidden" name="nsfile" value="${vo.nsfile }">
			<div class="clear">
				<div class="admin-write-bottons">
					<button type="submit" class="btn_style" id="btnNoticeUpdate">수정완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="admin_event_content.do?nid=${vo.nid }"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="admin_event_list.do"><button type="button" class="btn_style">리스트</button></a>
				</div>	
				<table class="admin-notice-write-box">
					<tr>
						<th>
							<label>태그<label></label>
							</th>
						<td class="admin-notice-write-option">
							<select name="ntag" id="ntag">
								<option value="notice" >공지</option>
								<option value="event" selected>이벤트</option>
							</select>
						<td>
					</tr>
					<tr>
						<th>
							<label>제목</label>
						</th>
						<td class="admin-notice-write-title" >	
							<input type="text" name="ntitle" id="ntitle" value="${vo.ntitle }">	
						</td>
					</tr>
					<tr>
						<th><label>내용</label></th>
						<td>
							<textarea class="admin-notice-textarea" id="ntcwrite" name="ncontent">${vo.ncontent }</textarea>						
						</td>
					</tr>
					<tr>
						<th>
							<label>파일첨부</label>
						</th>
						<td class='admin-notice-write-file'>	
							<input type="file" name="file1" id="admin-notice-fileupload">
							<span id="upload_file">${vo.nfile }</span>	
						</td>
					</tr>
					<tr>
						<th>
							<label>파일미리보기</label>
						</th>
						<td class="admin_file_show">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</div>	
<%@ include file="../../footer.jsp" %>
</body>
</html>