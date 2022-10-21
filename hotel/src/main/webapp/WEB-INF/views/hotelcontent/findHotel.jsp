<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/index.css">
<link rel="stylesheet" href="http://localhost:9000/hotel/resources/css/aboutShillaStay.css">
<script>
	var hotelname = "stayhub";
</script>
<script>
window.initMap = function () {
		  
	//map 생성
	const map = new google.maps.Map(document.getElementById("hub_map"), {
	    center: { lat: 37.5400456, lng: 126.9921017 },
	    zoom: 12,
	  });
		
	  //마커 생성
	const malls =[
		{ label: "testlabel", name:"신라스테이 광화문", lat:37.57251305, lng:126.981117},
		{ label: "2", name:"신라스테이 마포", lat:37.542767, lng:126.94967},
		{ label: "3", name:"신라스테이 서대문", lat:37.5651615, lng:126.9667489},
		{ label: "4", name:"신라스테이 역삼", lat:37.5047692, lng:126.0413084},
		{ label: "5", name:"신라스테이 서초", lat:37.4894208, lng:127.0301258},
		{ label: "6", name:"신라스테이 구로", lat:37.4856291, lng:126.9045688},
		{ label: "7", name:"신라스테이 삼성", lat:37.5099527, lng:127.0631277},
		{ label: "8", name:"신라스테이 동탄", lat:37.2025012, lng:127.0731931},
		{ label: "9", name:"신라스테이 천안", lat:36.825689, lng:127.143073},
		{ label: "10", name:"신라스테이 울산", lat:35.3574199, lng:129.3291229},
		
		{ label: "11", name:"신라스테이 해운대", lat:35.1598682, lng:129.1586644},
		{ label: "12", name:"신라스테이 서부산", lat:35.0966282, lng:128.9051005},
		{ label: "13", name:"신라스테이 제주", lat:33.4855795, lng:126.4909647},
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
<body>
    <script type="text/javascript"  src="http://localhost:9000/hotel/resources/js/header.js"></script>
    <div class="content">
    		<div class="loacation">
   			<span>위치찾기</span>
    		</div>
            <div class="map_list_container">
                <div class=map_hotellist>
                    <ul>
                        <li>
                        	<img src="http://localhost:9000/hotel/resources/img/findHotel/hotelList_tit01.gif">
	                        <a href="#">신라스테이 광화문</a>
	                        <a href="#">신라스테이 마포</a>
	                        <a href="#">신라스테이 서대문</a>
                        </li>
                        <li>
                        <img src="http://localhost:9000/hotelresources/img/findHotel/hotelList_tit02.gif">
	                        <a href="#">신라스테이 역삼</a>
	                        <a href="#">신라스테이 서초</a>
	                        <a href="#">신라스테이 구로</a>
	                        <a href="#">신라스테이 삼성</a>
	                   </li>                        
                        <li>
                        <img src="http://localhost:9000/hotel/resources/img/findHotel/hotelList_tit03.gif">
                        <a href="#">신라스테이 동탄</a>
                        <a href="#">신라스테이 천안</a>
                        <a href="#">신라스테이 울산</a>
                        <a href="#">신라스테이 헤운대</a>
                        <a href="#">신라스테이 서부산</a>
                        <a href="#">신라스테이 제주</a>
                        </li>
                    </ul>
                </div>
            </div>
        <div class="content_menu">
           <div id="hub_map"></div>
        </div>
    </div>
</body>
</html>