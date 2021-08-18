<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCV</title>
<link href = "${path}/resources/css/forLocation_d.css" rel = "stylesheet"/>
<script type="text/javascript">
function init() {
	$('.area').hide();
	$('#${areaNum}').show();
};
</script>
</head>
<body id = "back_color_body" onload = "init()">
	<div class = "area" id = "0">
		<span class = "loc">| 홍대 |<span class = "loc-address">서울특별시 마포구 양화로 153 (동교동) 4층</span></span>
		<div id = "loc-map-Hongdae">
			<img src="${path}/resources/img/hongdae.jpg">
		</div>
		<span class = "loc">| 신촌 |<span class = "loc-address">서울특별시 서대문구 신촌로 129 , 2층(창천동)</span></span>
		<div id = "loc-map-Sinchon">
			<img src="${path}/resources/img/sinchon.jpg">
		</div>
		<span class = "loc">| 강남 |<span class = "loc-address">서울특별시 강남구 강남대로 438 (역삼동)</span></span>
		<div id = "loc-map-Gangnam">
			<img src="${path}/resources/img/gangnam.jpg">
		</div>
	</div>
	<div class = "area" id = "1">
		<span class = "loc">| 부평 |<span class = "loc-address">인천광역시 부평구 마장로 489(청천동)</span></span>
		<div id = "loc-map-Bupyeong">
			<img src="${path}/resources/img/bupyeong.jpg">
		</div>
		<span class = "loc">| 계양 |<span class = "loc-address">인천광역시 계양구 장제로 738, 8층(작전동)</span></span>
		<div id = "loc-map-Gyeyang">
			<img src="${path}/resources/img/gyeyang.jpg">
		</div>
	</div>
	<div class = "area" id = "2">
		<span class = "loc">| 역곡 |<span class = "loc-address">경기도 부천시 경인로 505, 6층(괴안동)</span></span>
		<div id = "loc-map-Yeokgok">
			<img src="${path}/resources/img/yeokgok.jpg">
		</div>
		<span class = "loc">| 부천역 |<span class = "loc-address">경기도 부천시 부일로 460(심곡동, 시네마존 6층~11층)</span></span>
		<div id = "loc-map-BucheonSta">
			<img src="${path}/resources/img/bucheonSta.jpg">
		</div>
	</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>