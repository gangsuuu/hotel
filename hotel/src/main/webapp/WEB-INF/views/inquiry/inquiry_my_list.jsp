<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Inquiry</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
	var hotelname = "theshilla";
</script>
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
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header_find_hotel.js"></script>

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
							<th>분류</th>
							<th>제목</th>
							<th>작성자</th>							
							<th>등록일자</th>							
						</tr>
						<tr>
							<td>1</td>
							<td>예약문의</td>
							<td>문의글</td>
							<td>test1</td>
							<td>2022-08-31</td>
						</tr>
						<tr>
							<td>2</td>
							<td>계정문의</td>
							<td>문의글2</td>
							<td>test1</td>
							<td>2022-08-30</td>
						</tr>
						<tr>
							<td>3</td>
							<td>예약문의</td>
							<td>문의글3</td>
							<td>test1</td>
							<td>2022-08-30</td>
						</tr>
						<tr>
							<td>4</td>
							<td>기타</td>
							<td>문의글4</td>
							<td>test1</td>
							<td>2022-08-29</td>
						</tr>
						<tr>
							<td>5</td>
							<td>기타</td>
							<td>문의글5</td>
							<td>test1</td>
							<td>2022-08-28</td>
						</tr>
						<tr>
							<td colspan="4"> << 1 2 3 4 5 >> </td>
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
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/footer.js"></script>
</body>
</html>