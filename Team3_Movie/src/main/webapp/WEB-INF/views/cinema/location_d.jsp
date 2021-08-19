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
$(function() {
        $('.loc-cinema-info').hide();
        $('img').hover(function(){
        	$(this).next().show();
	}, function() {
		$(this).next().hide();
	});
});
</script>
</head>
<body id = "back_color_body" onload = "init()">
<%@ include file = "../include/header.jsp" %>
<div class="row-loc">
	<div class = "area" id = "0">
		<span class = "loc">| 홍대 |<span class = "loc-address">서울특별시 마포구 양화로 153 (동교동) 4층</span></span>
		<div class = "loc-img" id = "hongdae">
			<img src="${path}/resources/img/hongdae.jpg" data-aos="zoom-in" data-aos-delay="100">
			<p class = "loc-cinema-info">
				TEL : 1544-1122<br>
				주차정보<br>
				- CGV홍대는 인근 일대가 교통이 혼잡하여 주차장을 운영하지 않으니 양해 부탁 드립니다.<br>
				- 건물 내 주차장이 없으니 주차장 이용 시 인근 주차장 이용 부탁 드립니다.
			</p>
		</div>
		<span class = "loc">| 신촌 |<span class = "loc-address">서울특별시 서대문구 신촌로 129 , 2층(창천동)</span></span>
		<div class = "loc-img" id = "sinchon">
			<img src="${path}/resources/img/sinchon.jpg" data-aos="zoom-in" data-aos-delay="100">
			<p class = "loc-cinema-info">
				TEL : 1544-1122<br>
				주차정보<br>
				- 아트레온 건물에서 운영하는 주차타워이며, 매우 협소하므로 대중교통 이용을 부탁드립니다.<br>
				- 아트레온 주차타워 이용시간 : 09~20시 운영 
			</p>
		</div>
		<span class = "loc">| 강남 |<span class = "loc-address">서울특별시 강남구 강남대로 438 (역삼동)</span></span>
		<div class = "loc-img" id = "gangnam">
			<img src="${path}/resources/img/gangnam.jpg" data-aos="zoom-in" data-aos-delay="100">
			<p class = "loc-cinema-info">
				TEL : 1544-1122<br>
				주차정보<br>
				- 위치: 건물 지하2F ~ 지하4F<br>
				- CGV 영화 관람 시 주차 3시간 6,000원(발렛서비스 운영시간 : 오전 8시 이후 ~ 오후 20시)
			</p>
		</div>
	</div>
	<div class = "area" id = "1">
		<span class = "loc">| 부평 |<span class = "loc-address">인천광역시 부평구 마장로 489(청천동)</span></span>
		<div class = "loc-img" id = "bupyeong">
			<img src="${path}/resources/img/bupyeong.jpg" data-aos="zoom-in" data-aos-delay="100">
			<p class = "loc-cinema-info">
				TEL : 1544-1122<br>
				주차정보<br>
				- 지상 주차장: 지상1층 ~ 3층<br>
				- 주차 확인: 주차 공간이 협소하므로 가급적 대중교통을 이용해주시기 바랍니다.
			</p>
		</div>
		<span class = "loc">| 계양 |<span class = "loc-address">인천광역시 계양구 장제로 738, 8층(작전동)</span></span>
		<div class = "loc-img" id = "gyeyang">
			<img src="${path}/resources/img/gyeyang.jpg">
			<p class = "loc-cinema-info">
				TEL : 1544-1122<br>
				주차정보<br>
				- 메트로몰 건물 정면 왼쪽 편에 위치<br>
				- 평일/주말: 당일 관람 티켓 소지 후 주차인증시, 최초 3시간 무료 (초과 시 30분당 500원)
			</p>
		</div>
	</div>
	<div class = "area" id = "2">
		<span class = "loc">| 역곡 |<span class = "loc-address">경기도 부천시 경인로 505, 6층(괴안동)</span></span>
		<div class = "loc-img" id = "yeokgok">
			<img src="${path}/resources/img/yeokgok.jpg">
			<p class = "loc-cinema-info">
				TEL : 1544-1122<br>
				주차정보<br>
				- 지하주차장B1~B3 (역곡역 하이뷰 건물 뒷편에 주차장 입구 위치)<br>
				- 4시간 무료, 추가 10분당 500원 추가 금액 발생.
			</p>
		</div>
		<span class = "loc">| 부천역 |<span class = "loc-address">경기도 부천시 부일로 460(심곡동, 시네마존 6층~11층)</span></span>
		<div class = "loc-img" id = "bucheonSta">
			<img src="${path}/resources/img/bucheonSta.jpg">
			<p class = "loc-cinema-info">
				TEL : 1544-1122<br>
				주차정보<br>
				- 매점에서 당일 영화 티켓 제시 후 차량번호 인증 시 3시간 무료(3시간 초과 시 10분당 500원)<br>
				- 매점 인증 출차에 한하여 3시간 무료 적용 가능. (미 인증 시 요금 부과)
			</p>
		</div>
	</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>