<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./include/include.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CCV</title>
<script type="text/javascript">
	if("${msg}" != ""){
		alert("${msg}");
	}
</script>
</head>
<body id = "back_color_body">
<div id = "back_div">
		<video muted autoplay loop>
       		<source src="${path}/video/movie_ccv.mp4" type="video/mp4">
    </video>
</div>
<%@ include file = "./include/footer.jsp" %>
</body>
</html>