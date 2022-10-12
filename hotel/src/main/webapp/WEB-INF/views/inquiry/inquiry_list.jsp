<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Inquiry</title>
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>

<script>
	
	function modalopen(iid){ 
		$("#passCheck").attr('onclick',"checkPass('"+iid+"')");
	 }
	 
	function checkPass(iid){
		
		const pass = $("#inputPass").val();
		
		$.ajax({
			url:"inquiry_passCheck.do?iid="+iid+"&pass="+pass,
			success:function(result){
					if(result == 'ok'){
						location.replace("inquiry_content.do?iid="+iid);
					}else{
						$("#passCheckText").text("비밀번호가 틀렸습니다.").css("color","red");
						$("#inputPass").val("").focus();
						//alert("비밀번호가 틀렸습니다.");	 
					}				
				}
			}); 	
			
		}//checkPass
	 
		 
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
	           $(location).attr('href', "http://localhost:9000/hotel/inquiry_list.do?rpage="+e.page);         
	    });
				
 	});
</script>
<script>
	$(document).ready(function(){
	
		//문의글 검색
		var search="${search}";
		
		if(search == "search"){
				$(".search_list").val("${searchlist}").prop("selected", true);
			}else{
				$(".search_list").val("title").prop("selected", true);
			}
			
		$("#btnSearch").click(function(){
			if($("#searchName").val()==""){
				alert("내용을 입력해 주세요.");
				$("#searchName").focus();
			}else{
				list_search.submit();
			}

		});//click	
		
	});//ready
</script>
<style>
.lnbAreaMenuBar{ float:left; }
.lnbAreaMenuBar .MenuBar > .tit{ margin:0 0 29px 0; height:53px; background:url(http://localhost:9000/hotel/resources/img/lnbTitle.gif); display:block; /* text-indent:-9999%; */ overflow:hidden;}
.MenuBar{ font-family:나눔명조OTF ExtraBold; width:216px; border:#ebe7e3 solid 1px; background:#ebe7e3; padding:23px; margin:0 0 30px 0;}
.MenuBar .tit { margin-top:7px; font-family:나눔명조OTF; font-weight: lighter; color:rgb(88,88,88); margin:0;}
.MenuBar .menu{ list-style:none; margin-top:20px; padding:0;}
.MenuBar img { margin-left: -8px; margin-top: 9px; }
.menu li a { color:rgb(88,88,88); }
.menu img { float:right; margin-top:-18px; display:inline-block; }
.MenuBar li{ margin:0 0 26px 0;}
.MenuBar li a{ text-decoration:none; /* background:#9CC; */ height:21px; display:block;   /* text-indent:-9999%; */ overflow:hidden;}
.MenuBar li a span{ margin-left:7px; display:block; margin-top:2px;} 
.MenuBar li a.on{ font-weight:bold; background-color:rgb(119,114,109); color:white;}
.MenuBar li li{ margin:0;}
.MenuBar li li a{ background:#CC6; display:block;}
.MenuBar li li a.on{ font-weight:bold;}

.contain { display:flex; width:1241px; height:895px; margin-right:202px; margin-bottom:100px; margin-left:202px;}
.container { margin-right:100px; }
.contents .location .list{  display:block; font-size:11px; background:url(http://localhost:9000/hotel/resources/img/locaton.gif) no-repeat 0 1px; line-height:12px; padding:0 0 0 17px;}

.tableTypeF{ border:none; border-top:#cdcbbe solid 1px; width:100%; border-collapse:collapse; table-layout:auto;}
.tableTypeF th,
.tableTypeF td{ border:none; padding:6px 13px; text-align:left; line-height:22px; border-bottom:#eceae1 solid 1px; color:#333333}
.tableTypeF th{color:#666; background:#faf9f4; text-align:center;}
.tableTypeF td{ background:#FFF; color:#1b1b1b}
.tableTypeF td strong{ margin-left:30px; }
.tableTypeF .last th, .tableTypeF .last td {border-bottom:#cdcbbe solid 1px; }

.list { float:right; }
.tit { color: rgb(88,88,88); font-family: 나눔명조OTF; font-size:26px; margin-top:0; margin-bottom:10px;}
.tit1 { color: rgb(88,88,88); font-family: 나눔명조OTF; font-size:26px; margin-top:30px; margin-bottom:10px;}
#linewrite { margin-bottom: 5px; }

/**************** 추가 ***************/
#btnInquiry { background-color:rgb(58,49,37); color:rgb(250,241,208); height: 34px; float:right; margin-top:-15px;}
#listtable { border-collapse:collapse; text-align:center; width:869px; border-color:#cdcbbe; }
#listtable tr:first-child { background-color: #ebe7e3; height:38px; font-size:16px;}
#tabletitle { width:340px; }
#listtable tr { height:37px; font-size:14px; }
#listtable tr:last-child > td { border-color: white; }
#listtable a { color:black; text-decoration:none; }
#search { text-align:center; margin-top: 25px; }
#searchspan { font-size:12px; }
.search_list { height:22px; }
#searchName { height: 17px; }
#btnSearch { background-color: rgb(58,49,37); color: rgb(250,241,208); height: 23px; font-size: 12px; }
#ampaginationsm { height:80px; }
#ampaginationsm ul { margin-top:35px; }
.commentimg { background : url(http://localhost:9000/hotel/resources/img/commentimg.jpg); background-size:contain; width: 21px; height: 21px; display: inline-block; float: right; margin-left: -36px; margin-right: 15px;}

</style> 
</head>
<body>
	<!-- Header Include -->
	<iframe></iframe>

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
								<a href="inquiry_my_list.do"><span>내문의함</span></a>
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
								<th class="pe_qK" rowspan="2">00호텔</th> 
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
							<td>writer</td>
							<td>${ vo.idate }</td>
						</tr>
						</c:forEach>
						<tr>
							<td colspan="6"><div id="ampaginationsm"></div></td>
						</tr>
					</table>
								<!-- div를 forEach안에 두면 계속 생겨서 오류걸림, 밖으로 빼기 -->
								<div id="ex1" class="modal">
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
							<option value="hotel">호텔선택</option>
							<option value="inquiry">문의선택</option>
						</select>
						<input type="text" name="keyword" id="searchName">
						<button type="button" id="btnSearch">찾기</button>
					</form>
				</div>
										
			</div>					
		</div>

	
	</div>

	<!-- Footer Include -->
	<iframe src="hotel_footer.do" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
</body>
</html>