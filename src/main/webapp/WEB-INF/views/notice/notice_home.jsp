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
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
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
	<!-- Header Include -->
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header_find_hotel.js"></script>
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="content">
		<h1>공지사항 링크</h1>	
		<section class="NoticeMain">
			<article><li><a href="http://localhost:9000/hotel/admin_notice_list.do">공지사항 관리</a></li></article><br>
			<article><li><a href="http://localhost:9000/hotel/admin_event_list.do">이벤트 관리</a></li></article><br><br>
			<article><li><a href="http://localhost:9000/hotel/notice_list.do">공지사항</a></li></article><br>
			<article><li><a href="http://localhost:9000/hotel/event_list.do">이벤트</a></li></article>
		</section>
	</div>
	
	<!-- footer Include -->
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/footer.js"></script>
</body>
</html>
