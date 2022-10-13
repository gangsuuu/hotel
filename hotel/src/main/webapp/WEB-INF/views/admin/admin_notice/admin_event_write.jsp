<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/notice/resources/css/notice.css">
<script src="http://localhost:9000/notice/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/notice/resources/js/notice_jquery.js"></script>
<script>$('#ncontent').val().replace(/\n/g,"<br>")</script>
</head>
<body>
<div class="sub_title">
<div class="header"></div>

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
			<!-- 좌측 메뉴 -->
			 <%@ include file="./admin_left_bar.jsp" %>
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents" id="contents">
			 <h1>이벤트-글쓰기</h1>
		<form name="boardWriteForm" action="admin_notice_write_check.do" 
			method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="ntitle" id="ntitle">
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
					<textarea id ="ncontent" name="ncontent" rows="8" cols="60" )></textarea>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1">
				</li>
				<li>
					<button type="submit" class="btn_style" id="btnNoticeWrite">등록완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="admin_event_list.do">
						<button type="button" class="btn_style" >리스트</button></a>
					<!--<a href=""><button type="button" class="btn_style">관리자홈</button></a>-->
				</li>
			</ul>
		</form>
	</div>
<!-- footer Include -->
</body>
</html>