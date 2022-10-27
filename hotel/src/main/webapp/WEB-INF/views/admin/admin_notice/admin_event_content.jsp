<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항상 즐거움이 있는 SHILLA STAY!</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/notice.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/inquiry.css">
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
<div class="content">
<div class="common_wrap_yy">
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
			<div class="content_lists">
				 <div class="content_inmenu">
					  <h2 class="suject">Admin</h2>
		              <ul>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_notice_list.do" class="content_list ">공지사항</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_event_list.do" class="content_list content_selected">이벤트</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_inquiry_list.do" class="content_list ">고객센터</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list">객실관리</a></li>
		              </ul>
				 </div>
			 </div>	
			 <!-- 좌측 메뉴 end-->
			 <!-- contents -->
			<div class="contents">
			<div class="ctnInquires ctnCtUs">
				<div class="sub_title">
					<h2>이벤트</h2>
					<p>Event</p>
					<span>항상 즐거움이 있는 곳! 신라 호텔</span>
				</div>
				<div class="location">
					<p class="list">
						<span class="crPosit"></span>
						 admin > 이벤트 >
						<strong>content</strong>
					</p>
				</div>
				<div class="headTit">
					<h3 class="tit">이벤트</h3>
					<div class="content-block"></div>
				</div>
			</div>
			<div class="clear">
				<div class="admin-write-bottons">
					<a href="admin_event_update.do?nid=${vo.nid }"><button type="button" class="btn_style">수정하기</button></a>
					<a href="javascript:delchk('${vo.nid}')" ><button type="button" class="btn_style">삭제하기</button></a>
					<a href="admin_event_list.do">
						<button type="button" class="btn_style">리스트</button>
					</a>
				</div>
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
			</table>	
	</div>
</div>	
<%@ include file="../../footer.jsp" %>
</body>
</html>