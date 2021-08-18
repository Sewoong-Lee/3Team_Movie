<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCV</title>
<link href = "${path}/resources/css/forLocation.css" rel = "stylesheet"/>
<script type="text/javascript">
$(function() {
        $('.location-show').hide();
        $('.col-lg-4').each(function(index){
        	$(this).attr('index', index);
	}).hover(function(){
		$(this).find("p").show();
	}, function() {
		$(this).find("p").hide();
        }).click(function(){
        	var areaNum = $(this).attr('index');
		location.href = "${path}/cinema/location_d?areaNum="+areaNum;
	});
});
</script>
</head>
<body id = "back_color_body">
<section id="ccv_cinema" class="ccv_cinema">
	<div class="container" data-aos="fade-up">

        <div class="section-title">
		<h1>| 극장 찾기 |</h1>
	</div>

	<div class="row-loc">

		<div class="col-lg-4">
			<div class="box" data-aos="zoom-in" data-aos-delay="100">
				<span>Seoul</span>
				<h4>서울</h4>
				<p class = "location-show"><font size="20">홍대 | 신촌 | 강남</font></p>
			</div>
		</div>

		<div class="col-lg-4 mt-4 mt-lg-0">
			<div class="box" data-aos="zoom-in" data-aos-delay="200">
				<span>Incheon</span>
				<h4>인천</h4>
				<p class = "location-show"><font size="20">부평 | 계양</font></p>
			</div>	
		</div>

		<div class="col-lg-4 mt-4 mt-lg-0">
			<div class="box" data-aos="zoom-in" data-aos-delay="300">
				<span>Gyeonggi</span>
				<h4>경기</h4>
				<p class = "location-show"><font size="20">역곡 | 부천역</font></p>
			</div>
		</div>
	</div>
	</div>
</section>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>