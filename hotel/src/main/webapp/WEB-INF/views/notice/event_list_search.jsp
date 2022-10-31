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

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<script>
	$(document).ready(function(){
		
		//페이징 리스트 출력
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 5,	    		// max page size
		    totals: '${dbCount}',	// total rows	
		    page: '${pPage}',		// initial page		
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
			var search = "${search}"
			var keyword = "${keyword}"
			if(search == "search"){
				jQuery('.showlabelsm').text('The selected page no: '+e.page);
		        $(location).attr('href', "http://localhost:9000/hotel/event_list_search.do?rpage="+e.page+"&keyword="+keyword);
			}else{
				jQuery('.showlabelsm').text('The selected page no: '+e.page);
		       $(location).attr('href', "http://localhost:9000/hotel/event_list.do?rpage="+e.page);
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
		<li><a href="http://localhost:9000/hotel/event_list.do">이벤트</a></li>
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
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/introhotel.do" class="content_list">스페셜오퍼</a></li>
			              <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list content_selected">이벤트</a></li>
		              </ul>
				 </div>
			 </div>
			 <!-- 좌측 메뉴 end-->
		
			<!-- contents -->
			<div class="contents" id="contents">
			<input id="pageIndex" name="pageIndex" type="hidden" value="3"/>
				<div class="inner">
					<div class="sub_title">
					<h2>이벤트</h2>
					<p>Event</p>
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
								<c:choose>
								<c:when test="${listSize == 0}">
									<!-- 게시물 없을 때 출력 -->
									<tr>
										<td colspan="6" id="no"> 
											<img width="20%" src="http://localhost:9000/hotel/resources/img/inquiry/question.jpg">
											<div id="nokeyword"><strong>"${keyword}"</strong>와(과) 일치하는 검색결과가 없습니다. </div>
											<div id="solution"> 해결방법 : </div>
											<ul id="solution2">
												<li>ㆍ모든 단어의 철자가 정확한지 확인하세요.</li>
												<li>ㆍ다른 검색어를 사용해 보세요.</li>
												<li>ㆍ키워드 수를 줄여보세요.</li>
											</ul>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
					                <c:forEach var="vo"  items="${list}">
								<tr>
									<td>${vo.rno }</td>
									<td><a href="notice_content.do?nid=${vo.nid }">${vo.ntitle }</a></td>
									<td>${vo.nhits }</td>
									<td>${vo.ndate }</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
								<tr>
	             					 <td colspan="4"><div id="ampaginationsm"></div></td>
              					</tr>
						</table>
						</div>
						<!-- 검색 -->
						<form name="form1" method="get" action="event_list_search.do" id="search">
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
					<!-- //일반게시판_List -->
					
	</div>
	</div>
	<%@ include file="../footer.jsp" %>
	<script>
 	$("[data-nav=Special]").css("display","block");
 	$("[data-nav=Special]").children().eq(1).children().first().css("color","white");
 	</script>
</body>
</html>