<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/hotel.css">
<script src="http://localhost:9000/hotel/resources/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/hotel/resources/js/myhotel_jquery.js"></script>
</head>
<div class="loginWrap">
	<div class="innerBox">
		<!-- 가로값이 1280으로 설정되어진 아이 -->
		<h1>
			<span>아이디/비밀번호 찾기</span>아이디 혹은 비밀번호를 잊으셨나요?<br>이메일 인증을 통해
			찾으세요.
		</h1>
	</div>
	<div class="fullBg">
		<div class="innerBox findIDPWD">
			<!-- 아이디 찾기 -->
			<div class="findId form">
				<h2>
					<label for="findID">아이디 찾기</label>
				</h2>
				<div class="inp">
					<input type="text" id="hname" name="hname" placeholder="이름"
						title="이름">
					<button class="btnDelete" style="display: none;">삭제</button>
				</div>

				<div class="phone">

					<div class="ui-select-wrapper">
						<select class="selectBox" id="hpum1" name="hpum1"
							title="휴대 전화 앞자리 선택" style="display: none;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<div class="selectBox" style="">
							<a href="#" class="ui-select-trigger active">010</a>
							<ul class="ui-select-options" style="display: block;">
								<li class=""><a href="#" class="ui-select-option"
									data-value="010">010</a></li>
								<li class=""><a href="#" class="ui-select-option"
									data-value="011">011</a></li>
								<li class=""><a href="#" class="ui-select-option"
									data-value="016">016</a></li>
								<li class=""><a href="#" class="ui-select-option"
									data-value="017">017</a></li>
								<li class=""><a href="#" class="ui-select-option"
									data-value="018">018</a></li>
								<li class=""><a href="#" class="ui-select-option"
									data-value="019">019</a></li>
							</ul>
						</div>
					</div>
					<div class="inp">
						<input type="text" id="hpum2" name="hpum2" maxlength="4"
							placeholder="" >
						<button class="btnDelete" style="display: none;">삭제</button>
					</div>
					<div class="inp">
						<input type="text" id="hpum3" name="hpum3" maxlength="4"
							placeholder="">			
						<button class="btnDelete" style="display: none;">삭제</button>
					</div>

				</div>
			<lable>
				<button  type="submit" class="btn btnFull disabled">확인</button>
				</lable>
			</div>
			<!-- //아이디 찾기 -->

			<!-- 비밀번호 찾기 -->
			<div class="findPWD">
				<h2>비밀번호 찾기</h2>

				<div class="tapBox">
					<ul>
						<li>이메일 인증</li>
					</ul>
				</div>

		


				<div class="tapView form formEmail">
					<h3 class="blind"></h3>

					<div class="inp">
						<input type="text" id="hid" name="hid" placeholder="아이디"
							title="아이디">
						<button class="btnDelete">삭제</button>
						
					</div>
			
					<div class="email">
						<div class="inp">
							<input type="text" id="hemail" name="hemail"
								placeholder="이메일" title="이메일">
							<button class="btnDelete">삭제</button>
						</div>
						
							<a></a><span id="findpw">이메일 인증</span></a>
					</div>

					<div class="checkbox mt8">
						<input type="checkbox" id="idCheck" onclick="">
					</div>

				</div>

			</div>
			<!-- //비밀번호 찾기 -->
		</div>

	</div>
</div>