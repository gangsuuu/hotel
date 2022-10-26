<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항상 즐거움이 있는 SHILLA STAY!</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/notice.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/notice_jquery.js"></script>
</head>
<body>
<%@ include file="../../header.jsp" %>>
<div class="common_wrap_yy" style="top: 0px;">
	<div class="common_inner">
		<div class="location" id="lnb"><ul>
		<li><a href="http://localhost:9000/hotel/shillaStay.do">메인페이지</a></li>
		<li><a href="http://localhost:9000/hotel/admin_notice_list.do">공지사항</a></li>
		<li><a href="http://localhost:9000/hotel/admin_notice_write.do">글쓰기</a></li>
		</ul>
		</div>
	</div>
</div>	
<div class="noticepage">

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
			<!-- 좌측 메뉴 -->
			 <%@ include file="./admin_left_bar.jsp" %>
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents" id="contents">
			 <div class="sub_title">
					<h2>공지사항</h2>
					<p>Notice</p>
				<span>항상 즐거움이 있는 곳! 신라 호텔</span>
					</div>
					<div class="writeContent">
		<form name="boardWriteForm" action="admin_notice_write_check.do" 
			method="post" enctype="multipart/form-data">
			<div class="clear">
			
	
				<div class="tag_box">
				
					<ul class="write_infobox">
					<li>
					<label>태그</label>
					<select name="ntag" id="ntag">
						<option value="notice">공지</option>
						<option value="event">이벤트</option>
						</select>
				</li>
				<li>
					<label>파일첨부</label>
					<input type="file" name="file1">
				</li>
				<li>
					<label>제목</label>
					<input type="text" name="ntitle" id="ntitle" style="width:540px;">
				</li>
					</ul>
				</div>

			<div class="write_infobox">
				<p>쉬운 비밀번호를 입력하면 타인의 수정, 삭제가 쉽습니다.</p>
				<p>음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.</p>
	
			</div>
			<ul class="write_clear">
				<label>내용</label>
				<li>		
					<textarea id="ntcwrite" name="ncontent" rows="12" cols="80"></textarea>
				</li>
				<li></li>
				<li id="ntcwrite_button">
					<button type="submit" class="btn_style" id="btnNoticeWrite">등록완료</button>
					<button type="reset" class="btn_style">다시쓰기</button>
					<a href="admin_notice_list.do">
						<button type="button" class="btn_style">리스트</button></a>
					<!--<a href=""><button type="button" class="btn_style">관리자홈</button></a>-->
				</li>
			</ul>
			
		</div>
		</form>
		</div>
	</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>