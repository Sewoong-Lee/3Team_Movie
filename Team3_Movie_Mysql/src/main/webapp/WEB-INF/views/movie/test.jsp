<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#back_color_body{
   background-color: #1a1313;
}
#back_div{
   width: 100%;
   max-width: 80%;
   margin: auto;
}

.btn.blue {
    background: #4868e1;
    color: #fff;
}

.btn.default {
    min-width: 200px;
}
.bton_in {
    display: inline-block !important;
}

#pcOnlineCardApplyBtn {
    position: relative;
    height: 56px;
    padding: 0 48px;
    border: 1px solid transparent;
    border-radius: 56px;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    line-height: 54px;
    font-weight: 700;
    font-size: 18px;
    white-space: nowrap;
    display: inline-block !important;
    min-width: 200px;
}

</style>


<script type="text/javascript">

$(function() {

	$('#MovieBtn').click(function() {
	var movieName = $('#name').val().replace(/(<([^>]+)>)/ig,"|");
	alert(movieName)

	//유튜뷰 result 
	function youtubeData(data) {
		alert();
		var object = data['items']
		var items = object[0];
	 	var id = items['id'] 
	 	var video = id['videoId']
	 	alert(video);
		$("#movieFrame").attr("src", "https://www.youtube.com/embed/"+video)
	}
		
});

</script>
</head>
<body id="back_color_body">
	<div id="back_div">
	<input type="text" id="name">
 	<button	type="button" id="MovieBtn" >클릭</button>
    <body>
        <iframe id="movieFrame" width="560" height="315" src="https://www.youtube.com/embed/VOdDMmSjle0" frameborder="0" allowfullscreen></iframe>
	</div>
	
	<button type="button"  id="pcOnlineCardApplyBtn"><span>온라인 신청</span></button>
	
	
  </body>

</body>
</html>