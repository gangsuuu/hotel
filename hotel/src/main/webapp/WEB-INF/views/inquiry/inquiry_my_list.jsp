<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Inquiry</title>
<script>
	$(document).ready(function(){
	
		//문의글 검색
		var search="${search}";
		
		if(search == "search"){
				$(".search_list").val("${searchlist}").prop("selected", true);
			}else{
				$(".search_list").val("title").prop("selected", true);
			}
			
		$("#btnSearch").click(function(){
			if($("#searchName").val()==""){
				alert("내용을 입력해 주세요.");
				$("#searchName").focus();
			}else{
				list_search.submit();
			}
		
		});//click	
		
	
	});//ready
</script>
</head>
<body>
	<!-- Header Include -->
	<iframe></iframe>

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->
	
	<!-- 내문의함은 회원가입한 id값 받아와서 해야해서 틀만 잡음 -->
	<div class="contain">
		<div class="container">
			<div class="InArea MenuBar">
				<div class="MenuBar">
					<h2 class="">고객문의</h2>
						<ul class="menu">
							<li class="">
								<a href="inquiry_list.do" class="on"><span>문의글</span></a>
							</li>	
							<li class="">
								<a href="inquiry_write.do"><span>문의하기</span></a>
							</li>
							<li class="">
								<a href="inquiry_my_list.do"><span>내문의함</span><img src="http://localhost:9000/hotel/resources/img/line1.jpg"></a>
							</li>
						</ul>
				</div>
			</div>	
		</div>
		
		<div class="contents" id="contents">
			<div class="ctnInquires ctnCtUs">
				<div class="location">
					<p class="list">
						<span class="crPosit">현재 페이지 위치 : </span>
						" > 문의하기 >"
						<strong>내문의글</strong>
					</p>
				</div>
				<div class="headTit">
					<h3 class="tit">연락처</h3>
				</div>
				<table class="tableTypeF tableFactSheet tableBold" style="height: 139px;"> 
					<colgroup> 
					<col width="20%" class="col1"> 
					<col class="col2"> 
					</colgroup> 
					<tbody> 
						<tr> 
							<th class="pe_qK" rowspan="2">호텔</th> 
							<td><span>대표전화</span><strong>02-1234-1234</strong><br></td> 
						</tr> 
						<tr> 
							<td><span>객실예약</span><strong>02-5678-5678</strong><br> * 평일(월~금요일) 09:00~18:00, 주말 및 공휴일 09:00~16:00</td> 
						</tr> 
					</tbody> 
				</table>
				
				
				<!---------- content start ---------->
				<div class="account">
					<img alt="연락처 설명 문구" src="http://localhost:9000/hotel/resources/img/contactText01.gif">
					<h3>내문의글</h3>
					<table class="customerBoard">
						<tr>
							<th>No.</th>
							<th>구분</th>
							<th>문의</th>
							<th>제목</th>
							<th>작성자</th>							
							<th>등록일자</th>							
						</tr>
						<c:forEach var="vo" items="${mlist}">
							<tr>
								<td>${ vo.rno }</td>
								<td>${ vo.hotelname }</td>
								<td>${ vo.category }</td>
								<td>
									<c:choose>
										<c:when test="${ vo.rcount != 0 }">
											<a href="inquiry_content.do?iid=${ vo.iid }">${ vo.title }<div class="commentimg"></div></a>
										</c:when>
										<c:otherwise>
											<a href="inquiry_content.do?iid=${ vo.iid }">${ vo.title }</a>
										</c:otherwise>
									</c:choose>		 
								</td>
								<td>${ vo.mid }</td>
								<td>${ vo.idate }</td>
							</tr>
						</c:forEach>
						
						<tr>
							<td colspan="6"> << 1 2 3 4 5 >> </td>
						</tr>
					</table>
					<form name="list_search" action="inquiry_list_search.do" method="get" id="search" >
						<span>검색어</span>
						<select class="search_list" name="searchlist" id="searchlist">
							<option value="default">선택</option>
							<option value="title">제목</option>
							<option value="writer">작성자</option>
						</select>
						<input type="text" name="keyword" id="searchName">
						<button type="button" id="btnSearch">찾기</button>
					</form>				
				
				</div>
				
			</div>					
		</div>

	
	
	
	</div>

	<!-- Footer Include -->
	<iframe></iframe>
</body>
</html>