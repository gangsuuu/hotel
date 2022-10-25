<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<% pageContext.setAttribute("if", "\n"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/inquiry.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<title>Customer Inquiry</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script>
	//문의글 등록하기
	$(document).ready(function(){
		$("#btnInquiryWrite").click(function(){
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
			}else if($("#secretNum").val()==""){
				alert("비밀번호 숫자 4자리를 입력하세요.");
				$("#secretNum").focus();
				return false;
			}else if($("input[name='privacyChk']:checked").length==0){
				alert("약관동의를 체크해주세요.");
				$("#privacyChk1").focus();
				return false;
			}else{
				//서버전송
				inquireWriteForm.submit();
			}
		});
		 			
	});//ready 
	
	function mykey(){
		var key = $("#content").val().replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$("#content").val(key);
		
		var key = $("#content").val();
		key = key.split('<br>').join("\r\n");
		$("#content").val(key);
	}

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


.contain { display:flex; justify-content: center; width:1241px; height:895px; margin-right:202px; margin-bottom:100px; margin-left:202px;}
.container { margin-right:100px; }
.contents .location .list{  display:block; font-size:11px; background:url(http://localhost:9000/hotel/resources/img/inquiry/locaton.gif) no-repeat 0 1px; line-height:12px; padding:0 0 0 17px;}

.tableTypeA{margin:20px 0px 0px 0px;border:none;border-top:#cdcbbe solid 1px; width:100%;border-collapse:collapse;table-layout:fixed;}
.tableTypeA th,
.tableTypeA td{border:none;padding:6px 13px;text-align:left;line-height: 22px;border-bottom:#eceae1 solid 1px;color:#333333;}
.tableTypeA th{color:#666; background:#faf9f4; }
.tableTypeA td{ background:#FFF; color:#1b1b1b}
.tableTypeA .last th,.tableTypeA .last td {border-bottom:#cdcbbe solid 1px;}
.tableTypeA .bdBot{border-bottom:#cdcbbe solid 1px !important; }

.contentarea { width:670px; height:180px; vertical-align: middle; border:none; resize: none; overflow:auto; }
#category, .titlearea, #secretnum, .contentarea:focus{
	outline: none;
}
.titlearea { width:668px; height:23px; vertical-align: middle; padding-left: 5px;}
#category {width:100px; height:23px; margin-left: -276px;}
#passwordlable { margin-left:30px; }
#secretnum { width: 47px; height: 23px; padding-left: 8px; letter-spacing: 2px; font-size: 20px;}
#category, .titlearea, #secretnum { border: #CCC solid 1px; }

.list { float:right; }
.tit { color: rgb(88,88,88); font-family: 나눔명조OTF; font-size:26px; margin-top:0; margin-bottom:10px;}

.privacy { margin:20px 0 7px 0; font-size:16px; }
.clauseBox{ margin:0 0 10px 0;}
.clauseBox .scBox{ font-size:12px; border:#CCC solid 1px; height:60px; overflow:auto; overflow-x:hidden ;padding:10px;  margin:0 0 5px 0;}
#btnWrite { text-align: center; }
#btnInquiryWrite { margin-top:35px; background-color:rgb(58,49,37); color:rgb(250,241,208); width:150px; height:44px; vertical-align: middle;
				   font-size:17px; font-weight: bold;}
.ast {color:red;}
.selector {word-spacing: 10px;}
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
	              </ul>
			 </div>
		 </div>		

	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
		<div class="contents" id="contents">
			<form name="inquireWriteForm" id="inquireForm" method="POST" enctype="multipart/form-data" action="inquiry_write_check.do">
			${ svo.mid }
				<input type="hidden" name="mid" value="${ svo.mid }">

				<div class="ctnInquires ctnCtUs">
					<div class="location">
						<p class="list">
							<span> </span>> 고객문의 > <strong>고객문의</strong>
						</p>
					</div>
					<div class="customerCenterTit">
						<h3 class="tit">문의하기</h3>
						<div class="content-block"></div>
					</div>
									
					<div class="account">
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
										<div class="selector" style="width: 135px;">
											<select id="category" name="category">
												<option value="default" >선택</option>
												<option value="예약문의" title="Reserve">예약문의</option>
												<option value="계정문의" title="Account">계정문의</option>
												<option value="기타" title="ETC">기타</option>
											</select>
										</div>
									</td>
								</tr>
								<tr id="inquiry_title">
									<th scope="row">
										<label ><span class="ast">*</span> 제목</label>
									</th>
									<td colspan="3">
										<input type="text" class="titlearea" id="title" name="title" size="70">
									</td>
								</tr>
								<tr id="inquiry_content">
									<th scope="row">
										<label class=""><span class="ast">*</span> 내용<br></label>
									</th>
									<td colspan="3">
										<textarea cols="50" rows="5" id="content" name="content" class="contentarea" placeholder="내용을 입력해주세요"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<label>파일첨부</label>
									</th>
									<td colspan="3">
										<input type="file" name="file1">
									</td>
								</tr>
								<tr>
									<th scope="row">글설정</th>
									<td colspan="3">
										<div class="secret_form">
		   									<input class="secret_input" type="checkbox" name="secret" id="secret" checked="checked" value=1>
		    								<label class="secret_label">비밀글</label>
			    							<span>
				    							<label id="passwordlable">비밀번호</label>
				    							<input type="password" name="secretnum" id="secretnum">
			    							</span>
										</div>
									</td>	
								</tr>
	           				</tbody>
						</table>
						<div class="privacyBox">			
							<div class="">
								<h4 class="privacy">필수적 개인정보 수집 및 이용에 대한 동의</h4>
							</div>
							<div class="clauseBox">
								<div class="scBox reg_cona newpd" tabindex="0">
									<p>신라호텔 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.<br><br>
									1. 필수적인 개인정보의 수집 ㆍ이용에 관한 사항<br>
									<b style="font-size:12px;">① 수집ㆍ이용&nbsp;항목 | 성명(국문·영문),&nbsp;이메일, 휴대전화</b><br>
									<b style="font-size:12px;">② 수집ㆍ이용&nbsp;목적 | 문의에 대한 안내 및 서비스 제공</b><br>
									<b style="font-size:12px;">③ 보유ㆍ이용 기간&nbsp;|&nbsp;수집ㆍ이용 동의일로부터 5년간</b><br>
									※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 제반 절차 진행이 불가능 할 수 있음을 알려드립니다.</p>
								</div>
							</div>
							<div>
								<input type="checkbox" class="privacycheckbox" id="privacyChk1" name="privacyChk" value="Y" autocomplete="off">
								<label>동의함</label>
							</div>
						</div>
						<div class="privacyBox">			
							<div class="hTitS hTitS1">
								<h4 class="privacy">선택적 개인정보 수집 및 이용에 대한 동의</h4>
							</div>
							<div class="clauseBox">
								<div class="scBox reg_cona newpd" tabindex="0">
									<p>신라호텔 고객의 문의 및 의견과 관련하여 귀사가 아래와 같이 본인의 개인정보를 수집 및 이용하는데 동의합니다.<br><br>
		  							선택적인 개인정보의 수집 ㆍ이용에 관한 사항<br>
									<b style="font-size:12px;">① 수집ㆍ이용 항목 | 자택전화</b> <br>
							        <b style="font-size:12px;">② 수집ㆍ이용 목적 | 문의에 대한 안내 및 서비스 제공</b><br>
									<b style="font-size:12px;">③ 보유ㆍ이용 기간 | 수집ㆍ이용 동의일로부터 5년간</b><br>
									※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 문의에 대한 안내 및 서비스 제공과 관련된 일반전화 안내 진행이 불가능 할 수 있음을 알려드립니다.</p>
								</div>
							</div>
							<div>
								<input type="checkbox" class="privacycheckbox" id="privacyChk2" name="personInfoUseYn" autocomplete="off" value="N">
								<label>동의함</label>          
							</div>
						</div>
						<div id="btnWrite">
							<button type="button" id="btnInquiryWrite" onclick="mykey()">등록</button>
						</div>	
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