<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!--  세션 넘겨주는 {svo.mid} ex -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/mypage.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
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
		 	
    <!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->
	
	<div class="contents" id="contents">


<input type="hidden" name="resvId" id="resvId" value="" autocomplete="off">
<input type="hidden" name="legNumber" id="legNumber" value="" autocomplete="off"><div class="contents" id="contents">
	<div class="ctnMpage">
		<div class="location">
			<p class="list">
				<span class="crPosit">
				현재 페이지 위치 : </span> &gt; 
				마이페이지 &gt; 
				<strong>신라리워즈 등급 및 포인트</strong>
			</p>
		</div>
		<div class="myAccountTit">
			<h3 class="tit">
				신라리워즈 등급 및 포인트</h3>
		</div>
		
		
		<div class="account">
			
			    
				<div class="userInfoList1 fl">
					
					<c:if test="${sessionScope.svo != null}">
				<span>[${sessionScope.svo.mid}]님 반갑습니다.</span>
					</c:if>
				</div>
		
			</div>
			
			<div class="userInfoTopBoxTit clearfix">
				<div class="fr">
					<a href="http://localhost:9000/hotel/membershipoffer.do" title="등급별 혜택보기" class="linkTxt">
						등급별 혜택보기</a>
				</div>
			</div>
			 <div class="img2">
			<img src="http://localhost:9000/hotel/resources/img/mypagerank.PNG">
			</div>
			<!-- 등급별 혜택보기 -->
		
				
			</div>
		</div>
	</div>
</div>

<div id="reserveNotice" style="display:none"></div>

</div>

		</div>
	
	</div>

</body>
</html>
