<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/notice.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>
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
<div class="sub_title">
<div class="header"></div>

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
			<!-- 좌측 메뉴 -->
			 <%@ include file="./admin_left_bar.jsp" %>
			 <!-- 좌측 메뉴 end-->
		
			<!-- contents -->
			<div class="contents" id="contents">
			<input id="pageIndex" name="pageIndex" type="hidden" value="3"/>
				<div class="inner">
					<div class="headtit">
					<h2>이벤트</h2>
					</div>
					<div class="contents_area">
										<!-- 검색 -->
					<form name="form1" method="get" action="admin_event_list_search.do" id="search">
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
    						<input type="submit" value="조회">
					</div>
					</form>
					<!-- //검색 -->

					<!-- 일반게시판_List -->
						<table class="contents_table">
							<td colspan="4">
								<a href="admin_event_write.do">
								<button type="button" class="btn_style">글쓰기</button>
								</a>
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
									<td><a href="admin_notice_content.do?nid=${vo.nid }">${vo.ntitle }</a></td>
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
				<!-- contents-end -->	
	</div>
	</div>
	<div class="footer"></div>
</body>
</html>