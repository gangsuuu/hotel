<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>

<title>Admin Inquiry</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry_javascript.js"></script>
<script>
$(document).ready(function(){
	//관리자 문의글 삭제처리
		$("#modal_delete").on('click', function(){
			adminDeleteForm.submit();
		});//click
		
		
		//관리자 문의글 수정처리
		$("#btn_ReplyWrite").on('click', function(){
			replyinquiry.submit();
		});//click
		
		
		//문의글 답변 상세보기 iid값 받아서 replyContent()실행
		$("input[id=replywrite]").each(function(){
			//alert($(this).attr("value"));
			//alert($(this).attr("id"));
			replyContent($(this).attr("value"));			
		}); 
			
		
		//문의글 답변 상세보기 출력
		function replyContent(iid){
			//alert("상세보기 iid="+iid);
			$.ajax({
				url : "reply_content_json.do?iid="+iid,
				success : function(result){
					let data = JSON.parse(result);
					//alert(result);
					//alert(data.hcount);
					if(data.reply == 0){
						//alert("reply=0");
					}else{
						let text = "<table border=1 class='replytable'>";
						text += "<tr>";
						text += "<th>작성자</th>";
						text += "<td>관리자</td>";
						text += "<th>등록일자</th>";
						text += "<td>"+ data.redate +"</td>";
						text += "</tr>";
						text += "<tr>";
						text += "<td id='replycontent' height=100px colspan='4'>"+ data.recontent +"<button type='button' id='replydelete'>x</button></td>";										
						text += "</tr>";
						text += "</table>";
					
						//출력
						if(data.hcount != 0){
							$("#replytable").remove();
							$(".customerBoard").after(text);
							
						}else{
							$("#replytable").remove();
						}
					
						//삭제버튼 실행
						$("#replydelete").click(function(){
							replyDeleteForm.submit();
						});
						
					}//if-end
						
				}//success
				
			});//ajax
			
		}//replyContent() 
	
});//ready

</script>
<style>
#passCheck{background: none; border: none; font-size: 15px; font-weight: 700; margin-left: 5px; margin-right: 3px;}
#passCheckText {margin-bottom: 15px; font-size: 17px; text-align: center; margin-top: 7px;}
.modal {text-align: center; height: 200px;}
#ex2 img {margin-top: 3px;}
#ex2 a {margin-top: 8px;}
#cancel {color: black; font-weight: 600;}
#ex3 p {margin-top: 10px; font-size: 19px;}

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


.contents{
	margin: 0;
	width: 850px;
}


