<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCV</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=art1gp95i1"></script>
<script>
$(function(){
	var x = "126.9300981";
	var y = "37.4847830";
	var mapOptions = {
	    	//center: new naver.maps.LatLng(37.3595704, 127.105399), //(위도, 경도). 현재 위치는 네이버 본사.
	    	center: new naver.maps.LatLng(y, x),
	    	zoom: 17, //10:광범위, 15:더 디테일
	    	zoomControl: true //줌 컨트롤 표시
	};
	var map = new naver.maps.Map('maps', mapOptions);
	var marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(y, x),
		map: map
	});
});
</script>
<style type="text/css">

#ccvInfo_wrapper{
	margin: 10px;
}

#maps {
	border-style: solid;
	border-color: gray;
}
#address{
	font-weight:100;
	font-size : 18px;
	margin-top: 10px;
	margin-bottom: 20px;
}
</style>
</head>
<body id = "back_color_body">
<%@ include file = "../include/header.jsp" %>
<div id = "ccvInfo_wrapper">
	<h2>CCV(주) 오시는 길</h2>
	<div id="maps" style="width:70%;height:400px;"></div>
	<div id = "address">
		주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : 서울 관악구 신림로 340, 6층<br>
		대표 전화 : 0507-1358-1859
	</div>
</div>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>