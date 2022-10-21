<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/inquiry.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<title>Customer Inquiry</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>
<script src="http://localhost:9000/hotel/resources/js/inquiry_list.js"></script>
<script src="http://localhost:9000/hotel/resources/js/inquiry_javascript.js"></script>
<script>
	var hotelname = "theshilla";
</script>
<script>
$(document).ready(function(){
	//페이징 처리
	var pager = $('#ampaginationsm').pagination({
		
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
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/hotel/inquiry_list.do?rpage="+e.page);         
	    });
	
});//ready
</script>
</head>
<body>
	<!-- Header Include -->
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header_find_hotel.js"></script>

	<!---------------------------------------------->
	<!--------------- MenuBar ---------------------->
	<!---------------------------------------------->
	<div class="contain">
		<div class="container">
			<div class="InAreaMenuBar">
				<div class="MenuBar">
					<h2 class="tit">고객문의</h2>
					<img src="http://localhost:9000/hotel/resources/img/gline.jpg">
						<ul class="menu">
							<li class="">
								<a href="inquiry_list.do" class="on"><span>문의글</span><img src="http://localhost:9000/hotel/resources/img/gline1.jpg"></a>
							</li>	
							<li class="">
								<a href="inquiry_write.do"><span>문의하기</span></a>
							</li>
							<li class="">
								<a href="inquiry_my_list.do?mid=${sessionScope.svo.mid }"><span>내문의함</span></a>
							</li>
						</ul>
				</div>
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
						<img src="http://localhost:9000/hotel/resources/img/linewrite.jpg">
						<img alt="연락처 설명 문구" src="http://localhost:9000/hotel/resources/img/contactText01.gif">
					</div>
					<table class="tableTypeF tableFactSheet tableBold" style="height: 139px;" border> 
						<colgroup> 
						<col width="20%" class="col1"> 
						<col class="col2"> 
						</colgroup> 
						<tbody> 
							<tr> 
								<th class="pe_qK" rowspan="2">신라호텔</th> 
								<td><span>대표전화 </span><strong>02-1234-1234</strong><br></td> 
							</tr> 
							<tr> 
								<td><span>객실예약 </span><strong>02-5678-5678</strong><br> * 평일(월~금요일) 09:00~18:00, 주말 및 공휴일 09:00~16:00</td> 
							</tr> 
						</tbody> 
					</table>
					
					<h3 class="tit1">문의글</h3>
					<img id="linewrite" src="http://localhost:9000/hotel/resources/img/linewrite.jpg">
					
					<table id="listtable" border=1px solid>
						<tr>
							<th>No.</th>
							<th>구분</th>
							<th>문의</th>
							<th id="tabletitle">제목</th>
							<th>작성자</th>							
							<th>등록일자</th>							
						</tr>
						<c:choose>
							<c:when test="${listSize == 0}">
								<tr>
									<td colspan="6" id="no"> 검색된 문의글이 없습니다. </td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="vo" items="${list}">
									<tr>
										<td>${ vo.rno }</td>
										<td>${ vo.hotelname }</td>
										<td>${ vo.category }</td>
										<td>							
										
											<%-- <c:forEach var="re" items="${reply}"> --%>
												<c:choose>
													<c:when test="${vo.secret == 1}">
														<c:choose>
															<c:when test="${ vo.rcount != 0}">												
																<a href="#ex1" rel="modal:open" class="reclass" id="${vo.iid}" onclick="modalopen('${vo.iid}')">문의드립니다<div class="commentimg"></div><img src="http://localhost:9000/hotel/resources/img/icon_lock.gif"></a>
															</c:when>
															<c:otherwise>
																<a href="#ex1" rel="modal:open" id="${vo.iid}" onclick="modalopen('${vo.iid}')">문의드립니다<img src="http://localhost:9000/hotel/resources/img/icon_lock.gif"></a>
															</c:otherwise>					
														</c:choose>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${ vo.rcount != 0}">
																<a class="reclass" id="${vo.iid}" href="inquiry_content.do?iid=${ vo.iid }">${ vo.title }<div class="commentimg"></div></a>
															</c:when>
															<c:otherwise>
																<a class="reclass" id="${vo.iid}" href="inquiry_content.do?iid=${ vo.iid }">${ vo.title }</a>
															</c:otherwise>
														</c:choose>		
													</c:otherwise>
												</c:choose>
											<%-- </c:forEach> --%> 
										
											
																	
										</td>
										<td>${ vo.mid }</td>
										<td>${ vo.idate }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
						<tr>
							<td colspan="6"><div id="ampaginationsm"></div></td>
						</tr>
					</table>
								<!-- div를 forEach안에 두면 계속 생겨서 오류걸림, 밖으로 빼기 -->
								<div id="ex1" class="modal">
									<img src="http://localhost:9000/hotel/resources/img/lock.png" width=20%>
				  					<p id="passCheckText"><strong>비밀번호</strong>를 입력해주세요.</p>
				  					<input type="text" id="inputPass">
				  					<button type="button" id="passCheck">확인</button>
				 					<a rel="modal:close" >취소</a>
								</div>							
					
					<a href="inquiry_write.do"><button type="button" id="btnInquiry">문의하기</button></a>
					
					<form name="list_search" action="inquiry_list_search.do" method="post" id="search" >
						<span id="searchspan">검색어</span>
						<select class="search_list" name="searchlist" id="searchlist">
							<option value="default">선택</option>
							<option value="title">제목</option>
							<option value="writer">작성자</option>
							<option value="hotel">호텔선택</option>
							<option value="category">문의선택</option>
						</select>
						<input type="text" name="keyword" id="searchName">
						<button type="button" id="btnSearch">찾기</button>
					</form>
				</div>
										
			</div>					
		</div>

	
	</div>

	<!-- Footer Include -->
	<script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/footer.js"></script>
</body>
</html>