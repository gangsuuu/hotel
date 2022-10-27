<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script> 
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/nav.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/form.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/search.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<script type="text/javascript">
	 let delete_result='${result}';
	if(delete_result=="delete_ok"){
		alert("삭제가 완료되었습니다.");
		location.href = "shillaStay.do";
	} 
</script>
<script>
$(document).ready(function(){
		
		//페이징 리스트 출력
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
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
	           $(location).attr('href', "http://localhost:9000/hotel/delete.do?rpage="+e.page);         
	    });
		
 	});
 	</script>
<script>
	$(document).ready(function(){
		$("#check").click(function(){
		 	if($('input[name=allbid]:checked').length==0){
				alert("예약 취소하실 방을 체크해 주세요");
				$("#allbid").focus();				
			}else{
				$('input[name=allbid]:checked').each(function( index ) {
					  $( this ).val($(this).attr("id"));					  
				});
				
				baskdelete_result.submit();				
			}  
		});
		
	});
		
</script>
<head>
<meta charset="UTF-8">
<title>예약된 방 삭제하기</title>
</head>
<body>
	<div align="center">
	<h2>호텔 삭제하기</h2>
	<form name="baskdelete_result" action="delete_result.do" method="post">
	<div class="item" style="border: 0">
        <c:choose>
			<c:when test="${empty blist}">
			
			<h3>등록된 방이 없습니다.</h3>
			
			</c:when>
			<c:otherwise>
			<c:forEach var="item" items="${blist}"> 
            <div class="tray" onclick="">
                <div class="card" >
                    <img src="http://localhost:9000/hotel/resources/upload/${item.bsfile}">
                    <input type="hidden" name="bsfile" value="${item.bsfile}"/>
                </div>
                <div class="img_desc">
                    <div>
                        <div class="hotel_name">${item.brname}</div>
                        
                        <p>Shilla Stay Hotels</p>
                    </div>

                    <div class="bottom">
                        <!-- <div class="bottom_left">
                            평점 4.1 (28)
                        </div> -->
                        <div class="bottom_right">
                            ₩<fmt:formatNumber value="${item.bprice}" pattern="#,###" />
                            <input type="checkbox" name="allbid" id="${item.bid}" value=""/>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
			</c:otherwise>
			</c:choose>
			<div id="ampaginationsm"></div>
    </div>
		<button type="button" id="check">삭제</button>
		<button type="button" onclick="location.href='http://localhost:9000/hotel/shillaStay.do'">홈으로</button>
	</form>
	</div>
	
</body>
</html>