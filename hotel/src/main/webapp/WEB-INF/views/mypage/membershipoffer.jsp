<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/mypage.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	
<body>

	<!---------------------------------------------->
	<!--------------- MenuBar ---------------------->
	<!---------------------------------------------->
	
	<div class="content">
		<div class="content_lists">
			 <div class="content_inmenu">
				  <h2 class="suject">마이페이지</h2>
	              <ul>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/mupdate.do?mid=${svo.mid}" class="content_list">프로필 수정</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/passupdate.do" class="content_list">비밀번호 변경</a></li>
	              </ul>
			 </div>
		 </div>	
<form name= "membershipoffer"  method="post">
	
			
			
		 <div class="ss">
			<img src="http://localhost:9000/hotel/resources/image/memberS.png"
				style="position: relative; left: 543px; height: 1032px; width: 893px; top: -1185px; border: 3px solid #73AD21;">

		</div>
 </form>
</body>
</html>