<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/mypage.css">
</head>
<body>

<div class="content">
<div class="contain">
	
		<div class="container">
		
			<div class="lnbArea lnbAreaMypage">
			<div class="lnbMenu">
			<h2 class="tit">마이페이지</h2>
				<ul class="menu">
					<li class="m2">
						<a><span>예약 확인/취소</span></a>
						<ul class="sMenu">
							<li class="s1 first">
								<a href="">
									<span>객실/패키지/다이닝</span>
								</a>
							</li>	
						</ul>
					</li>
					<li class="m5 last">
						<a><span>내정보</span></a>
						<ul class="sMenu">
							<li class="s1 first">
								<a href="http://localhost:9000/hotel/memberupdate.do">
									<span>프로필 수정</span>
								</a>
							</li>
							<li class="s2">
								<a href="http://localhost:9000/hotel/passupdate.do">
									<span>비밀번호 변경</span>
								</a>
							</li>
							<li class="s3">
								<a href="">
									<span>문의 내역</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		</div>
		</div>
		</div>
</body>
</html>