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
<title>Customer Inquiry</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
<!-- <script src="http://localhost:9000/hotel/resources/js/inquiry.js"></script> -->
<!-- <script src="http://localhost:9000/hotel/resources/js/inquiry_javascript.js"></script> -->
<script>	
	//전체글 수정하기 버튼 클릭 시, 비번체크
	function modalopen2(iid){ 
		$("#passCheck").attr('onclick',"checkPass2('"+iid+"')");
	 }
 
	 function checkPass2(iid){
		
		const pass = $("#inputPass").val();
		
		
		$.ajax({
			url:"inquiry_passCheck.do?iid="+iid+"&pass="+pass,
			success:function(result){
					if(result == 'ok'){
						location.replace("inquiry_update.do?iid="+iid);
					}else{
						$("#passCheckText").text("비밀번호가 틀렸습니다.").css("color","red");
						$("#inputPass").val("").focus();
						//alert("비밀번호가 틀렸습니다.");	 
					}				
				}
			}); 	
			
		}//checkPass2()
		
		//전체글이면 삭제실행전에 비번체크하기 후 삭제
		function modalopen3(iid){
			$("#passCheck").attr('onclick',"checkPass3('"+iid+"')");
		 }
	 
		 function checkPass3(iid){
			const pass = $("#inputPass").val();
			
			$.ajax({
				url:"inquiry_passCheck.do?iid="+iid+"&pass="+pass,
				success:function(result){
						if(result == 'ok'){
							inquiryDeleteForm.submit();
		
						}else{
							$("#passCheckText").text("비밀번호가 틀렸습니다.").css("color","red");
							$("#inputPass").val("").focus();
						}				
					}
				}); 	
				
			}//checkPass3()
	
	
	$(document).ready(function(){
		
	//삭제 버튼 누르면 삭제 실행하기 - 비밀은 바로 삭제
		$("#modal_delete").on('click', function (){
			inquiryDeleteForm.submit();
		});//click
		
		
		//문의글 답변 상세보기 iid값 받아서 replyContent()실행
		$("input[name=iid]").each(function(){
			replyContent($(this).attr("value"));
		}); 
			
		
		//문의글 답변 상세보기 출력
		function replyContent(iid){
			//alert("상세보기 iid="+iid);
			$.ajax({
				url : "admin_reply_content_json.do?iid="+iid,
				success : function(result){
					//alert(result);
					let data = JSON.parse(result);
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
						text += "<td id='replycontent' height=100px colspan='4'>"+ data.recontent +"</td>";										
						text += "</tr>";
						text += "</table>";
				
						//출력
						if(data.hcount != 0){
							$("#replytable").remove();
							$(".customerBoard").after(text);
							
						}else{
							$("#replytable").remove();
						}
					}//if-end
					
				}//success
				
			});//ajax
			
		}//replyContent() 
		
		
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
.replytable { width: 868px; border-collapse: collapse; margin-left: 5px; border-color:#cdcbbe; margin-top: 20px; }
.replytable tr:first-child { background-color: #ebe7e3; }
.replytable #replycontent { vertical-align: text-top; padding: 10px; }

[alt="shillastay"]{
margin: 10px 0;
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
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_list.do" class="content_list content_selected">고객센터</a></li>
		              <li id="content_list_one"><a href="http://localhost:9000/hotel/inquiry_my_list.do?mid=${sessionScope.svo.mid }" class="content_list_two"> - 내문의함</a></li>
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
						<table class="tableTypeF tableFactSheet tableBold" style="height: 139px;" border> 
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
					<table border=1 class="customerBoard">
						<input type="hidden" >
						<tr class="inquiry-table-state">
							<th>등록일자</th>
							<td>${ vo.idate }</td>													
							<th>처리상태</th>
							
							<c:choose>
								<c:when test="${vo.rcount == 0}">
									<td>진행중</td>
								</c:when>
								<c:otherwise>
									<td>답변완료</td>
								</c:otherwise>
							</c:choose>
							
						</tr>
						<tr>
							<th colspan="1">문의유형</th>
							<td colspan="3">${ vo.category }</td>
						</tr>
						<tr>
							<th colspan="1">제목</th>
							<td colspan="3">${ vo.title }</td>
						</tr>
						
						<tr>
							<th colspan="1">내용</th>
							<td colspan="3" class="tablecontent" name="content" id="content">${ vo.content }<br><br>
								<!-- 파일업로드 출력 / 파일이 있는지 없는지 확인해서 출력 -->
								<c:if test="${vo.isfile != null}">
									<img src="http://localhost:9000/hotel/resources/upload/${vo.isfile}"
									width="40%">
								</c:if>
							</td>
						</tr>

					</table>
  					<form name="inquiryDeleteForm" action="inquiry_delete_check.do" method="post">
	  				<input type="hidden" name="iid" value="${vo.iid}">
 					</form>	
 					
 					<div id="btnlist"> 
 			
 						<c:choose>
 							<c:when test="${vo.secret == 0 }">
 								<a href="#ex2" rel="modal:open" id="${vo.iid}" onclick="modalopen2('${vo.iid}')"><button type="button" id="btn_InquiryUpdate">수정하기</button></a>		
								<a href="#ex3" rel="modal:open"><button type="button" id="btn_InquiryDelete">삭제하기</button></a>
 							</c:when>
 							<c:otherwise>
								<a href="inquiry_update.do?iid=${vo.iid }"><button type="button" id="btn_InquiryUpdate">수정하기</button></a>		
								<a href="#ex1" rel="modal:open" ><button type="button" id="btn_InquiryDelete">삭제하기</button></a>
 							</c:otherwise>
 						</c:choose>
 						
						<a href="inquiry_list.do"><button type="button" id="btn_InquiryList">목록</button></a>
					</div>
					
					<div id="ex1" class="modal">
	  					<img src="http://localhost:9000/hotel/resources/img/inquiry/delete.png" width=20%>
	  					<p>정말로 <strong style="color:red">삭제</strong>하시겠습니까?</p>
	  					<button type="button" id="modal_delete">확인</button></a>	
	 					<a rel="modal:close" >취소</a>
					</div>
					
					
					<div id="ex2" class="modal">
						<img src="http://localhost:9000/hotel/resources/img/inquiry/lock.png" width=20%>
						<p id="passCheckText"><strong>비밀번호</strong>를 입력해주세요.</p>
				  		<input type="text" id="inputPass">
				  		<button type="button" id="passCheck">확인</button>
				 		<a rel="modal:close" >취소</a>
					</div>			
					
					<div id="ex3" class="modal">
	  					<img src="http://localhost:9000/hotel/resources/img/inquiry/delete.png" width=20%>
	  					<p>정말로 <strong style="color:red"><u style="color:red">삭제</u></strong>하시겠습니까?</p>
	  					<a href="#ex2" rel="modal:open" id="${vo.iid}" onclick="modalopen3('${vo.iid}')"><button type="button" id="modal_delete">확인</button></a>	
	 					<a rel="modal:close" id="cancel">취소</a>
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