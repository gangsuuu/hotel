<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항상 즐거움이 있는 SHILLA STAY!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<script>
var xhr = new XMLHttpRequest();
var url = 'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'XdvMF5F6YqN7QIpIeiPsz8J%2B5JtczuHgcmaTPjZJtZ98%2Bx%2BDfhy336EpoA%2B60DMhtOFKjI8WOIfXP6BteE4l0g%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20221023'); /**/
queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0500'); /**/
queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        
    }
};

xhr.send('');
</script>
<script>
window.initMap = function () {
		  
	//map 생성
	const map = new google.maps.Map(document.getElementById("index-map"), {
	    center: { lat:37.57251305, lng:126.981117 },
	    zoom: 18,
	  });
		
	  //마커 생성
	const malls =[
		{ label: "testlabel", name:"신라스테이 광화문", lat:37.57251305, lng:126.981117}
	];
/* 	
	  const icon = {
			  scale: 10,
			  fillColor:"#aaa",
			  size: new google.maps.Size(100,100),
			  origin:new google.maps.Point(0,0),
			  anchor:new google.maps.Point(20,40),
			  scaledSzie:new google.maps.Size(40,40)
	  }
	   */
	//불필요한 마커 제거
	const bounds = new google.maps.LatLngBounds();
	//클릭시 정보 출력
	const infowindow = new google.maps.InfoWindow();
	
	//마커 입력
	malls.forEach(({label, name, lat, lng }) => {
		const marker = new google.maps.Marker({
			position: {lat, lng},
			label,
			map: map,
			
			//icon:icon
		});
		bounds.extend(marker.position);
		marker.setIcon({
		})
		//클릭이벤트
		marker.addListener("click",() => {
			map.panTo(marker.position);
			infowindow.setContent(name);
			infowindow.open({ 
				anchor: marker,
				map,
				
			});
		});
	});
	
	//맵크기 bounds에 맞추기 - 사이즈 늘어나는 문제 발생 
	//map.fitBounds(bounds);	
		
};//맵생성 끝

		
		
</script>
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC29mL81BkLdwdYndft57DGBaTMFi8y14o&callback=initMap"></script>
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
			<section class="hotel-index-event">
				<c:forEach var="noticeVO"  items="${eventlist}">
					<article class="hotel-index-article">
						<div>
							<a class="hotel-index-event-box" href="http://localhost:9000/hotel/notice_content.do?nid=${noticeVO.nid }">
                        		<img src="http://localhost:9000/hotel/resources/upload/${noticeVO.nsfile}">
                        	</a>
							<h3>${noticeVO.ntitle }</h3>
							<p>${noticeVO.ncontent }</p>
						</div>
					</article>
				</c:forEach>
			</section>
			
			
			<section class="hotel-index-map-container">
				<div class="hotel-index-map-info">
					<h2>신라스테이 광화문 소개</h2>
					<p>대한민국의 아름다운 역사, 문화, 비즈니스 중심 광화문에</p>
					<p>호텔신라의 프리미엄 비즈니스 신라스테이를 선보입니다.</p>
					<p>모던한 인테리어의 338개 객실</p>
					<p>경북궁, 한옥마을, 서울의 N타워도 인접한 관광지근교 호텔</p>
				</div>
				<div class="hotel-index-map" id="index-map">
				</div>
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
 	<script>
	let date = new Date();
	let year = date.getUTCFullYear();
	let	month= date.getMonth() + 1;
	let	day = date.getDate();
	let today = year+""+month+""+day;
	var hours = date.getHours();
	var minutes = date.getMinutes()
	
	
	let yesterday = new Date(date.setDate(date.getDate()-1));
	let yesterdayinput
	let year_yesterday = yesterday.getUTCFullYear();
	let	month_yesterday = yesterday.getMonth() + 1;
	let	day_yesterday = yesterday.getDate();
	
	
	let tomorrow = new Date(date.setDate(date.getDate()+1));
	let year_tomorrow= yesterday.getUTCFullYear();
	let	month_tomorrow = yesterday.getMonth() + 1;
	let	day_tomorrow = yesterday.getDate();
	tomorrow = year_tomorrow+""+month_tomorrow+""+day_tomorrow
	
	var xhr = new XMLHttpRequest();
	var url = 'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'XdvMF5F6YqN7QIpIeiPsz8J%2B5JtczuHgcmaTPjZJtZ98%2Bx%2BDfhy336EpoA%2B60DMhtOFKjI8WOIfXP6BteE4l0g%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
	queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
	
		if(hours < 10){
			if(hours < 5){
			yesterday = year_yesterday+""+month_yesterday+""+day_yesterday;
			queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(yesterday); /**/
			}else{
				queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(today); /**/
			}
			hours = "0"+hours+"00"
		}else{
			hours = hours+"00"
			queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(today); /**/
		}
	
	queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0500'); /**/
	queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
	queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('127'); /**/
	xhr.open('GET', url + queryParams);
xhr.onreadystatechange = function () {
    if (this.readyState == 4) {
        //alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
        var weather = JSON.parse(this.response);
       	var weatherinfo
       	var sky
       	var weathertext = ""
        //alert(weather.response.body.items.item.length());
        let data = weather.response.body.items.item ;
		//let i = 1
		
		for(var i = 0; i < data.length; i++ ){
			if(data[i].category == "PTY" && data[i].fcstTime == hours && data[i].fcstDate == today){
				weatherinfo = data[i].fcstValue;
			}
			if(data[i].category == "SKY" && data[i].fcstTime == hours && data[i].fcstDate == today){
				sky = data[i].fcstValue;
        	}
		}
		
        weathertext += "<div class='hotel-map-weather-img'>"  
        if(sky == 0){
       		weathertext += "<img src='http://localhost:9000/hotel/resources/img/public/sun.png'>"
        }else{
	       	switch(parseInt(weatherinfo)){
		       	case 0:
		       		weathertext += "<img src='http://localhost:9000/hotel/resources/img/public/sun.png'>"       	
		       	break;
		       	case 1:
		       		weathertext += "<img src='http://localhost:9000/hotel/resources/img/public/rainy.png'>"  
		       	break;
		       	case 2:
		       		weathertext += "<img src='http://localhost:9000/hotel/resources/img/public/rainy.png'>" 
		       	break;
		       	case 3:
		       		weathertext += "<img src='http://localhost:9000/hotel/resources/img/public/snowflake.png'>" 
		       	break;
		       	case 5:
		       		weathertext += "<img src='http://localhost:9000/hotel/resources/img/public/snowflake.png'>" 
		       	break;
		       	case 6:
		       		weathertext += "<img src='http://localhost:9000/hotel/resources/img/public/snowflake.png'>" 
		       	break;
      	 	}
        }
        
        
        weathertext += "</div>"
        if(date.getHours() < 10){
        	hours = "0"+date.getHours()
        }else{
        	hours = date.getHours()
        }
        if(minutes < 10){
        	minutes = "0"+date.getMinutes()
        }
        weathertext += "<p>"+year+"년 "+month+"월"+day+"일 "+hours+" : "+minutes+"</p>" 
        $(".hotel-index-weather-content").append(weathertext);
    }
	};
	xhr.send('');
</script>
</body>
</html>