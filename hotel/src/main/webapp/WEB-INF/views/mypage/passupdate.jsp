<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/update.css">
<meta charset="UTF-8">
<script>
let passUpdate = '${passUpdate}';

if(passUpdate == 'fail'){
	alert("현재 비밀번호가 일치하지 않습니다.");	
}

</script>
</head>

<body>

	 <form name="passcheckupdate"  action="passcheckupdate.do"  method="post">
	 <%@ include file="./left_bar.jsp" %>
<div class="contain">
	
		<div class="container">
	<div class="contents" id="contents">


		
	
		<input type="hidden" name="mid" id="mid" value=${svo.mid} >

			
	
		
		<div class="contents" id="contents">
			<div class="passupdatecon">
			
				<div class="location">
					<p class="list"><span class="crPosit">현재 페이지 위치 : </span> &gt; 마이페이지 &gt; 내정보  &gt; <strong>비밀번호 변경</strong></p>
				</div>
				
				<div class="myPasswordmodifyTit">
					<h4 class="tit">비밀번호 변경</h4>
				</div>
			
		
				
				<div class="hTitS">
					
				</div>
				<table class="tableTypeA tablePwMod" summary="현재 비밀번호,새비밀번호,새비밀번화확인으로 구성된 테이블">
					<caption>비밀번호 변경</caption>
					<colgroup>
						<col width="15%" class="col1">
						<col class="col2">
					</colgroup>
					<tbody>
						<tr class="first">	
						<th scope="row" class="first">
						<label for="mbrPw" class="pwNow">현재 비밀번호</label>
						  <span id="passCheckMsg3"></span>
						</th>
						
						<td class="first">
						<input type="password"  id="mbrpass" name="mbrpass" class="pwNow" style="width: 143px;"></td>
					</tr>
					<tr>
						<th scope="row"><label for="mbrNewPw" class="pwNew">새 비밀번호</label></th>
						<td>
							<input type="password" id="npass" name="npass" class="pwNew uiform" style="width: 143px;">
							<div class="pwGuideBox">
								<a href="javascript:;" class="btnPwHelp"><span>비밀번호입력안내</span><em class="icoHelp"></em></a>
								<div class="pwGuide" style="display: none;">
									<h4 class="tit">비밀번호 입력 시 아래의 사항을 참고하시어 안전한 정보 입력을 권장합니다.</h4>
									<ul class="list">
										<li class="first"> 아이디 및 아이디를 포함한 문자/숫자는 비밀번호로 사용할 수 없습니다.</li><li> 동일하거나 연속되는 문자 또는 숫자는 사용 불가능합니다.  예) aaa,111</li><li>생일, 주민등록번호 등 타인이 알아내기 쉬운 비밀번호는 사용을 자제해 주시기 바랍니다.	</li><li class="last">비밀번호는 3~6개월에 한번씩 주기적으로 바꾸어 사용	하시는 것이 안전합니다. </li></ul>
									<a href="javascript:;" class="btnClose"><span>닫기</span></a>
								</div>
							</div>
	
							<span class="msgCheck">8~20자 이내 영문/숫자 조합(특수문자 입력 가능)</span>
						</td>
					</tr>
					<tr class="last">
						<th scope="row" class="last">
						<label for="pwNewCom" class="pwNewCom">새 비밀번호 확인</label>
						<span id="passCheckMsg4"></span>
						</th>
						<td class="last">
							<input type="password" id="nhpass" name="nhpass" class="pwNewCom uiform"  style="width: 143px;" >
						</td>
					</tr>
				</tbody></table>
				
				<div class="btnList">
						 <button type="button" class="btnChange" id="btnpassupdate">확인</button>
						  <button type="button" class="btnCancel" onclick="location.href = 'http://localhost:9000/hotel/mypage.do';">취소</button>
				</div>
				
			</div>
		</div>
					</div>

		</div>
	
	</div>
			</form>

</body>
</html>