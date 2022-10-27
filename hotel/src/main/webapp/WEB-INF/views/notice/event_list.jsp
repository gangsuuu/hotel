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

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<script>
	var hotelname = "theshilla";
</script>
<script>
	$(document).ready(function(){
		
		//페이징 리스트 출력
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 5,	    		// max page size
		    totals: '${dbCount}',	// total rows	
		    page: '${rpage}',		// initial page		
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
			        $(location).attr('href', "http://localhost:9000/hotel/event_list_search.do?rpage="+e.page);
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
<<<<<<< main
<<<<<<< HEAD
<div class="content">
<div class="common_wrap_yy">
=======
<div class="common_wrap_yy" style="top: 0px;">
>>>>>>> refs/remotes/origin/main
=======
<div class="noticepage">
<div class="common_wrap_yy" style="top: 0px;">
>>>>>>> 13ad519 index 4/3 -> map, 날씨 api 연동완료 admin 4/1 오류수정 완료
	<div class="common_inner">
		<div class="location" id="lnb"><ul>
		<li><a href="http://localhost:9000/hotel/shillaStay.do">메인페이지</a></li>
		<li><a href="http://localhost:9000/hotel/event_list.do">이벤트</a></li>
		</ul>
		</div>
	</div>
</div>
<div class="noticepage">

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->

			<!-- 좌측 메뉴 -->
			 <%@ include file="./left_bar.jsp" %>
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
					<!-- 검색 -->
					<form name="form1" method="get" action="event_list_search.do" id="search">
					<div class="search">
						<span>SEARCH</span>
						<span class="select">
							
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
					
	</div>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>