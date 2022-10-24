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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
function delchk(nid){
	Swal.fire({
        title: '글을 삭제하시겠습니까??',
        text: "삭제하시면 다시 복구시킬 수 없습니다.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '삭제',
        cancelButtonText: '취소'
    }).then((result) => {
    		if (result.value) {
    			Swal.fire({
    	        	title: '삭제되었습니다',
    	        	text: "목록으로 돌아갑니다.",
    	       		icon: 'success',
    	        	showCancelButton: false,
    	        	confirmButtonColor: '#3085d6',
    	        	cancelButtonColor: '#d33',
    	        	confirmButtonText: '삭제'
    	    	}).then((result) => {
    	    		 let f = document.createElement('form');
    	                 
    	                 let obj;
    	                 obj = document.createElement('input');
    	                 obj.setAttribute('type', 'hidden');
    	                 obj.setAttribute('name', 'nid');
    	                 obj.setAttribute('value', nid);
    	                 
    	                 f.appendChild(obj);
    	                 f.setAttribute('method', 'post');
    	                 f.setAttribute('action', 'admin_notice_del_ok.do');
    	                 document.body.appendChild(f);
    	                 f.submit();
    	    		
    	    	})
            }
    })

}
</script>

</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="noticepage">
<div class="common_wrap_yy" style="top: 0px;">
	<div class="common_inner">
		<div class="location" id="lnb"><ul>
		<li><a href="http://localhost:9000/hotel/shillaStay.do">메인페이지</a></li>
		<li><a href="http://localhost:9000/hotel/admin_event_list.do">이벤트</a></li>
		<li><a href="http://localhost:9000/hotel/admin_event_content.do?nid=${vo.nid }">글 상세보기</a></li>
		</ul>
		</div>
	</div>
</div>	

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
			<!-- 좌측 메뉴 -->
			<%@ include file="./admin_left_bar.jsp" %>
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents">
		<div class="sub_title">
					<h2>공지사항</h2>
					<p>Notice</p>
				<span>항상 즐거움이 있는 곳! 신라 호텔</span>
					</div>
		<table class="boardContent">	
			<tr>				
				<th>태그</th>
				<td>${vo.ntag }</td>
				<th>등록일자</th>
				<td>${vo.ndate }</td>
				<th>조회수</th>
				<td colspan="2">${vo.nhits }</td>
			</tr>		
			<tr>				
				<th>제목</th>
				<td colspan="6">${vo.ntitle }</td>
			</tr>
			<tr>				
				<td colspan="6">
				<div>
				<c:if test="${vo.nsfile != null}">
					<img src="http://localhost:9000/hotel/resources/upload/${vo.nsfile }">
				</c:if>
				<br><br>
				${vo.ncontent }
				<br><br></td>
				</div>
			</tr>
			<tr>
				<td colspan="6">
					<a href="admin_event_update.do?nid=${vo.nid }"><button type="button" class="btn_style">수정하기</button></a>
					<a href="javascript:delchk('${vo.nid}')" ><button type="button" class="btn_style">삭제하기</button></a>
					<a href="admin_event_list.do">
						<button type="button" class="btn_style">리스트</button></a>
				<!-- 	<a href=""><button type="button" class="btn_style">관리자홈</button></a> -->
				</td>
			</tr>			
		</table>	
	</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>