<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/am-pagination.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<title>Admin Inquiry</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/am-pagination.js"></script>
<!-- <script src="http://localhost:9000/hotel/resources/js/admin_inquiry.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry_javascript.js"></script> -->
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
			admin_list_search.submit();
		}
	
	});//click	
	
	
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
#ex1 { text-align:center; }
#ex3 { text-align:center; }
#modal_delete { background-color: white; font-size: 16px; color: rgb(58,49,37); font-weight: 800; }
#passCheck{background: none; border: none; font-size: 15px; font-weight: 700; margin-left: 5px; margin-right: 3px;}
#passCheckText {margin-bottom: 15px; font-size: 17px; text-align: center; margin-top: 7px;}
.modal {text-align: center; height: 200px;}
#ex2 img {margin-top: 3px;}
#ex2 a {margin-top: 8px;}
#cancel {color: black; font-weight: 600;}
#ex3 p {margin-top: 10px; font-size: 19px;}
#replynone, #resetbutton{border:none; background-color:white;}
#nonetable{float: right; margin-right: 6px; margin-bottom: 10px;}

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
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_notice_list.do" class="content_list ">공지사항</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_event_list.do" class="content_list">이벤트</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/admin_inquiry_list.do" class="content_list content_selected">고객센터</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/main.do" class="content_list">객실관리</a></li>
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
						<span> | </span>
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
						
						<c:choose>
								<c:when test="${listSize == 0}">
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
					</c:otherwise>
				</c:choose>
						
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
	<%@ include file="../footer.jsp" %>
	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(3).children().first().css("color","white");
 	</script>
</body>
</html>