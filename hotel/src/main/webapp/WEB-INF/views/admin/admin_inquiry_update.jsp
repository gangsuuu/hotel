<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/inquiry.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<title>Customer Inquiry</title>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry.js"></script>
<script src="http://localhost:9000/hotel/resources/js/admin_inquiry_javascript.js"></script>
<!-- <script>
	$(document).ready(function(){
		$("#btnInquiryUpdate").click(function(){
			if($("#category").val()=="default"){
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
</script> -->
</head>
<body>
	<!-- Header Include -->
	<%@ include file="../header.jsp" %>
	<!---------------------------------------------->
	<!--------------- MenuBar ---------------------->
	<!---------------------------------------------->
	
	<div class="contain">
		<div class="container">
			<div class="InAreaMenuBar">
				<div class="MenuBar">
					<h2 class="tit">고객문의</h2>
					<img src="http://localhost:9000/hotel/resources/img/inquiry/gline.jpg">
						<ul class="menu">
							<li class="">
								<a href="admin_inquiry_list.do" class="on"><span>전체 문의글</span><img src="http://localhost:9000/hotel/resources/img/inquiry/gline1.jpg"></a>
							</li>
							<li class="">
								<a href="admin_hotel_categori.do"><span>관리자홈</span></a>
							</li>		
						</ul>
				</div>
			</div>	
		</div>
		
	<!---------------------------------------------->
	<!--------------- Content ---------------------->
	<!---------------------------------------------->	
		<div class="contents" id="contents">
		<form name="inquireUpdateForm" id="inquireForm" method="post" enctype="multipart/form-data" action="admin_inquiry_update_check.do">
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
					    							<label id="passwordlable">비밀번호</label>
					    							<input type="password" name="secretnum" id="secretnum" value="${ vo.secretnum }">
				    							</span>
										</div>
									</td>	
								</tr>	
							</tbody>	
						</table>
						<div id="btnlist">
							<button type="button" id="btnInquiryUpdate">수정완료</button>
							<button type="reset" id="btnRest">Reset</button>
							<a href="admin_inquiry_list.do"><button type="button" id="btnInquiryList">목록</button></a>
						</div>
					</div>
					
				</div>					
			</div>
		</div>
	</form>
	
	<!-- Footer Include -->
	<%@ include file="../footer.jsp" %>
	<script>
 	$("[data-nav=service]").css("display","block");
 	$("[data-nav=service]").children().eq(3).children().first().css("color","white");
 	</script>
</body>
</html>