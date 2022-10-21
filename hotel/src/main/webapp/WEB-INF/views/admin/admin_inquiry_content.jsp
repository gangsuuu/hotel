<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/inquiry.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<title>Customer Inquiry</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry_javascript.js"></script>
<script>
	var hotelname = "theshilla";
</script>
</head>
<body>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header_find_hotel.js"></script>

	<!---------------------------------------------->
	<!--------------- MenuBar ---------------------->
	<!---------------------------------------------->
	
	<div class="contain">
		<div class="container">
			<div class="InAreaMenuBar">
				<div class="MenuBar">
					<h2 class="tit">고객문의</h2>
					<img src="http://localhost:9000/hotel/resources/img/gline.jpg">
						<ul class="menu">
							<li class="">
								<a href="inquiry_list.do" class="on"><span>전체 문의글</span><img src="http://localhost:9000/hotel/resources/img/gline1.jpg"></a>
							</li>
							<li class="">
								<a href="admin_hotel_categori.do"><span>관리자홈</span></a>
							</li>		
						</ul>
				</div>
			</div>	
		</div>
		
	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
		<div class="contents" id="contents">
			<div class="ctnInquires ctnCtUs">
				<div class="location">
					<p class="list">
						<span class="crPosit"></span>
						 > 문의하기 >
						<strong>Contact Us</strong>
					</p>
				</div>
					
				<div class="account">
					<div class="headTit">
						<h3 class="tit">연락처</h3>
						<img src="http://localhost:9000/hotel/resources/img/linewrite.jpg">
						<img alt="연락처 설명 문구" src="http://localhost:9000/hotel/resources/img/contactText01.gif">
					</div>
					<table class="tableTypeF tableFactSheet tableBold" style="height: 139px;" border> 
						<colgroup> 
						<col width="20%" class="col1"> 
						<col class="col2"> 
						</colgroup> 
						<tbody> 
							<tr> 
								<th class="pe_qK" rowspan="2">신라호텔</th> 
								<td><span>대표전화 </span><strong>02-1234-1234</strong><br></td> 
							</tr> 
							<tr> 
								<td><span>객실예약 </span><strong>02-5678-5678</strong><br> * 평일(월~금요일) 09:00~18:00, 주말 및 공휴일 09:00~16:00</td> 
							</tr> 
						</tbody> 
					</table>
					
					<h3 class="tit1">문의글</h3>
					<img id="linewrite" src="http://localhost:9000/hotel/resources/img/linewrite.jpg">
					<table border=1 class="customerBoard">
						<tr>
							<th colspan="2">호텔선택</th>
							<td colspan="2">${vo.hotelname }</td>
						</tr>
						<tr>
							<th>문의유형</th>
							<td>${ vo.category }</td>
							<th>등록일자</th>
							<td>${ vo.idate }</td>													
						</tr>
						<tr>
							<th colspan="2">제목</th>
							<td colspan="2">${ vo.title }</td>
						</tr>
						
						<tr>
							<th colspan="2">작성자</th>
							<td colspan="2">${vo.mid }</td>
						</tr>
						
						<tr>
							<th colspan="2">내용</th>
							<td colspan="2" class="tablecontent" name="content" id="content">${ vo.content }<br><br>
								<!-- 파일업로드 출력 / 파일이 있는지 없는지 확인해서 출력 -->
								<c:if test="${vo.isfile != null}">
									<img src="http://localhost:9000/hotel/resources/upload/${vo.isfile}"
									width="40%">
								</c:if>
							</td>
						</tr>

					</table>
  					<form name="replyDeleteForm" action="reply_delete_check.do" method="post">
	  				<input type="hidden" name="iid" value="${vo.iid}">
 					</form>	
 					
 					<!-- 관리자 답글등록 창 -->
 					<form name="replyinquiry" id="replyinquiry" method="post" enctype="multipart/form-data" action="admin_reply_check.do">
					<input type="hidden" name="iid" id="replywrite" value="${ vo.iid }" >
	 					<table class="replywritetable">
							<tr>
								<th><label class="label1">작성자</label></th>
								<td><input type='text' value="관리자" disabled></td>
							</tr>
							<tr>
								<th><label>제목</label></th>
								<td><input type='text' name='admintitle' value="고객문의 답변드립니다." disabled></td>
							</tr>
							<tr>
								<th><label>내용</label></th>
								<td><textarea name='recontent' id="recontent"></textarea><td>
							</tr>
						</table>
	 					 	<button type="button" id="btn_ReplyWrite">답변등록</button>
						<!-- <button type="button" id="btn_ReplyWrite">답변등록</button> -->
 					</form> 					
 					
 					<form name="adminDeleteForm" action="admin_inquiry_delete_check.do" method="post">
	  				<input type="hidden" name="iid" value="${vo.iid}">
 					</form>
 					
 					<div id="btnlist">
						<a href="admin_inquiry_update.do?iid=${vo.iid }"><button type="button" id="btn_InquiryUpdate">수정하기</button></a>		
						<a href="#ex1" rel="modal:open"><button type="button" id="btn_InquiryDelete">삭제하기</button></a>
						<a href="admin_inquiry_list.do"><button type="button" id="btn_InquiryList">목록</button></a>
					</div>
					
					<div id="ex1" class="modal">
	  					<img src="http://localhost:9000/hotel/resources/img/delete.png" width=20%>
	  					<p>정말로 <strong style="color:red">삭제</strong>하시겠습니까?</p>
	  					<button type="button" id="modal_delete" onclick="">삭제</button>	
	 					<a rel="modal:close" >취소</a>
					</div>
															
				</div>
				
			</div>					
		</div>

	
	
	
	</div>

	<!-- Footer Include -->
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/footer.js"></script>
</body>
</html>