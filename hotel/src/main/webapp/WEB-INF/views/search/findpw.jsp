<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script>
	/** $(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/search/findpw.do",
				type : "POST",
				data : {
					id : $("#hid").val(),
					email : $("#hemail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	}) **/
</script>
<title>비밀번호 찾기</title>
</head>
<body>
<div class="content">
   <h3>비밀번호 찾기</h3>	
   <form name="findfwForm"  action="findpw.do"  method="post">
				
			<div>
				<p>
					<label>아이디</label>
					<input class="" type="text" id="hid" name="hid" placeholder="아이디를 입력하세요" required>
				</p>
				<p>
					<label>이메일</label>
					<input class="" type="text" id="hemail" name="hemail" placeholder="이메일주소를 입력하세요" required>
				</p>
				<p class="">
					<button type="submit" >찾기</button>
					<button type="button" onclick="location.href = 'http://localhost:9000/hotel/login.do';" class="">로그인으로</button>
				</p>
			</div>
	</form>
</div>
</body>
</html>