<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<title>Customer Inquiry</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<!-- <script src="http://localhost:9000/hotel/resources/js/inquiry.js"></script>
<script src="http://localhost:9000/hotel/resources/js/inquiry_javascript.js"></script> -->
<script>
	$(document).ready(function(){
		$("#btnInquiryUpdate").click(function(){
		var isCheck = $('input[name=hotelname]:checked').val();
			
			if(!isCheck){
				alert("호텔을 선택해 주세요.");
				$("#hotelname").focus();
				return false;
			}else if($("#category").val()=="default"){
				alert("질문유형을 선택해주세요");
				$("#category").focus();
				return false;
			}else if($("#title").val()==""){
				alert("제목을 입력해주세요.");
				$("#title").focus();
				return false;
			} else if($("#secretnum").val()==""){
				alert("비밀번호에 숫자 4자리를 입력하세요");
				$("#secretnum").focus();
				return false;
			}else{
				//서버전송
				inquireUpdateForm.submit();
			}
		});	//click
		
		$("input[type=file]").change(function(){
			if(window.FileReader){//파일선택창이 열렸으면~
				let fname = $(this)[0].files[0].name; //$(this)[0] input타입 파일태그 여러개일때 첫번째인것
				$("#upload_file").text(fname);
			}
		});//change	
		
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

#category {width:100px; height:23px; margin-left: -276px;}
#passwordlable { margin-left:30px; }
#secretnum { height:23px; width: 41px; letter-spacing: 3px; padding-left: 10px;}
#category,  #secretnum{ border: #CCC solid 1px; }
#category, .titlearea, #secretnum, .contentarea:focus{
	outline: none;
}
.selector {word-spacing: 10px;}

#btnlist { text-align:center; margin-top:50px; }
.content_list_two{ margin-top: -25px; font-weight: 500; margin-left: 10px; height: 20px; display: block; align-items: center; font-size: 14px; color:var(--hub-font);}
/***************/
.tableTypeA{margin:20px 0px 0px 0px;border:none;border-top:#cdcbbe solid 1px; width:100%;border-collapse:collapse;table-layout:fixed;}
.tableTypeA th,
.tableTypeA td{border:none;padding:6px 13px;text-align:left;line-height: 22px;border-bottom:#eceae1 solid 1px;color:#333333;}
.tableTypeA th{color:#666; background:#faf9f4; }
.tableTypeA td{ background:#FFF; color:#1b1b1b}
.tableTypeA .last th,.tableTypeA .last td {border-bottom:#cdcbbe solid 1px;}
.tableTypeA .bdBot{border-bottom:#cdcbbe solid 1px !important; }

.contentarea { width:670px; height:180px; vertical-align: middle; }
.titlearea { width:668px; height:23px; vertical-align: middle;}
#passwordlable { margin-left:30px; }
#category, .titlearea, #secretnum, .contentarea { border: #CCC solid 1px; }
#btnlist { text-align:center; margin-top:50px; }
#upload_file { position:relative; display:inline-block; background-color: white; font-size:14px; width:120px; left:-181px; }
#btnInquiryUpdate, #btnInquiryList, #btnRest { background-color:rgb(58,49,37); color:rgb(250,241,208); width:99px; height:35px; vertical-align: middle; font-size:14px; font-weight: bold; }
.ast {color:red;}
.selector {word-spacing: 10px;}
#secretnum { width: 47px; height: 23px; padding-left: 8px; letter-spacing: 2px; font-size: 20px;}
/***********추가******************/
#upload_file { position:relative; display:inline-block; background-color: white; font-size:14px; width:120px; left:-181px; }
#btnInquiryUpdate, #btnInquiryList, #btnRest { background-color:rgb(58,49,37); color:rgb(250,241,208); width:99px; height:35px; vertical-align: middle; font-size:14px; font-weight: bold; }

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
			<form name="inquireUpdateForm" id="inquireForm" method="post" enctype="multipart/form-data" action="inquiry_update_check.do">
			<input type="hidden" name="iid"  value="${ vo.iid }" >
			<input type="hidden" name="ifile"  value="${ vo.ifile }" >
			<input type="hidden" name="isfile"  value="${ vo.isfile }" >
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
					<img id="linewrite" src="http://localhost:9000/hotel/resources/img/inquiry/linewrite.jpg">
					<table class="tableTypeA tableCustomer">
						<colgroup>
							<col width="16%" class="col1">
							<col width="50%" class="col2">
							<col width="18%" class="col3">
							<col width="16%" class="col4">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<label class=""> <span class="ast">*</span> 구분 </label>
								</th>
								<td colspan="3">
									<div class="selector">
										<input type="radio" name="hotelname" value='신라호텔'><span>신라호텔</span>
										<input type="radio" name="hotelname" value='신라스테이'><span>신라스테이</span>
										<input type="radio" name="hotelname" value='호텔개발'><span>호텔개발</span>
									</div>
								</td>
							</tr>
							<tr class="rq-type-rwd" id="show1" style="display: table-row;">
								<th scope="row">
									<label class=""> <span class="ast">*</span> 질문유형 </label>
								</th>
								<td colspan="3">
									<div class="selector" id="selectForm" style="width: 135px;">
										<select id="category" name="category">
											<option disabled="선택">선택</option>
											<option value="예약문의" title="Reserve">예약문의</option>
											<option value="계정문의" title="Account">계정문의</option>
											<option value="기타" title="ETC">기타</option>
										</select>
									</div>
								</td>													
							</tr>
							<tr>
								<th scope="row">
									<label ><span class="ast">*</span> 제목</label>
								</th>
								<td colspan="3">
									<input type="text" class="titlearea" name="title" id="title" value="${ vo.title }">
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label class=""><span class="ast">*</span> 내용<br></label>
								</th>
								<td colspan="3">
									<textarea name="content" class="contentarea">${ vo.content }</textarea>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label>파일첨부</label>
								</th>
								<td colspan="3">
									<input type="file" name="file1">
									<c:choose>
										<c:when test="${vo.ifile != null}">
											<span id="upload_file">${vo.ifile}</span>
										</c:when>
										<c:otherwise>
											<span id="upload_file">선택된 파일 없음</span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>	
							<tr>
								<th scope="row">글설정</th>
								<td colspan="3">
									<div class="secret_form">
										<input class="secret_input" type="checkbox" name="secret" id="secret" checked="checked" value=1 >
										<label class="secret_label">비밀글</label>
										<span>
											<label id="passwordlable"> <span class="ast">*</span>비밀번호</label>
											<input type="password" name="secretnum" id="secretnum" value="${ vo.secretnum }">
										</span>
									</div>
								</td>	
							</tr>	
						</tbody>	
					</table>
					<div id="btnlist">
						<button type="button" id="btnInquiryUpdate" >수정완료</button>
						<button type="reset" id="btnRest">Reset</button>
						<a href="inquiry_list.do"><button type="button" id="btnInquiryList">목록</button></a>
					</div>
				</div>
			</form>
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