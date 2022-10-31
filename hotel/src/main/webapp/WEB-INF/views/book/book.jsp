<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script> 
<script type="text/javascript" src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script> 
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/nav.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/trip_index.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
 <script>
    $("[data-nav=service]").css("display","block");
    $("[data-nav=service]").children().eq(2).children().first().css("color","white");
</script>
<style>
.theme2_main > div> .header_maincategori_res > .theme2_main_res, .theme2_main > div> .header_maincategori_seach > .theme2_main_seach 
{ color: var(--theme2-maincategori_seach_font); WIDTH: 200px; height: 45px;}
</style>
<head>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
		
		//페이징 리스트 출력
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 6,	    		// max page size
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
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/hotel/book.do?rpage="+e.page);         
	    });
		
 	});
 	</script>
<script>
	$(document).ready(function(){
		$(".card").click(function(){
			$(location).attr("href","http://localhost:9000/hotel/bookinsert.do?bid="+$(this).attr("id"));//자기자신만 호출
			
			
		});
		
	});
	
</script>
<style type="text/css">

li{
	list-style: none;
	clear:both;
}

</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<!-- <form name="book" action="bookinsert.do" method="POST"> -->
  <div align="center">
	<div class="row">
    <div class="column">
        <div class="item" style="border: 0px">
            
            <c:choose>
			<c:when test="${empty basketlist}">
			
			<h3>등록된 방이 없습니다.</h3>
			
			</c:when>
			<c:otherwise>
                <ul>
                <div class="tray1">
                <c:forEach var="item" items="${basketlist}" varStatus="status" > 
					<c:if test="${status.index==0}">
            		<li> 
            		</c:if>           
                        <div class="card" id ="${item.bid }">
                            <img src="http://localhost:9000/hotel/resources/upload/${item.bsfile}" width="200">
                            <div class="card_info">
                                <p style="font-size: 14px">${item.brname}</p>
                                <b><fmt:formatNumber value="${item.bprice}" pattern="#,###" />원</b>
                           </div>
                    </div>
                    
                  <c:if test="${status.index==0}">
            		</li> 
            	</c:if>
                  
			</c:forEach>
         	</div>
			</ul>
			</c:otherwise>
			</c:choose>
                    
    </div>
</div>

<!--여행관련 JS-->
<script src="/static/js/user/trip.js"></script>
</div>
                    <div id="ampaginationsm"></div>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/myroom.do?mid=${svo.mid}'">나의 예약목록 확인</button>
	<!-- <button type="button" onclick="location.href='http://localhost:9000/hotel/main.do'">홈으로</button> -->
	<!-- </form> -->
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>