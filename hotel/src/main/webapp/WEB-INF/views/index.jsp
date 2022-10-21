<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
</head>
<body>
	<%@ include file="./header.jsp" %>
	<main>
		<article class="hotel-index-content">
			<section class="hotel-index-add">
				<ul>
					<li class="hotel-index-inner add-selected" data-add="1">
						<a href="#"><img src="http://localhost:9000/hotel/resources/img/public/R0000001LVLV_KR.jpg"></a>
					</li>			
					<li class="hotel-index-inner" data-add="2">
						<a href="#"><img src="http://localhost:9000/hotel/resources/img/public/R0000001MSQM_KR.jpg"></a>
					</li>			
					<li class="hotel-index-inner" data-add="3">
						<a href="#"><img src="http://localhost:9000/hotel/resources/img/public/R0000001P009_KR.jpg"></a>
					</li>			
				</ul>
				<div class="hotel-index-add-btn">
					<a class="hotel-index-add-btn-prve" href="javascript:addprve()"><img src="http://localhost:9000/hotel/resources/img/public/mvBtnSlide.png"></a>
					<a class="hotel-index-add-btn-next" href="javascript:addnext()"><img src="http://localhost:9000/hotel/resources/img/public/mvBtnSlide.png"></a>
				</div>			
			</section>
			<section class="hotel-index-reservation">
			
			</section>
			<section class="hotel-index-event">
			
			</section>
			<section class="hotel-index-event">
			
			</section>
			
			<section class="hotel-index-shillawars">
				<div class="hotel-index-shillawars-back">
					<div class="hotel-index-shillawars-inner">
						<div class="hotel-index-shillawars-inner-top">
							<div class="hotel-index-shillawars-inner-top-left">
								<img class="index-shillawars-img" src="http://localhost:9000/hotel/resources/img/public/rwTitle.gif">
								<img class="index-shillawars-img" src="http://localhost:9000/hotel/resources/img/public/rwBenefit.gif">
							</div>
							<div class="hotel-index-shillawars-inner-top-right">
								<img class="index-shillawars-img" src="http://localhost:9000/hotel/resources/img/public/rwCard.png">
							</div>
						</div>
						<div  class="hotel-index-shillawars-inner-bottom">
							<img src="http://localhost:9000/hotel/resources/img/public/rwDesc1.gif">
							<img src="http://localhost:9000/hotel/resources/img/public/rwDesc2.gif">
							<img src="http://localhost:9000/hotel/resources/img/public/rwDesc3.gif">
						</div>
					</div>
					<div class="hotel-tripadvisor-api">
						<div id="TA_selfserveprop460" class="TA_selfserveprop">
						</div>
						<script async="" src="https://www.tripadvisor.co.kr/WidgetEmbed-selfserveprop?wtype=selfserveprop&amp;uniq=460&amp;locationId=9452203&amp;lang=ko&amp;rating=true&amp;nreviews=0&amp;writereviewlink=false&amp;popIdx=false&amp;iswide=false&amp;border=false&amp;display_version=2"></script>
					</div>
				</div>
			</section>
		</article>
	</main>
 	<%@ include file="./footer.jsp" %>
 	<script>
 		function addnext(){
 			let selected = $(".add-selected") 
 			let addnum = selected.data("add");
 			let totalnum = $("[data-add]").length;
 			if(addnum == totalnum){
 				selected.removeClass("add-selected");
 				$("[data-add=1]").addClass("add-selected");
 			}else{
 				let newnum = addnum + 1 
 				selected.removeClass("add-selected");
 				$("[data-add="+newnum+"]").addClass("add-selected");
 			}
 		}
 		
 		function addprve(){
 			let selected = $(".add-selected") 
 			let addnum = selected.data("add");
 			let totalnum = $("[data-add]").length;
 			if(addnum == 1){
 				selected.removeClass("add-selected");
 				$("[data-add="+totalnum+"]").addClass("add-selected");
 			}else{
 				let newnum = addnum - 1 
 				selected.removeClass("add-selected");
 				$("[data-add="+newnum+"]").addClass("add-selected");
 			}
 		}	
 	$(document).ready(function(){
 		setInterval(function(){
 			let selected = $(".add-selected") 
 			let addnum = selected.data("add");
 			let totalnum = $("[data-add]").length;
 			if(addnum == totalnum){
 				selected.removeClass("add-selected");
 				$("[data-add=1]").addClass("add-selected");
 			}else{
 				let newnum = addnum + 1 
 				selected.removeClass("add-selected");
 				$("[data-add="+newnum+"]").addClass("add-selected");
 			}	
 		},5000);
 	})
 	</script>
</body>
</html>