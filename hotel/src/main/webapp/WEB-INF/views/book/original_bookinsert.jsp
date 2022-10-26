<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<script>    
 	$(document).ready(function () {            
 		$.datepicker.setDefaults($.datepicker.regional['ko']);             
 		$( ".sdate" ).datepicker({                 
 			changeMonth: true,                  
 			changeYear: true,                 
 			nextText: '다음 달',                 
 			prevText: '이전 달',                  
 			dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],                 
 			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],                  
 			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
 			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
 			dateFormat: "yymmdd",                 minDate: 0,                       
 			// 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 가능)                 
 			onClose: function( selectedDate ) {                          
 				//시작일(startDate) datepicker가 닫힐때                      
 				//종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정                     
 				$(this).datepicker( "option", "minDate", selectedDate );                 
 				}                 
 				});            
 				$( ".edate" ).datepicker({                 
 					changeMonth: true,                  
 					changeYear: true,                 
 					nextText: '다음 달',                 
 					prevText: '이전 달',                  
 					dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],                 
 					dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],                  
 					monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
 					monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],                 
 					dateFormat: "yymmdd",                 minDate: 0,                       
 					// 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)                 
 					onClose: function( selectedDate ) {                         
 						// 종료일(endDate) datepicker가 닫힐때                     
 						// 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정                     
 						$(this).datepicker( "option", "maxDate", selectedDate );  
 						}                 
 						}); 
 						});
 	
 	
 	</script>
 	<script type="text/javascript">
 	function finaldecision(){
 	    var mid = document.getElementById('mid').value;
 		var bid = document.getElementById('bid').value;
 		var price = document.getElementById('price').value;
 		var radatestart = document.getElementById('startDate_').value;
 		var radateend = document.getElementById('endDate_').value;
 	 		
 	 		if(radatestart==""){
 	 			alert("입실날짜를 입력해 주세요"); 
 	 			location.reload(true);
 	 		 }else if(radateend==""){
 	 			alert("퇴실날짜를 입력해 주세요");
 	 			location.reload(true);
 	 		}else{ 			
 	 			bookinsert.submit();
 	 		}
 	 		 
 	 	
 		
 	}
 	</script>
 	
<title>Insert title here</title>
</head>
<body>

	<form name="bookinsert" action="roombook.do" method="POST">
	
	<input type="hidden" name="mid" id="mid" value="${svo.mid}"/>
	<input type="hidden" name="bid" id="bid" value="${vo.bid}"/>
		<div align="center">
			<table border="1">
				<tr>
						<th width="30px">ROOM PICTURE</th>
						<th width="150px">ROOM NAME</th>
						<th width="100px">PRICE</th>
						<th>RESERVATION</th>
					</tr>
					
					<tr>
						<td align="center">
						<input type="hidden" name="bsfile" id="bsfile" value="${vo.bsfile}" />
						<img src="http://localhost:9000/hotel/resources/upload/${vo.bsfile}" width="200"></a></td>
						<td><input type="hidden" name="brname" id="brname" value="${vo.brname}"/>${vo.brname}</td>
						<td><input type="hidden" name="price" id="price" value="${vo.bprice}" />${vo.bprice}</td>
						<td>
						<input type="text" name="radatestart" id="startDate_" class="sdate">
						<input type="text" name="radateend" id="endDate_" class="edate">
	  					</td>	
					</tr>
			</table>
						<input type="button" onclick="finaldecision()" value="예약 하러가기">
		</div>
	</form>
</body>
</html>







