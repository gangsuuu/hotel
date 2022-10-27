<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/inquiry.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<title>Customer Inquiry</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry_javascript.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
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
	           $(location).attr('href', "http://localhost:9000/hotel/admin_inquiry_list.do?rpage="+e.page);         
	    });
		
	
 	});
</script>
<script>
	
	
$(document).ready(function(){	
	
	function ajax_page(dbCount, rpage, pageSize){
		//alert(dbCount+","+rpage+","+pageSize);
		var pager = $('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: dbCount,	// total rows	
		    page: rpage,		// initial page		
		    pageSize: pageSize,	// max number items per page 
		
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
	           $(location).attr('href', "http://localhost:9000/hotel/admin_replynone_list_json.do?rpage="+e.page);         
	    });
	}//ajax_page()
	
	
	
	
	
	$("#resetbutton").click(function(){
		location.reload();
	});//click
	
	
	$("#replynone").click(function(){
		replynone(1);
	});//click
	
	
	function replynone(rpage){
		$.ajax({
			url : "admin_replynone_list_json.do?rpage="+rpage,
			success : function(result){
				let data = JSON.parse(result);
				//alert(result);
				//alert(data.list);
				if(data.reply == 0){
					//alert("reply=0");
				}else{
					let text = "<table border=1 id='listtable'>";
					text += "<tr>";
					text += "<th>NO.</th>";
					text += "<th>구분</th>";
					text += "<th>문의</th>";
					text += "<th id='tabletitle'>제목</th>";
					text += "<th>작성자</th>";
					text += "<th>등록일자</th>";
					text += "</tr>";
						for(obj of data.list){
							text += "<tr>"
							text += "<td>"+ obj.rno  +"</td>"
							text += "<td>"+ obj.hotelname +"</td>"
							text += "<td>"+ obj.category +"</td>"
							text += "<td><a href='admin_inquiry_content.do?iid="+obj.iid+"'>"+ obj.title +"</a></td>"
							text += "<td>"+ obj.mid +"</td>"
							text += "<td>"+ obj.idate +"</td>"
							text += "</tr>"
						}
					text += "<tr>"
					text += "<td colspan='6'><div id='ampaginationsm'></div></td>"
					text += "</tr>"	
					text += "</table>";
				
					
					//출력
					if(data.rcount != 1){
						$("#listtable").remove();
						$("#nonetable").after(text);
						//페이징 출력
						ajax_page(data.dbCount, data.rpage, data.pageSize);
						
					}else{
						$("#replytable").remove();
					}
		
					
				}//if-end */
					
			}//success
			
		});//ajax
		
	}//replynone()
});//ready	
</script>
</head>
<body>
	<!-- Header Include -->
	<%@ include file="../header.jsp" %>

	<!---------------------------------------------->
	<!--------------- MenuBar ---------------------->
	<!---------------------------------------------->
	
	<div class="content">
		<div class="content_lists">
			 <div class="content_inmenu">
				  <h2 class="suject">고객서비스</h2>
	              <ul>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_notice_list.do" class="content_list ">공지사항</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_event_list.do" class="content_list">이벤트</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_inquiry_list.do" class="content_list content_selected">고객센터</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list">객실관리</a></li>
	              </ul>
			 </div>
		 </div>		
								
	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->				
		<div class="contents" id="contents">
			<div class="ctnInquires ctnCtUs">
				<div class="location">
					<p class="list">
						<span class="crPosit"></span>
						 > 문의하기 >
						<strong>Contact Us</strong>
					</p>
				</div>

				<div class="account">
					<div class="headTit">
						<h3 class="tit">연락처</h3>
						<div class="content-block"></div>
						<img alt="연락처 설명 문구" src="http://localhost:9000/hotel/resources/img/inquiry/contactText01.gif">
					</div>
					
					<div>
						<img alt="shillastay" src="http://localhost:9000/hotel/resources/img/inquiry/telHtitle2.gif">
						<table class="tableTypeF tableFactSheet tableBold" style="height: auto;" border> 
							<colgroup> 
							<col width="20%" class="col1"> 
							<col class="col2"> 
							</colgroup> 
							<tbody> 
								<tr> 
									<th class="pe_qK" rowspan="2">신라스테이 광화문</th> 
									<td><span>대표전화 </span><strong>02-6060-9000</strong><br></td> 
								</tr> 
								<tr> 
									<td><span>객실예약 </span><strong>02-2230-0700</strong><br> * 평일(월~금요일) 09:00~18:00, 주말 및 공휴일 09:00~16:00</td> 
								</tr> 
							</tbody> 
						</table>
					</div>
					
					<h3 class="tit1">문의글</h3>
					<div class="content-block"></div>
					<div id="nonetable">
						<button class="btn" type="button" id="replynone" >미답변</button>
						<button class="btn" type="button" id="resetbutton" >초기화</button>
					</div>
					<table id="listtable" border=1px solid>
						<tr>
							<th>No.</th>
							<th>구분</th>
							<th>문의</th>
							<th id="tabletitle">제목</th>
							<th>작성자</th>							
							<th>등록일자</th>							
						</tr>
						
						<c:forEach var="vo" items="${list}">
						<tr>
							<td>${ vo.rno }</td>
							<td>${ vo.hotelname }</td>
							<td>${ vo.category }</td>
							<td class="inquiry-title">
								<%-- <c:forEach var="re" items="${reply}"> --%>
									 <c:choose>
										<c:when test="${ vo.rcount != 0 }">
											<a href="admin_inquiry_content.do?iid=${ vo.iid }">${ vo.title }<div class="commentimg"></div></a>
										</c:when>
										<c:otherwise>
											<a href="admin_inquiry_content.do?iid=${ vo.iid }">${ vo.title }</a>
										</c:otherwise>
									</c:choose>		 
								<%-- </c:forEach> --%>
							</td>	
							<td>${ vo.mid }</td>
							<td>${ vo.idate }</td>
						</tr>
						 </c:forEach>
						
						<tr>
							<td colspan="6"><div id="ampaginationsm"></div></td>
						</tr>
					</table>
								<!-- 비밀번호 입력기능 -->
								<!-- div를 forEach안에 두면 계속 생겨서 오류걸림, 밖으로 빼기 -->
								<div id="ex1" class="modal">
				  					<p id="passCheckText"><strong>비밀번호</strong>를 입력해주세요.</p>
				  					<input type="text" id="inputPass">
				  					<button type="button" id="passCheck">확인</button>
				 					<a rel="modal:close" >취소</a>
								</div>							
					
					<!-- 검색기능 -->
					<form name="admin_list_search" action="admin_inquiry_list_search.do" method="post" id="search" >
						<span id="searchspan">검색어</span>
						<select class="search_list" name="searchlist" id="searchlist">
							<option value="default">선택</option>
							<option value="title">제목</option>
							<option value="writer">작성자</option>
							<option value="hotel">호텔선택</option>
							<option value="category">문의선택</option>
						</select>
						<input type="text" name="keyword" id="searchName">
						<button type="button" id="btnSearch">검색</button>
					</form>
				</div>
										
			</div>					
		</div>

	
	</div>
	
	</div>

	<!-- Footer Include -->
	<!-- Footer Include -->
	<%@ include file="../footer.jsp" %>
	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(3).children().first().css("color","white");
 	</script>
</body>
</html>