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
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script>
	var hotelname = "theshilla";
</script>
<script>
	$(document).ready(function(){
		
		//페이징 리스트 출력
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 5,	    		// max page size
		    totals: '${dbCount}',	// total rows	
		    page: '${rPage}',		// initial page		
		    pageSize: '${pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		//페이징 번호 클릭 시 이벤트 처리
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			var keyword = "${keyword}"
			var search = "${search}"
			if(search == "search"){
				jQuery('.showlabelsm').text('The selected page no: '+e.page);
		        $(location).attr('href', "http://localhost:9000/hotel/notice_list_search.do?rpage="+e.page);
			}else{
				jQuery('.showlabelsm').text('The selected page no: '+e.page);
		       $(location).attr('href', "http://localhost:9000/hotel/notice_list.do?rpage="+e.page);
			}
	    });

 	});
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="content">
<div class="common_wrap_yy">
	<div class="common_inner">
		<div class="location" id="lnb"><ul>
		<li><a href="http://localhost:9000/hotel/shillaStay.do">메인페이지</a></li>
		<li><a href="http://localhost:9000/hotel/notice_list.do">공지사항</a></li>
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
					  <h2 class="suject">고객서비스</h2>
		              <ul>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/introhotel.do" class="content_list">호텔안내</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/viewGuestService.do" class="content_list">인근명소</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list content_selected">공지사항</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_list.do" class="content_list">고객센터</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_my_list.do?mid=${sessionScope.svo.mid }" class="content_list_two"> - 내문의함</a></li>
		              </ul>
				 </div>
			 </div>		
			 <!-- 좌측 메뉴 end-->
		
			<!-- contents -->
			<div class="contents" id="contents">
			<input id="pageIndex" name="pageIndex" type="hidden" value="3"/>
				<div class="inner">
					<div class="sub_title">
					<h2>공지사항</h2>
					<p>Notice</p>
				<span>항상 즐거움이 있는 곳! 신라 호텔</span>
					</div>
					<div class="contents_area">
					

					<!-- 일반게시판_List -->
						<table class="contents_table">
							<td colspan="4">
							</td>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>조회수</th>
									<th>작성일</th>	
								</tr>
					                <c:forEach var="vo"  items="${list}">
								<tr>
									<td>${vo.rno }</td>
									<td><a href="notice_content.do?nid=${vo.nid }">${vo.ntitle }</a></td>
									<td>${vo.nhits }</td>
									<td>${vo.ndate }</td>
								</tr>
								</c:forEach>
								<tr>
	             					 <td colspan="4"><div id="ampaginationsm"></div></td>
              					</tr>
						</table>
						</div>
					</div>
					<!-- //일반게시판_List -->
					<!-- 검색 -->
					<form name="form1" method="get" action="notice_list_search.do" id="search">
					<div class="search">
						<span>SEARCH</span>
							
							<select name="search_option">
							<option value="ntitle"
							<c:if test="${map.search_option == 'ntitle'}">selected</c:if>>제목
							</option>
							
							<option value="ncontent" 
							<c:if test="${map.search_option == 'ncontent'}">selected</c:if>>내용
							</option>
							</select>
							<input name="keyword" value="${map.keyword}">
    						<button type="submit">조회</button>
					</div>
					</form>
					<!-- //검색 -->
					
	</div>
	</div>	
	<div><%@ include file="../footer.jsp" %></div>
	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(3).children().first().css("color","white");
 	</script>
</body>
</html>