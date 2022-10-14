<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CGV</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /></head>
<body>
	<!-- Header Include -->
	<iframe></iframe>
	
	
	<!---------------------------------------------->
	<!--------------- Content ----------------------->
	<!---------------------------------------------->
	<div class="account">
		<h1>문의글 삭제하기</h1>
		<form name="inquiryDeleteForm" action="inquiry_delete_check.do" method="post">
			<input type="hidden" name="iid" value="${iid}">
			
			<p>정말로 삭제하시겠습니까?</p>
  				<button type="submit" class="btn_style">삭제완료</button>	
 				<a href="#" rel="modal:close">취소</a>
 
			<p><a href="#ex1" rel="modal:open">모달창띄우기</a></p>
			
			<%-- <ul>
				<li>
					<img src="http://localhost:9000/mycgv/resources/images/delete.jpg"> <!-- 휴지통 이미지 -->					
				</li>				
				<li>
					<div>정말로 삭제하시겠습니까?</div>
				</li>
				<li>
					<button type="submit" class="btn_style">삭제완료</button>					
					<a href="board_content.do?bid=${bid}"><button type="button" class="btn_style">이전페이지</button></a>
					<a href="board_list.do"><button type="button" class="btn_style">리스트</button></a>
				</li>
			</ul> --%>
		</form>
			
	</div>
	
	<!-- footer Include -->
	<iframe src="hotel_footer.do" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
	
</body>
</html>







