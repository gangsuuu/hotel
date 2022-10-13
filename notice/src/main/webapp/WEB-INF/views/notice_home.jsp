<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/notice/resources/css/notice.css">
<link rel="stylesheet" href="http://localhost:9000/notice/resources/css/am-pagination.css">
<script src="http://localhost:9000/notice/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/notice/resources/js/am-pagination.js"></script>
</head>
<body>
	<!-- Header Include -->
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>공지사항 링크</h1>	
		<section class="NoticeMain">
			<article><li><a href="http://localhost:9000/notice/admin_notice_list.do">공지사항 관리</a></li></article><br>
			<article><li><a href="http://localhost:9000/notice/admin_event_list.do">이벤트 관리</a></li></article><br><br>
			<article><li><a href="http://localhost:9000/notice/notice_list.do">공지사항</a></li></article><br>
			<article><li><a href="http://localhost:9000/notice/event_list.do">이벤트</a></li></article>
		</section>
	</div>
	
	<!-- footer Include -->
	
</body>
</html>
