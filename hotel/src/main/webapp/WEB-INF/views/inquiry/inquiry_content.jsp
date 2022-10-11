<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Inquiry</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>
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

.contain { display:flex; width:1241px; height:1200px; margin-right:202px; margin-bottom:100px; margin-left:202px;}
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

/*******************/
.customerBoard { border-collapse:collapse; text-align:center; width:869px; border-color:#cdcbbe; margin-left: 5px; }
.customerBoard tr:first-child { background-color: #ebe7e3; height:38px; font-size:16px;}
.customerBoard tr { height:35px; font-size:14px; }
.customerBoard a { color:black; text-decoration:none; }
.customerBoard td { text-align: left; padding-left: 10px; }
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
					<table border=1 class="customerBoard">
						<input type="hidden" >
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
						
						<!-- 작성자는 id값을 가져온다. 지금은 수동으로 넣음 -->
						<tr>
							<th colspan="2">작성자</th>
							<td colspan="2">test1</td>
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
	  					<img src="http://localhost:9000/hotel/resources/img/delete.png" width=20%>
	  					<p>정말로 <strong style="color:red">삭제</strong>하시겠습니까?</p>
	  					<button type="button" id="modal_delete">삭제</button></a>	
	 					<a rel="modal:close" >취소</a>
					</div>
					
					
					<div id="ex2" class="modal">
						<p id="passCheckText"><strong>비밀번호</strong>를 입력해주세요.</p>
				  		<input type="text" id="inputPass">
				  		<button type="button" id="passCheck">확인</button>
				 		<a rel="modal:close" >취소</a>
					</div>			
					
					<div id="ex3" class="modal">
	  					<img src="http://localhost:9000/hotel/resources/img/delete.png" width=20%>
	  					<p>정말로 <strong style="color:red">삭제</strong>하시겠습니까?</p>
	  					<a href="#ex2" rel="modal:open" id="${vo.iid}" onclick="modalopen3('${vo.iid}')"><button type="button" id="modal_delete">삭제</button></a>	
	 					<a rel="modal:close" >취소</a>
					</div>
															
				</div>
				
			</div>					
		</div>

	
	</div>

	<!-- Footer Include -->
	<iframe src="hotel_footer.do" width="100%" height="530px" scrolling="no" frameborder=0></iframe>
</body>
</html>