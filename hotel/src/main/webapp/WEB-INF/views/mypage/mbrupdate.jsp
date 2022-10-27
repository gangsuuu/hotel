<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/update.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="memberUpdate"  action="memberUpdatecheck.do"  method="post">
	<%@ include file="./left_bar.jsp" %>
<div class="contents" id="contents">
			<div class="ctnMypage2">
				<div class="location">
					<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; 마이페이지 &gt; 내정보 &gt; <strong>프로필 수정</strong></p>
				</div>
				
				<div class="myProfilemodifyTit">
					<h4 class="tit">프로필 수정</h4>
				</div>
				
				<div class="msg">고객님의 정보를 언제든지 확인, 변경하실 수 있습니다.</div>
				
				<div class="hTitS">
						<h5 class="tit">기본정보</h5>
				</div>
					<table class="tableTypeA tableJoinForm tableUserInfo2" border="1">
						<caption>프로필 수정</caption>
					<colgroup>
						<col width="13%" class="col1">
						<col class="col2">
					</colgroup>
					
					<tbody><tr class="first">
						<th scope="row" class="first">성명(국문)</th>
						<td class="first">			
							<span class="name">
							${vo.hname}</span>  
	
						</td>
					</tr>
					
					<tr>
						<th scope="row">성명(영문)</th>
						<td>
							${vo.ename} &nbsp;</td>
					</tr>
					
					<tr>
						<th scope="row">아이디</th>
						<td>
						${vo.mid} </td>
					</tr>

					<tr>
						<th scope="row">이메일 </th>
						<td>
							<label class="emailId" for="email1"></label>
							<input id="hemail" name="hemail" class="emailId uiform text" type="text" value="${vo.hemail}"  >
								<input id="mid" name="mid" type="hidden" value="${vo.mid}"  >
			
							</td>
					</tr>
					<tr>
						<th scope="row">휴대전화 </th>
						<td>
							<input type="text" class="uiform phoneNum3 text"  id="pnumber" name="pnumber" value="${vo.pnumber}">
							</td>
					</tr>
					
               
                   </tbody>
                   </table>
				
				<div class="btnList">
						<button type="button" id="btnupdateC" class="btnChange"><span>수정</span></button>
						<button  type="button" class="btnCancel" onclick="location.href = 'http://localhost:9000/hotel/mypage.do';" ><span>취소</span></button>
				</div>
			</div>
		</div>
		</form>
</body>
</html>