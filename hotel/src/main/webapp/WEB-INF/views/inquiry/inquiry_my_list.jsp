<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shill</title>
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
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
	   $(location).attr('href', "http://localhost:9000/hotel/inquiry_my_list.do?rpage="+e.page);         
	});
});//ready	
</script>
<script>
$(document).ready(function(){
	 /**********************
	 	inquiry-my-list
	 **********************/
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
					my_list_search.submit();
				}
			
		});//click		
});//ready

</script>
<style>
.lnbAreaMenuBar{ float:left; }
.lnbAreaMenuBar .MenuBar > .tit{ margin:0 0 29px 0; height:53px; background:url(http://localhost:9000/hotel/resources/img/inquiry/lnbTitle.gif); display:block; /* text-indent:-9999%; */ overflow:hidden;}
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
.contents {
	margin:0px;
	width: 850px;
}

.contents .location .list{  display:block; font-size:11px; background:url(http://localhost:9000/hotel/resources/img/inquiry/locaton.gif) no-repeat 0 1px; line-height:12px; padding:0 0 0 17px;}

.tableTypeF{ border:none; border-top:#cdcbbe solid 1px; width:100%; border-collapse:collapse; table-layout:auto;}
.tableTypeF th,
.tableTypeF td{ border:none; padding:6px 13px; text-align:left; line-height:22px; border-bottom:#eceae1 solid 1px; color:#333333}
.tableTypeF th{color:#666; background:#faf9f4; font-size:13px }
.tableTypeF td{ background:#FFF; color:#1b1b1b; font-size:13px }

.tableTypeF td strong{ margin-left:30px; font-size:13px }
.tableTypeF td span{font-size:13px }

.tableTypeF .last th, .tableTypeF .last td {border-bottom:#cdcbbe solid 1px; }
.tableTypeF>tobidy> tr:last-child>td {
background: red;
}
.list { float:right; }
.tit { color: rgb(88,88,88); font-family: 나눔명조OTF; font-size:26px; margin-top:0; margin-bottom:10px;}
.tit1 { color: rgb(88,88,88); font-family: 나눔명조OTF; font-size:26px; margin-top:30px; margin-bottom:10px;}
#linewrite { margin-bottom: 5px; }

/**************** 추가 ***************/

#btnInquiry {
 background-color:rgb(58,49,37); 
 color:rgb(250,241,208); 
 height: 34px; 
 float:right; 
 position:absolute;
 right:0;
 top:0; 
 width: 110px;
 font-weight:600;
  }
  
#listtable { 
	border-collapse:collapse; 
	text-align:center; 
	width:850px; 
	border:none; 
	margin-top:10px;
}

#listtable tr:first-child {
 background-color: #ebe7e3; 
 height:38px;
 font-size:12px; 
 color:rgb(125,120,115);
 border:1px solid #cdcbbe;
 }
 
 #listtable tbody{
 border:none;
 }
 
#tabletitle { width:340px; }
#listtable tr { height:37px; font-size:13px; }
#listtable tr:last-child > td {
 border:none; }
 
#listtable a { color:black; text-decoration:none; }
#search { text-align:center; margin-top: 25px; }
#searchspan { font-size:12px; }
.search_list { height:22px; } 
#searchName { 
	height: 17px; 
}
#searchName:focus{
outline: none;
}
#btnSearch { 
	background-color: rgb(58,49,37); 
	color: rgb(250,241,208); 
	height: 23px; 
	font-size: 12px; 
	width: 40px;
	border-radius: 2px;
}
#ampaginationsm { height:80px; }
#ampaginationsm ul { margin-top:35px; }
.commentimg { background : url(http://localhost:9000/hotel/resources/img/inquiry/feedback.png); background-size:contain; width: 21px; height: 21px; display: inline-block; float: right; margin-left: -36px; margin-right: 15px;}
#no {height: 200px; font-size:16px;}
#nokeyword { margin-bottom: 12px; font-size:18px; }
#solution { margin-right: 240px; }
#solution2 { text-align: left; margin-left: 333px; margin-bottom: 40px; }
.content_list_two{ margin-top: -25px; font-weight: 500; margin-left: 10px; height: 20px; display: block; align-items: center; font-size: 14px; color:var(--hub-font);}
.content_list_two_selected{ margin-top: -25px; font-weight: 500; padding-left: 10px; height: 20px; display: block; align-items: center; font-size: 14px; color:var(--hub-font); background: var(--theme2-subcategori); color: white;}
.content_list_two_selected::After{
        content:"";
        display: inline-block;
        width: 4px;height: 4px;
        position: absolute;
        top:40%;right: 10px;
        transform: rotate(45deg);
        border-top: 1px solid white;
        border-right: 1px solid white;
    }
 
/****		경수추가목록		******/
[alt="shillastay"]{
margin: 10px 0;
}
.content-inquery{
position: relative;
}
</style>
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
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/introhotel.do" class="content_list">호텔안내</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/guestservice/viewGuestService.do" class="content_list">인근명소</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/notice_list.do" class="content_list">공지사항</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_list.do" class="content_list">고객센터</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_my_list.do?mid=${sessionScope.svo.mid }" class="content_list_two_selected"> - 내문의함</a></li>
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
						<strong>내문의글</strong>
					</p>
				</div>
				
			<!---------- content start ---------->	
			<div class="account">
				<div class="headTit">
					<h3 class="tit">연락처</h3>
					<img src="http://localhost:9000/hotel/resources/img/inquiry/linewrite.jpg">
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
				
				<!---------- content start ---------->
				<h3 class="tit1">내문의글</h3>
				<img id="linewrite" src="http://localhost:9000/hotel/resources/img/inquiry/linewrite.jpg">
									
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
							<c:when test="${mlistSize == 0}">
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
								<c:forEach var="vo" items="${mlist}">
									<tr>
										<td>${ vo.rno }</td>
										<td>${ vo.hotelname }</td>
										<td>${ vo.category }</td>
										<td>
											<c:choose>
												<c:when test="${ vo.rcount != 0 }">
													<a href="inquiry_content.do?iid=${ vo.iid }">${ vo.title }<div class="commentimg"></div></a>
												</c:when>
												<c:otherwise>
													<a href="inquiry_content.do?iid=${ vo.iid }">${ vo.title }</a>
												</c:otherwise>
											</c:choose>		 
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
					
					<a href="inquiry_write.do"><button type="button" id="btnInquiry">문의하기</button></a>
					<form name="my_list_search" action="inquiry_my_list_search.do" method="post" id="search" >
						<span id="searchspan">검색어</span>
						<select class="search_list" name="searchlist" id="searchlist">
							<option value="default">선택</option>
							<option value="title">제목</option>
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
	<%@ include file="../footer.jsp" %>
	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(2).children().first().css("color","white");
 	</script>
 </body>
</html>