.contain { display:flex; width:1241px; height:1200px; margin-right:202px; margin-bottom:100px; margin-left:202px;}
.container { margin-right:100px; }
.contents .location .list{  display:block; font-size:11px; background:url(http://localhost:9000/hotel/resources/img/inquiry/locaton.gif) no-repeat 0 1px; line-height:12px; padding:0 0 0 17px;}

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
.content_list_two{ margin-top: -25px; font-weight: 500; margin-left: 10px; height: 20px; display: block; align-items: center; font-size: 14px; color:var(--hub-font);}

/*******************/
.customerBoard { border-collapse:collapse; text-align:center; width: 850px;px; border-color:#cdcbbe; margin: 10px 0 0 0; }
.customerBoard tr:first-child { background-color: #ebe7e3; height:38px; font-size:16px;}
.customerBoard tr:first-child td, .customerBoard tr:nth-child(2) td { text-align:center;}
.customerBoard tr:nth-child(2) { background-color: #ebe7e3; height:38px; font-size:16px;}
.customerBoard tr { height:35px; font-size:14px; }
.customerBoard a { color:black; text-decoration:none; }
.customerBoard td { text-align: left; padding-left: 10px; }
.inquiry-table-state{
}
.inquiry-table-state th{
	width: 160px;
}
.inquiry-table-state td{
	width: 228px;
}

.tablecontent { height:340px; vertical-align: top; text-align: left; padding-left: 10px; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; }
#btnlist { text-align:center; margin-top:50px; }
#btn_InquiryUpdate, #btn_InquiryDelete, #btn_InquiryList { background-color:rgb(58,49,37); color:rgb(250,241,208); width:99px; height:35px; vertical-align: middle; font-size:14px; font-weight: bold; }
#ex1 { text-align:center; }
#ex3 { text-align:center; }
#modal_delete { background-color: white; font-size: 16px; color: rgb(58,49,37); font-weight: 800; }

#replydelete { float: right; margin-top: -1px; }
.replytable { width: 850px; border-collapse: collapse; border-color:#cdcbbe; margin-top: 20px; margin-left: 1px; }
.replytable tr:first-child { background-color: #ebe7e3; }
.replytable #replycontent { vertical-align: text-top; padding: 10px; }

[alt="shillastay"]{
margin: 10px 0;
}

#btn_InquiryUpdate, #btn_InquiryDelete, #btn_InquiryList, #btn_ReplyWrite { background-color:rgb(58,49,37); color:rgb(250,241,208); width:99px; height:35px; vertical-align: middle; font-size:14px; font-weight: bold; }
#ex1 { text-align:center; }
#modal_delete { margin-top: 15px; background-color: white; font-size: 17px; color: black; font-weight: 800; border: none; margin-right: 10px; }
.replywritetable { margin-left: 4px; text-align:center; margin-top:30px; }
.replywritetable th { height:40px; }
.replywritetable th label { padding: 7px 40px 7px 40px; width: 177px;
    background-color: #ebe7e3;
    border: 1px solid #ebe7e3;
    border-radius: 7px;
    margin-left: 73px;
    margin-right: 73px; }
.replywritetable .label1 { padding: 7px 32px 7px 32px; }
.replywritetable td input { width: 574px; height: 28px; padding:0; }
.replywritetable td textarea { border-color:#cdcbbe; width:574px; height: 90px; }
form[name='replyinquiry'] button { position: absolute; margin-top: 50px; margin-left: 164px; }

.customerBoard { border-collapse:collapse; text-align:center; width:869px; border-color:#cdcbbe; margin-left: 5px; }
.customerBoard tr:first-child { background-color: #ebe7e3; height:38px; font-size:16px;}
.customerBoard tr:first-child td, .customerBoard tr:nth-child(2) td { text-align:center;}
.customerBoard tr:nth-child(2) { background-color: #ebe7e3; height:38px; font-size:16px;}
.customerBoard tr { height:35px; font-size:14px; }
.customerBoard a { color:black; text-decoration:none; }
.customerBoard td { text-align: left; padding-left: 10px; }
.tablecontent { height:340px; vertical-align: top; text-align: left; padding-left: 10px; padding-top: 10px; padding-bottom: 0px; padding-right: 0px; }
#btnlist { text-align:center; margin-top:50px; }
#btn_InquiryUpdate, #btn_InquiryDelete, #btn_InquiryList { background-color:rgb(58,49,37); color:rgb(250,241,208); width:99px; height:35px; vertical-align: middle; font-size:14px; font-weight: bold; }
#ex1 { text-align:center; }
#ex2 { text-align:center; }
#ex3 { text-align:center; }
#modal_delete { background-color: white; font-size: 16px; color: rgb(58,49,37); font-weight: 800; }
#replydelete { float: right; margin-top: -1px; width: 20px;}
.replytable { width: 868px; border-collapse: collapse; margin-left: 5px; border-color:#cdcbbe; margin-top: 20px; }
.replytable tr:first-child { background-color: #ebe7e3; }
.replytable #replycontent { vertical-align: text-top; padding: 10px; }
</style>

</head>
<body>

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
					
					<h3 class="tit1">문의글</h3>
					<img id="linewrite" src="http://localhost:9000/hotel/resources/img/inquiry/linewrite.jpg">
					<table border=1 class="customerBoard">
						<tr>
							<th colspan="2">호텔선택</th>
							<td colspan="2">${vo.hotelname }</td>
						</tr>
						<tr>
							<th>문의유형</th>
							<td>${ vo.category }</td>
							<th>등록일자</th>
							<td>${ vo.idate }</td>													
						</tr>
						<tr>
							<th colspan="2">제목</th>
							<td colspan="2">${ vo.title }</td>
						</tr>
						
						<tr>
							<th colspan="2">작성자</th>
							<td colspan="2">${vo.mid }</td>
						</tr>
						
						<tr>
							<th colspan="2">내용</th>
							<td colspan="2" class="tablecontent" name="content" id="content">${ vo.content }<br><br>
								<!-- 파일업로드 출력 / 파일이 있는지 없는지 확인해서 출력 -->
								<c:if test="${vo.isfile != null}">
									<img src="http://localhost:9000/hotel/resources/upload/${vo.isfile}"
									width="40%">
								</c:if>
							</td>
						</tr>

					</table>
  					<form name="replyDeleteForm" action="reply_delete_check.do" method="post">
	  				<input type="hidden" name="iid" value="${vo.iid}">
 					</form>	
 					
 					<!-- 관리자 답글등록 창 -->
 					<form name="replyinquiry" id="replyinquiry" method="post" enctype="multipart/form-data" action="admin_reply_check.do">
					<input type="hidden" name="iid" id="replywrite" value="${ vo.iid }" >
	 					<table class="replywritetable">
							<tr>
								<th><label class="label1">작성자</label></th>
								<td><input type='text' value="관리자" disabled></td>
							</tr>
							<tr>
								<th><label>제목</label></th>
								<td><input type='text' name='admintitle' value="고객문의 답변드립니다." disabled></td>
							</tr>
							<tr>
								<th><label>내용</label></th>
								<td><textarea name='recontent' id="recontent"></textarea><td>
							</tr>
						</table>
	 					 	<button type="button" id="btn_ReplyWrite">답변등록</button>
						<!-- <button type="button" id="btn_ReplyWrite">답변등록</button> -->
 					</form> 					
 					
 					<form name="adminDeleteForm" action="admin_inquiry_delete_check.do" method="post">
	  				<input type="hidden" name="iid" value="${vo.iid}">
 					</form>
 					
 					<div id="btnlist">
						<a href="admin_inquiry_update.do?iid=${vo.iid }"><button type="button" id="btn_InquiryUpdate">수정하기</button></a>		
						<a href="#ex1" rel="modal:open"><button type="button" id="btn_InquiryDelete">삭제하기</button></a>
						<a href="admin_inquiry_list.do"><button type="button" id="btn_InquiryList">목록</button></a>
					</div>
					
					<div id="ex1" class="modal">
	  					<img src="http://localhost:9000/hotel/resources/img/inquiry/delete.png" width=20%>
	  					<p>정말로 <strong style="color:red">삭제</strong>하시겠습니까?</p>
	  					<button type="button" id="modal_delete" onclick="">삭제</button>	
	 					<a rel="modal:close" >취소</a>
					</div>
															
				</div>
				
			</div>					
		</div>

	
	
	
	</div>

	<!-- Footer Include -->
	<%@ include file="../footer.jsp" %>
</body>
</html>