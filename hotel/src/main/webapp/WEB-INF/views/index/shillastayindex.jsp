<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/index/resources/css/index.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
	var hotelname = "${hotelname}";
	if(hotelname == ""){
		hotelname = "stayhub";
	}
</script>

</head>
<body>
	<script type="text/javascript"  src="http://localhost:9000/index/resources/js/header.js"></script>
	<script type="text/javascript"  src="http://localhost:9000/index/resources/js/header_find_hotel.js"></script>
	<div class="index_content">
		<div class='index_add'>
		</div>
		<div class='index_reservation'>
		</div>
		<div class='index_gallery'>
		</div>
		<div class='index_map'>
		</div>
	</div>	
	<script type="text/javascript"  src="http://localhost:9000/index/resources/js/footer.js"></script>
</body>
</html>