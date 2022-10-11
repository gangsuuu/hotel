<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/notice/resources/css/notice.css">
</head>
<body>
	<!---------------------------------------------->
	<!--------------- Admin_leftbar----------------->
	<!---------------------------------------------->
			 <div class="menu_list">
			 	<div class="menu_list_inner">
			 		<div id="menu_name">
			 		<h3 class="menu_list_name">공지사항</h3>
			 		</div>
			 		<ul class="menu">
			 			<li class="m1">
			 				<a href="http://localhost:9000/notice/admin_notice_list.do" target="_parent">
			 					<span>공지사항	</span>
			 				</a>
			 			</li>
			 			<li class="m1">
			 				<a href="http://localhost:9000/notice/admin_event_list.do" target="_parent">
			 					<span>이벤트	</span>
			 				</a>
			 			</li>
			 			<li class="m1">
			 				<a href="http://localhost:9000/notice/notice_list.do" target="_parent">
			 					<span>일반 공지사항</span>
			 				</a>
			 			</li>	
			 			<li class="m1">
			 				<a href="" target="_parent">
			 					<span>메뉴 추가</span>
			 				</a>
			 			</li>	
			 		</ul>
			 	</div>
			 </div>
</body>
</html>