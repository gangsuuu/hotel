<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script> 
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/nav.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/form.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/search.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
 <script>
    $("[data-nav=service]").css("display","block");
    $("[data-nav=service]").children().eq(2).children().first().css("color","white");
    </script> 
<head>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
      
      //페이징 리스트 출력
      var pager = jQuery('#ampaginationsm').pagination({
      
          maxSize: 4,             // max page size
          totals: '${dbCount}',   // total rows   
          page: '${rpage}',      // initial page      
          pageSize: '${pageSize}',   // max number items per page
      
          // custom labels      
          lastText: '&raquo;&raquo;',       
          firstText: '&laquo;&laquo;',      
          prevText: '&laquo;',      
          nextText: '&raquo;',
                 
          btnSize:'sm'   // 'sm'  or 'lg'      
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
          if($('input[name=booknumck]:checked').length==0){
            alert("예약 취소하실 방을 체크해 주세요");
            $("#booknumck").focus();            
         }else{
            $('input[name=booknumck]:checked').each(function( index ) {
                 $( this ).val($(this).attr("id"));                 
            });
            
            myroomlist.submit();            
         }  
      });
      
   });
      
</script>
<title>Insert title here</title>
</head>
<body>
   <%@ include file="../header.jsp" %>
   <form name="myroomlist" action="myroomcancel.do" method="POST">
   <div align="center">
      
   <table border="1">
         <c:choose>
	         <c:when test="${mlistsize==0}">
	         	<h3>등록된 방이 없습니다.</h3>
	         
	         </c:when>
	         <c:otherwise>
		         <c:forEach var="item" items="${mlist}"> 
		         
		            <div class="tray" onclick="">
		                <div class="card" >
		                    <img src="http://localhost:9000/hotel/resources/upload/${item.bsfile}">
		                   
		                </div>
		                <div class="img_desc">
		                    <div>
		                        <div class="hotel_name">${item.brname}</div>
		                        
		                        <div class="hotel_date">${item.radatestart} ~ ${item.radateend}</div>
		                       
		                    </div>
		
		                    <div class="bottom">
		                        <!-- <div class="bottom_left">
		                            평점 4.1 (28)
		                        </div> -->
		                        <div class="bottom_right">
		                            ₩${item.price}
		                            <input type="checkbox" name="booknumck" id="${item.booknum}" value=""/>
		                        </div>
		                    </div>
		                </div>
		            </div>
		            </c:forEach>
	         </c:otherwise>
         </c:choose>
   </table>
            <div id="ampaginationsm"></div>
   <button type="button" id="check">예약취소</button>
   <button type="button" onclick="location.href='http://localhost:9000/hotel/shillaStay.do'">홈으로</button>
   
      </div>
      </form>
      <%@ include file="../footer.jsp" %>
</body>
</html>