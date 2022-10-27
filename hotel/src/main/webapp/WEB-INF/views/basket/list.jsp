<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script> 
<script type="text/javascript" src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script> 

<script src="http://localhost:9000/mycgv/resources/js/am-pagination.js"></script>
<link rel="stylesheet"  href="http://localhost:9000/mycgv/resources/css/am-pagination.css">

<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/nav.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/trip_index.css">
<html>
<script>
    $("[data-nav=service]").css("display","block");
    $("[data-nav=service]").children().eq(2).children().first().css("color","white");
    </script> 
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
           $(location).attr('href', "http://localhost:9000/hotel/list.do?rpage="+e.page);         
    });
	
	});
</script>
<head>
<script>
	$(document).ready(function(){
		$(".card").click(function(){
			$(location).attr("href","http://localhost:9000/hotel/update.do?bid="+$(this).attr("id"));//자기자신만 호출
			
			
		});
		
	});
	
</script>
<style type="text/css">

li{
	list-style: none;
	clear:both;
}
</style>
	<title>방 목록</title>
</head>
<body>
<%@ include file="../header.jsp" %>
	<div align="center">
	<div class="row">
    <div class="column">
        <div class="item" style="border: 0px">
            <div class="item_title">(관리자)호텔룸 목록</div>
            
            <c:choose>
			<c:when test="${empty blist}">
			
			<h3>등록된 방이 없습니다.</h3>
			</c:when>
			<c:otherwise>
                <ul>
                <div class="tray1">
                <c:forEach var="item" items="${blist}" varStatus="status" > 
					<c:if test="${status.index==0}">
            		<li> 
            		</c:if>           
                        <div class="card" id ="${item.bid }">
                           <a href="update.do?bid=${item.bid}">
                            <img src="http://localhost:9000/hotel/resources/upload/${item.bsfile}"></a>
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
    <div id="ampaginationsm"></div>
</div>

<!--여행관련 JS-->
<script src="/static/js/user/trip.js"></script>
</div>
	
	<button type="button" onclick="location.href='http://localhost:9000/hotel/delete.do'">삭제페이지 이동</button>
	<button type="button" onclick="location.href='http://localhost:9000/hotel/main.do'">관리자 홈으로</button>
	
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>